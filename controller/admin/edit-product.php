<?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $id = (int) $_GET['id'];    
        if (isset($id)) {
            include "../../model/thuvien.php";
            $conn = ketnoidb();
    
            $sql = "SELECT * FROM sanpham WHERE MaSP = $id";
            $result = mysqLi_query($conn, $sql);
            $row = mysqli_fetch_assoc($result);
    
            $ten = $_POST['name'];
            $trangthai = (int) $_POST['status'];
            $giaban = $_POST['price'];
            $loaisp = (int) $_POST['category'];
            $mota = $_POST['description'];
    
            $anh = $_FILES['image']['name'];
            $removeImage = (int) $_POST['removeImage'];
            $currentImage = $_POST['imageFileName']; 
    
        
            if ($removeImage == 1 && !empty($row['HinhAnh']) && file_exists("../../view/img/product/" . $row['HinhAnh'])) {
                unlink("../../view/img/product/" . $row['HinhAnh']);
            }
            
            if (!empty($anh)) {
                move_uploaded_file($_FILES['image']['tmp_name'], "../../view/img/product/" . basename($anh));
                $update = "UPDATE sanpham SET MaLoaiSP = '$loaisp', TenSP = '$ten', DonGia = '$giaban', MoTa = '$mota', HinhAnh = '$anh', TrangThai = '$trangthai' WHERE MaSP = $id";
            } else {
                $update = "UPDATE sanpham SET MaLoaiSP = '$loaisp', TenSP = '$ten', DonGia = '$giaban', MoTa = '$mota', HinhAnh = '$currentImage', TrangThai = '$trangthai' WHERE MaSP = $id";
            }
    
            mysqLi_query($conn, $update);
    
            header('Location: ../../view/admin/admin.product.php');
            exit;
        }
    }    
?>
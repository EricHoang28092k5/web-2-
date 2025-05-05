<?php
    include "../../model/thuvien.php";
    $conn = ketnoidb();

    if($_SERVER["REQUEST_METHOD"] == "POST"){
        $tensp = $_POST['name'];
        $trangthai = (int) $_POST['status'];
        $giaban = $_POST['price'];
        $loaisp = (int) $_POST['category'];
        $mota = $_POST['description'];
        $anh = $_FILES['image']['name'];
        move_uploaded_file($_FILES['image']['tmp_name'], "../../view/img/product/" . basename($anh));

        $sql = "INSERT INTO sanpham (MaLoaiSP, TenSP, DonGia, SoLuongBan, MoTa, HinhAnh, TrangThai) VALUES ('$loaisp', '$tensp', $giaban, 0, '$mota', '$anh', '$trangthai' )";

        mysqli_query($conn, $sql);

        header("Location: ../../view/admin/admin.product.php");
    }

    
?>
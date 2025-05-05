<?php
    include "../../model/thuvien.php";
    $conn = ketnoidb();

    if (isset($_GET['id'])) {
        $id = (int) $_GET['id'];
        $sql = "SELECT * FROM sanpham WHERE MaSP = $id";
        $result = mysqLi_query($conn, $sql);
        $row = mysqli_fetch_assoc($result);
        unlink("../../view/img/product/" . $row['HinhAnh']);

        $sql2 = "DELETE FROM sanpham WHERE MaSP = $id";

        if (mysqli_query($conn, $sql2)) {
            echo "Sản phẩm đã được xóa thành công!";
        } else {
            echo "Lỗi khi xóa sản phẩm!";
        }
    }

    mysqli_close($conn);
?>

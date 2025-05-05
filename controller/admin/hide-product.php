<?php
    include "../../model/thuvien.php";
    $conn = ketnoidb();

    if (isset($_GET['id'])) {
        $id = (int) $_GET['id'];
        $sql = "UPDATE sanpham SET TrangThai = 0 WHERE MaSP = $id";

        if (mysqli_query($conn, $sql)) {
            echo "Sản phẩm đã được ẩn!";
        } else {
            echo "Lỗi khi cập nhật trạng thái!";
        }
    }

    mysqli_close($conn);
?>

<?php
session_start();
unset($_SESSION['tenNguoiDung']);
unset($_SESSION['tenDangNhap']);
unset($_SESSION['email']);
unset($_SESSION['password']);
unset($_SESSION['sdt']);
unset($_SESSION['diaChi']);
unset($_SESSION['quan_huyen']);
unset($_SESSION['phuong_xa']);
unset($_SESSION['role']); 
header("location:../controller/index.php");
exit(); 
?>
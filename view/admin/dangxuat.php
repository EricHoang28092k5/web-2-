<?php 
session_start();
if(isset($_SESSION['tenNguoiDung'])){
    unset($_SESSION['tenNguoiDung']);

}
header("location: index.php");
?>
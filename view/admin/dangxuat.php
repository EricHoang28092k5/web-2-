<?php
session_start();
unset($_SESSION['tennguoidung']);
header("location: index.php");
?>
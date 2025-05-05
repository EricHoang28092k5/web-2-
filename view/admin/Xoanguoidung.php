<?php
session_start();
if(!isset($_SESSION['tenNguoiDung'])){
  header("location: index.php");
}
?>
<?php 
  include "../../model/thuvien.php";
  $conn = ketnoidb();
if (!$conn) {
 die("Lỗi: Không thể kết nối MySQL.");
}
if(!isset($_GET['this_id'])){
  header("location: index.php");
}
$thisid=$_GET['this_id'];
$trangthai=$_GET['this_tt'];
if($trangthai==1){
    $trangthai=2;

}
else{
    $trangthai=1;
}
$sql="UPDATE nguoidung SET TrangThai='$trangthai' WHERE id_nguoidung='$thisid'";
mysqLi_query($conn,$sql);
header("location:quanlytk.php");
exit();

?>
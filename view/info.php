<?php
session_start();
include '../model/thuvien.php';

// Kiểm tra đăng nhập
$isLoggedIn = isset($_SESSION['tenDangNhap']);

// Nếu chưa đăng nhập, chuyển hướng về trang đăng nhập
if (!$isLoggedIn) {
    header("location: signIn.php");
    exit();
}

$email = $_SESSION['email'];
$conn = ketnoidb();
$sql = "SELECT * FROM nguoidung WHERE email = '$email'";
$result = $conn->query($sql);

if($result && $result->num_rows>0){
  $row = $result->fetch_assoc();

  $tenNguoiDung = $row['tenNguoiDung'];
  $tenDangNhap = $row['tenDangNhap'];
  $sdt = $row['sdt'];
  $diaChi = $row['diaChi'];
  $quan_huyen = $row['quan_huyen'];
  $phuong_xa = $row['phuong_xa'];
}

// Include header
include 'header.php';
?>

<div class="container" style="max-width: 800px; margin: 40px auto; padding: 30px; box-shadow: 0 3px 15px rgba(0,0,0,0.1); border-radius: 10px; background-color: #fff;">
    <h2 style="text-align: center; color: #2c3e50; margin-bottom: 30px; font-size: 24px; font-weight: 600; position: relative; padding-bottom: 15px;">THÔNG TIN CÁ NHÂN</h2>
    
    <style>
        .info-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0,0,0,0.08);
        }
        
        .info-table th, 
        .info-table td {
            padding: 16px 20px;
            text-align: left;
            border-bottom: 1px solid #eaeaea;
        }
        
        .info-table tr:last-child th,
        .info-table tr:last-child td {
            border-bottom: none;
        }
        
        .info-table th {
            background-color: #f8f9fa;
            font-weight: 600;
            color: #444;
            width: 30%;
        }
        
        .info-table td {
            background-color: #fff;
        }
        
        .info-table tr:hover td {
            background-color: #f9f9f9;
        }
        
        .btn-back {
            display: inline-block;
            background-color: #F37319;
            color: white;
            padding: 12px 25px;
            text-decoration: none;
            border-radius: 5px;
            font-weight: 500;
            transition: background-color 0.3s;
            margin-top: 30px;
        }
        
        .btn-back:hover {
            background-color: #e66700;
        }

        /* Footer */
        footer {
        position: relative;
        width: 100%;
        height: auto;
        padding: 50px 100px;
        background-color: #fff;
        border-top: 1px solid #ccd;
        }

        footer .container {
        width: 100%;
        display: grid;
        grid-template-columns: 2fr 1fr 1fr 1fr;
        grid-gap: 20px;
        }

        footer .container .sec h2 {
        position: relative;
        color: black;
        font-weight: 600;
        margin-bottom: 15px;
        }

        footer .container .sec p {
        color: #555;
        }

        footer .container .sci {
        margin-top: 20px;
        display: grid;
        grid-template-columns: repeat(4, 50px);
        }

        footer .container .sci li {
        list-style: none;
        }

        footer .container .sci li a {
        display: inline-block;
        width: 36px;
        height: 36px;
        background-color: #f37319;
        display: grid;
        align-content: center;
        justify-content: center;
        text-decoration: none;
        }

        footer .container .sci li a i {
        color: #fff;
        font-size: 20px;
        }

        footer .container .quicklinks {
        position: relative;
        }

        footer .container .quicklinks ul li {
        list-style: none;
        }

        footer .container .quicklinks ul li a {
        color: #555;
        text-decoration: none;
        margin-bottom: 10px;
        display: inline-block;
        }

        footer .container .contact .info {
        position: relative;
        }

        footer .container .contact .info li {
        display: grid;
        grid-template-columns: 30px 1fr;
        margin-bottom: 16px;
        }

        footer .container .contact .info li span {
        color: #555;
        font-size: 20px;
        }

        footer .container .contact .info li a {
        color: #555;
        text-decoration: none;
        }

        .copyrightText {
        width: 100%;
        background-color: #fff;
        padding: 20px 100px 30px;
        text-align: center;
        color: #555;
        border: 1px solid rgba(0, 0, 0, 0.15);
        }

        /* Headline */
        .headline {
        text-align: center;
        margin: 20px auto;
        }

        .headline .section-title {
        font-size: 24px;
        font-weight: bold;
        color: #000;
        text-transform: uppercase;
        display: inline-block;
        }

        .headline .header-underline {
        width: 200px;
        height: 3px;
        background-color: #f37319;
        margin: 5px auto 0;
        }
        /* Products */
        .products {
        list-style-type: none;
        padding: 0;
        margin: 0 auto;
        display: flex;
        justify-content: space-between;
        gap: 20px;
        flex-wrap: wrap;
        }

        .products-item {
        text-align: center;
        border-radius: 8px;
        width: calc(25% - 20px);
        background-color: #fff;
        overflow: hidden;
        margin-bottom: 20px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        flex-direction: column;
        }

        .products-item:hover {
        transform: translateY(-10px);
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        .product-thumb img {
        width: 100%;
        height: 170px;
        object-fit: cover;
        transition: transform 0.3s ease;
        }

        .product-thumb:hover img {
        transform: scale(1.1);
        }

        .product-info {
        padding: 10px;
        flex-grow: 1;
        }

        .product-name {
        font-size: 18px;
        text-decoration: none;
        font-weight: bold;
        color: black;
        margin-bottom: 5px;
        }

        .product-price {
        font-size: 24px;
        margin-bottom: 10px;
        }

        .product-price .price {
        font-size: 19px;
        font-weight: bold;
        color: red;
        }
        .currency {
        font-size: 18px;
        vertical-align: top;
        }

        input[type="submit"] {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        background-color: #f37319;
        color: #fff;
        padding: 10px 20px;
        border: none;
        border-radius: 20px;
        cursor: pointer;
        width: 100%;
        text-align: center;
        font-size: 16px;
        font-weight: bold;
        transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
        background-color: #f37319;
        }

        /* pagination */
        .pagination {
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 0;
        list-style: none;
        }
        .product_pagination {
        margin-bottom: 30px;
        }
        .pagination_item {
        margin: 0 6px;
        }
        .pagination_item_link {
        display: block;
        text-decoration: none;
        color: #939393;
        font-weight: 400;
        font-size: 1.2rem;
        min-width: 35px;
        height: 35px;
        text-align: center;
        line-height: 35px;
        border-radius: 5px;
        border: 1px solid #ddd;
        transition: 0.3s;
        }
        .pagination_item_link:hover {
        background-color: #f37319;
        color: white;
        }
        .pagination_active .pagination_item_link {
        background-color: #f37319;
        color: white;
        font-weight: bold;
        }
        .pagination_active .pagination_item_link:hover {
        background-color: #ea7f1f;
        }

    </style>
    
    <table class="info-table">
        <tr>
            <th>Họ và tên</th>
            <td><?php echo $tenNguoiDung; ?></td>
        </tr>
        <tr>
            <th>Tên đăng nhập</th>
            <td><?php echo $tenDangNhap; ?></td>
        </tr>
        <tr>
            <th>Email</th>
            <td><?php echo $email; ?></td>
        </tr>
        <tr>
            <th>Số điện thoại</th>
            <td><?php echo $sdt; ?></td>
        </tr>
        <tr>
            <th>Địa chỉ</th>
            <td><?php echo $diaChi; ?></td>
        </tr>
        <tr>
            <th>Quận/Huyện</th>
            <td><?php echo $quan_huyen; ?></td>
        </tr>
        <tr>
            <th>Phường/Xã</th>
            <td><?php echo $phuong_xa; ?></td>
        </tr>
    </table>
    
    <div style="text-align: center;">
        <a href="../controller/index.php" class="btn-back">Quay lại trang chủ</a>
    </div>
</div>

<div class="wrappper">
      <footer>
        <div class="container">
          <div class="sec aboutus">
            <h2>Về chúng tôi</h2>
            <p>
              DMTD FOOD là thương hiệu được thành lập vào năm 2025 với tiêu chí
              đặt chất lượng sản phẩm lên hàng đầu.
            </p>
            <ul class="sci">
              <li>
                <a href="#"><i class="fab fa-facebook-f"></i></a>
              </li>
              <li>
                <a href="#"><i class="fab fa-twitter"></i></a>
              </li>
              <li>
                <a href="#"><i class="fab fa-instagram"></i></a>
              </li>
              <li>
                <a href="#"><i class="fa-brands fa-whatsapp"></i></a>
              </li>
            </ul>
          </div>
          <div class="sec quicklinks">
            <h2>Hỗ trợ</h2>
            <ul>
              <li><a href="#">FAQ</a></li>
              <li><a href="#">Chính sách bảo mật</a></li>
              <li><a href="#">Chat</a></li>
              <li><a href="#">Giải quyết khiếu nại</a></li>
            </ul>
          </div>
          <div class="sec quicklinks">
            <h2>Shop</h2>
            <ul>
              <li><a href="#">Trang chủ</a></li>
              <li><a href="#">Món chay</a></li>
              <li><a href="#">Món mặn</a></li>
              <li><a href="#">Nước uống</a></li>
            </ul>
          </div>
          <div class="sec contact">
            <h2>Liên hệ</h2>
            <ul class="info">
              <li>
                <span><i class="fa-solid fa-phone"></i></span>
                <p><a href="#">0123456789</a></p>
              </li>
              <li>
                <span><i class="fa-solid fa-envelope"></i></span>
                <p><a href="#">abc@gmail.com</a></p>
              </li>
            </ul>
          </div>
        </div>
      </footer>
    </div>
    <div class="copyrightText">
      <p>Copyright @2025 <strong>DMTD Food</strong>. All rights reserved</p>
    </div>

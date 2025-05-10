<?php
// Khởi động session để truy cập các biến session
session_start();
include_once('../model/thuvien.php');
$conn = ketnoidb();

// Kiểm tra xem người dùng đã đặt hàng thành công hay chưa
if (!isset($_SESSION['order_success']) || $_SESSION['order_success'] !== true) {
    // Nếu không có xác nhận đặt hàng thành công, chuyển về trang chủ
    header("Location: ../controller/index.php");
    exit();
}

// Lấy mã hóa đơn thực tế từ session
$maHoaDon = isset($_SESSION['maHoaDon']) ? $_SESSION['maHoaDon'] : 0;

// Kiểm tra mã hóa đơn - nếu không có, hiển thị lỗi và chuyển hướng
if ($maHoaDon <= 0) {
    // Thiết lập thông báo lỗi
    $_SESSION['error_message'] = "Không tìm thấy thông tin đơn hàng!";
    // Chuyển hướng về trang chủ hoặc trang thông báo lỗi
    header("Location: ../controller/index.php");
    exit();
}

// Lấy thông tin đơn hàng từ database
$sql = "SELECT * FROM hoadon WHERE IdHoaDon = '$maHoaDon'";
$result = $conn->query($sql);

if ($result && $result->num_rows > 0) {
    $hoaDon = $result->fetch_assoc();
    
    // Lấy các thông tin từ DB để hiển thị
    $tenNguoiDung = $hoaDon['HoTen'];
    $email = $hoaDon['email'];
    $sdt = $hoaDon['sdt'];
    $diaChi = $hoaDon['DiaChi'];
    $quan_huyen = $hoaDon['quan_huyen'];
    $phuong_xa = $hoaDon['phuong_xa'];
    $tongTien = $hoaDon['TongTien'];
    $pttt = $hoaDon['PhuongThucTT'];
    $ngayDatHang = $hoaDon['NgayDatHang'];
    
    // Lấy chi tiết đơn hàng
    $sql = "SELECT c.*, s.TenSP, s.HinhAnh, s.MaSP FROM chitiethoadon c 
            JOIN sanpham s ON c.MaSP = s.MaSP
            WHERE c.IdHoaDon = '$maHoaDon'";
    $result = $conn->query($sql);
    
    $chiTietDonHang = [];
    if($result && $result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            $chiTietDonHang[] = $row;
        }
    }
} else {
    // Không tìm thấy hóa đơn trong database
    $_SESSION['error_message'] = "Không tìm thấy thông tin đơn hàng trong hệ thống!";
    header("Location: ../controller/index.php");
    exit();
}

// Hàm định dạng ngày tháng
function formatDate($dateString) {
    $date = new DateTime($dateString);
    return $date->format('d/m/Y H:i');
}

// Hàm chuyển đổi phương thức thanh toán
function getPhuongThucThanhToan($value) {
    switch ($value) {
        case 1:
            return "Thanh toán khi giao hàng (COD)";
        case 2:
            return "Chuyển khoản ngân hàng";
        default:
            return "Không xác định";
    }
}

// Thông tin ngân hàng
$bankInfo = [
    'bankName' => 'TECHCOMBANK',
    'accountNumber' => '19036024239013',
    'accountName' => 'DMTD FOOD',
    'branch' => 'Chi nhánh Hồ Chí Minh'
];

// Xóa thông tin đơn hàng khỏi session để tránh hiển thị lại khi refresh
// Giữ lại maHoaDon để xem chi tiết đơn hàng sau này
unset($_SESSION['order_success']);
unset($_SESSION['order_info']);
unset($_SESSION['order_items']);

?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="shortcut icon" href="../view/img/DMTD-Food-Logo.jpg" type="image/x-icon">
    <title>DMTD FOOD</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Roboto, Arial, sans-serif;
        }
        
        body {
            background-color: #f0f2f5;
            color: #333;
            line-height: 1.6;
            padding: 20px;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        
        .success-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 1px solid #e0e0e0;
        }
        
        .logo {
            font-size: 24px;
            font-weight: bold;
            color:  #f37319;
        }
        
        .success-icon {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .success-icon .checkmark {
            display: inline-flex;
            justify-content: center;
            align-items: center;
            width: 80px;
            height: 80px;
            background-color: #00A550;
            border-radius: 50%;
            color: white;
            font-size: 40px;
        }
        
        .success-message {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .success-message h1 {
            font-size: 28px;
            color: #2c3e50;
            margin-bottom: 10px;
        }
        
        .success-message p {
            font-size: 16px;
            color: #666;
        }
        
        .order-details {
            background-color: white;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 30px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        
        .order-section {
            margin-bottom: 20px;
        }
        
        .order-section h2 {
            font-size: 20px;
            color: #2c3e50;
            margin-bottom: 15px;
            padding-bottom: 10px;
            border-bottom: 1px solid #f0f0f0;
        }
        
        .info-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }
        
        .info-item {
            margin-bottom: 15px;
        }
        
        .info-item .label {
            font-weight: bold;
            margin-bottom: 5px;
            color: #666;
        }
        
        .info-item .value {
            color: #333;
        }
        
        .order-summary {
            margin-top: 30px;
        }
        
        .order-summary-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }
        
        .order-summary-table th {
            background-color: #f9f9f9;
            padding: 12px;
            text-align: left;
            font-weight: 600;
            color: #333;
            border-bottom: 1px solid #e0e0e0;
        }
        
        .order-summary-table td {
            padding: 12px;
            border-bottom: 1px solid #f0f0f0;
        }
        
        .order-summary-table .product-img {
            width: 60px;
            height: 60px;
            object-fit: cover;
            border-radius: 4px;
        }
        
        .order-summary-table .product-name {
            font-weight: 500;
        }
        
        .order-total {
            display: flex;
            justify-content: flex-end;
            margin-top: 20px;
            font-size: 18px;
            font-weight: bold;
        }
        
        .order-total .total-label {
            margin-right: 15px;
        }
        
        .order-total .total-value {
            color: red;
        }
        
        .actions {
            display: flex;
            justify-content: center;
            margin-top: 30px;
        }
        
        .btn {
            display: inline-block;
            padding: 12px 24px;
            background-color: #00A550;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s;
        }
        
        .btn:hover {
            background-color: #008442;
        }
        
        .btn-print {
            margin-right: 15px;
            background-color: #f0f0f0;
            color: #333;
        }
        
        .btn-print:hover {
            background-color: #e0e0e0;
        }
        
        .btn-home {
            background-color: #F37319;
        }
        
        .btn-home:hover {
            background-color: #d66214;
        }
        
        .btn-detail {
            background-color: #4a90e2;
            margin-right: 15px;
        }
        
        .btn-detail:hover {
            background-color: #3a7bc8;
        }
        
        .bank-info {
            background-color: #f9f9f9;
            padding: 15px;
            border-radius: 6px;
            border-left: 4px solid  #F37319;
            margin-top: 15px;
        }
        
        .bank-info h3 {
            color:  #F37319;
            margin-bottom: 10px;
            font-size: 16px;
        }
        
        .bank-info-item {
            display: flex;
            margin-bottom: 8px;
        }
        
        .bank-info-label {
            font-weight: bold;
            width: 150px;
            color: #555;
        }
        
        .bank-info-value {
            font-weight: 500;
        }
        
        .payment-note {
            margin-top: 10px;
            color: #e74c3c;
            font-style: italic;
        }
        
        @media (max-width: 768px) {
            .info-grid {
                grid-template-columns: 1fr;
            }
            
            .actions {
                flex-direction: column;
                gap: 15px;
            }
            
            .btn {
                width: 100%;
                text-align: center;
                margin-right: 0;
            }
            
            .bank-info-item {
                flex-direction: column;
            }
            
            .bank-info-label {
                width: 100%;
                margin-bottom: 3px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="success-header">
            <div class="logo">DMTD FOOD</div>
            <div class="order-id">Đơn hàng: <strong>#<?php echo $maHoaDon; ?></strong></div>
        </div>
        
        <div class="success-icon">
            <div class="checkmark"><i class="fas fa-check"></i></div>
        </div>
        
        <div class="success-message">
            <h1>Cảm ơn bạn đã đặt hàng</h1>
            <p>Một email xác nhận đã được gửi tới <?php echo $email; ?>.<br>Xin vui lòng kiểm tra email của bạn</p>
        </div>
        
        <div class="order-details">
            <div class="order-section">
                <h2>Thông tin mua hàng</h2>
                <div class="info-grid">
                    <div class="info-item">
                        <div class="label">Họ và tên:</div>
                        <div class="value"><?php echo $tenNguoiDung; ?></div>
                    </div>
                    <div class="info-item">
                        <div class="label">Email:</div>
                        <div class="value"><?php echo $email; ?></div>
                    </div>
                    <div class="info-item">
                        <div class="label">Số điện thoại:</div>
                        <div class="value"><?php echo $sdt; ?></div>
                    </div>
                    <div class="info-item">
                        <div class="label">Ngày đặt hàng:</div>
                        <div class="value"><?php echo formatDate($ngayDatHang); ?></div>
                    </div>
                </div>
            </div>
            
            <div class="order-section">
                <h2>Địa chỉ giao hàng</h2>
                <div class="info-item">
                    <div class="value">
                        <?php echo $diaChi; ?>, <?php echo $phuong_xa; ?>, <?php echo $quan_huyen; ?>
                    </div>
                </div>
            </div>
            
            <div class="order-section">
                <h2>Phương thức thanh toán</h2>
                <div class="info-item">
                    <div class="value">
                        <?php echo getPhuongThucThanhToan($pttt); ?>
                    </div>
                    
                    <?php if ($pttt == 2): ?>
                    <div class="bank-info">
                        <h3>Thông tin chuyển khoản</h3>
                        <div class="bank-info-item">
                            <div class="bank-info-label">Ngân hàng:</div>
                            <div class="bank-info-value"><?php echo $bankInfo['bankName']; ?></div>
                        </div>
                        <div class="bank-info-item">
                            <div class="bank-info-label">Số tài khoản:</div>
                            <div class="bank-info-value"><?php echo $bankInfo['accountNumber']; ?></div>
                        </div>
                        <div class="bank-info-item">
                            <div class="bank-info-label">Chủ tài khoản:</div>
                            <div class="bank-info-value"><?php echo $bankInfo['accountName']; ?></div>
                        </div>
                        <div class="bank-info-item">
                            <div class="bank-info-label">Chi nhánh:</div>
                            <div class="bank-info-value"><?php echo $bankInfo['branch']; ?></div>
                        </div>
                        <div class="payment-note">
                            Vui lòng ghi nội dung chuyển khoản: "<?php echo $tenNguoiDung; ?> thanh toán đơn hàng #<?php echo $maHoaDon; ?>"
                        </div>
                    </div>
                    <?php endif; ?>
                </div>
            </div>
            
            <div class="order-section order-summary">
                <h2>Đơn hàng #<?php echo $maHoaDon; ?></h2>
                
                <table class="order-summary-table">
                    <thead>
                        <tr>
                            <th>Sản phẩm</th>
                            <th>Hình ảnh</th>
                            <th>Giá</th>
                            <th>Số lượng</th>
                            <th>Thành tiền</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php 
                        $total = 0;
                        if(!empty($chiTietDonHang)):
                            foreach($chiTietDonHang as $item):
                                $itemTotal = $item['DonGia'] * $item['SoLuong'];
                                $total += $itemTotal;
                        ?>
                        <tr>
                            <td class="product-name"><?php echo $item['TenSP']; ?></td>
                            <td><img src="../view/img/product/<?php echo $item['HinhAnh']; ?>" alt="<?php echo $item['TenSP']; ?>" class="product-img"></td>
                            <td><?php echo number_format($item['DonGia']); ?>₫</td>
                            <td><?php echo $item['SoLuong']; ?></td>
                            <td><?php echo number_format($itemTotal); ?>₫</td>
                        </tr>
                        <?php 
                            endforeach;
                        elseif(!empty($_SESSION['giohang'])):
                            foreach($_SESSION['giohang'] as $product):
                                $itemTotal = $product[3] * $product[4];
                                $total += $itemTotal;
                        ?>
                        <tr>
                            <td class="product-name"><?php echo $product[2]; ?></td>
                            <td><img src="../view/img/product/<?php echo $product[1]; ?>" alt="<?php echo $product[2]; ?>" class="product-img"></td>
                            <td><?php echo number_format($product[3]); ?>₫</td>
                            <td><?php echo $product[4]; ?></td>
                            <td><?php echo number_format($itemTotal); ?>₫</td>
                        </tr>
                        <?php 
                            endforeach;
                        endif;
                        ?>
                    </tbody>
                </table>
                
                <div class="order-total">
                    <div class="total-label">Tổng cộng:</div>
                    <div class="total-value"><?php echo number_format($tongTien); ?>₫</div>
                </div>
            </div>
        </div>
        
        <div class="actions">
            <a href="../controller/index.php" class="btn btn-home">Tiếp tục mua hàng</a>
            <a href="javascript:window.print()" class="btn btn-print"><i class="fas fa-print"></i> In</a>
        </div>
    </div>
</body>
</html>
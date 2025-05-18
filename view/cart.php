<?php
session_start();
include '../model/thuvien.php';

$isLoggedIn = isset($_SESSION['tenDangNhap']);
if (!$isLoggedIn) {
    unset($_SESSION['giohang']);
}

// Connect to database
$conn = ketnoidb();

// Check products' status and remove hidden products (TrangThai = 0)
if (!empty($_SESSION['giohang'])) {
    foreach ($_SESSION['giohang'] as $key => $product) {
        $productId = $product[0]; // ID sản phẩm
        
        // Query to check product status
        $checkStatusSql = "SELECT TrangThai FROM sanpham WHERE MaSP = $productId";
        $statusResult = $conn->query($checkStatusSql);
        
        if ($statusResult && $statusResult->num_rows > 0) {
            $statusRow = $statusResult->fetch_assoc();
            // If product is hidden (TrangThai = 0), remove from cart
            if ((int)$statusRow['TrangThai'] === 0) {
                unset($_SESSION['giohang'][$key]);
            }
        }
    }
    
    // Reindex array after removing items
    if (!empty($_SESSION['giohang'])) {
        $_SESSION['giohang'] = array_values($_SESSION['giohang']);
    }
}

if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["remove_item"])) {
    $id = $_POST["remove_id"];
    unset($_SESSION['giohang'][$id]);
    // Reindex array after removing item
    $_SESSION['giohang'] = array_values($_SESSION['giohang']);
}

// Xử lý yêu cầu cập nhật số lượng
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["update_quantity"])) {
    $id = $_POST["product_id"];
    $quantity = (int)$_POST["quantity"];
    
    // Ensure quantity is positive and within allowed range
    if ($quantity > 0 && $quantity <= 100) {
        $_SESSION['giohang'][$id][4] = $quantity;
    } else {
        // If invalid quantity, set to 1
        $_SESSION['giohang'][$id][4] = 1;
        $quantity = 1;
    }
    
    // Trả về dữ liệu cập nhật cho AJAX
    if (isset($_POST["ajax"])) {
        $price = $_SESSION['giohang'][$id][3];
        $total = $price * $quantity;
        echo json_encode([
            'success' => true,
            'total' => number_format($total) . " VND",
            'corrected_quantity' => $quantity
        ]);
        exit;
    }
}

$isLoggedIn = isset($_SESSION['tenDangNhap']);

if($isLoggedIn){
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
}

include "../view/header.php";
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DMTD FOOD - Giỏ Hàng</title>
    <link rel="shortcut icon" href="../view/img/DMTD-Food-Logo.jpg" type="image/x-icon" />
    <script>
        function updateTotal(id, price) {
            let quantityInput = document.getElementById('quantity-' + id);
            let quantity = parseInt(quantityInput.value);
            
            // Validate quantity input
            if (isNaN(quantity) || quantity < 1) {
                quantity = 1;
                quantityInput.value = 1;
            } else if (quantity > 100) {
                quantity = 100;
                quantityInput.value = 100;
            }
            
            let totalPrice = parseInt(price) * quantity;
            document.getElementById('total-' + id).innerText = totalPrice.toLocaleString() + " VND";
            
            // Cập nhật tổng tiền
            updateGrandTotal();
            
            // Lưu số lượng vào session thông qua AJAX
            updateQuantityInSession(id, quantity);
        }

        function updateQuantityInSession(id, quantity) {
            // Tạo form data cho AJAX request
            const formData = new FormData();
            formData.append('product_id', id);
            formData.append('quantity', quantity);
            formData.append('update_quantity', 'true');
            formData.append('ajax', 'true');
            
            // Gửi AJAX request
            fetch(window.location.href, {
                method: 'POST',
                body: formData
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    console.log('Đã cập nhật số lượng trong session');
                    // Update the input value if server corrected the quantity
                    if (data.corrected_quantity) {
                        document.getElementById('quantity-' + id).value = data.corrected_quantity;
                        let price = parseInt(document.getElementById('quantity-' + id).getAttribute('data-price'));
                        let totalPrice = price * data.corrected_quantity;
                        document.getElementById('total-' + id).innerText = totalPrice.toLocaleString() + " VND";
                        updateGrandTotal();
                    }
                }
            })
            .catch(error => console.error('Lỗi cập nhật số lượng:', error));
        }

        function updateGrandTotal() {
            let total = 0;
            let totalElements = document.querySelectorAll("[id^='total-']");
            totalElements.forEach(element => {
                total += parseInt(element.innerText.replace(/\D/g, '')); 
            });
            document.getElementById("grand-total").innerText = total.toLocaleString() + " VND";
        }
        
        // Add event listener for direct input and validation
        function validateQuantityInput(input) {
            let value = parseInt(input.value);
            if (isNaN(value) || value < 1) {
                input.value = 1;
            } else if (value > 100) {
                input.value = 100;
            }
        }
    </script>
    <style>
        .cart-container {
            max-width: 1200px;
            margin: 20px auto 40px;
            padding: 0 15px;
        }

        /* Page Title Styling */
        .cart-title {
            color: #333;
            font-size: 28px;
            font-weight: 600;
            margin-bottom: 25px;
            text-align: center;
            padding-bottom: 10px;
            border-bottom: 2px solid #f37319;
        }

        /* Table Styling */
        .cart-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            margin-bottom: 30px;
            background-color: #fff;
        }

        .cart-table th {
            background-color: #f37319;
            color: white;
            font-weight: 600;
            padding: 15px;
            text-align: center;
            text-transform: uppercase;
            font-size: 14px;
            letter-spacing: 0.5px;
        }

        .cart-table td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid #eee;
            color: #444;
            vertical-align: middle;
        }

        .cart-table tr:last-child td {
            border-bottom: none;
        }

        .cart-table tr:hover td {
            background-color: #fff8f2;
        }

        /* Product Image */
        .product-image {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .product-image:hover {
            transform: scale(1.05);
        }

        /* Product Name */
        .product-name {
            font-weight: 500;
            color: #333;
            max-width: 200px;
            margin: 0 auto;
        }

        /* Price styling */
        .price {
            font-weight: 500;
            color: #f37319;
        }

        /* Total Price Styling */
        .item-total {
            font-weight: 600;
            color: #f37319;
        }

        /* Grand Total Row */
        .grand-total-row td {
            background-color: #f9f9f9;
            font-weight: 700;
        }

        .grand-total-label {
            text-align: right;
            color: #333;
            font-size: 16px;
        }

        #grand-total {
            color: #f37319;
            font-size: 18px;
            font-weight: 700;
        }

        /* Empty Cart Message */
        .empty-row td {
            padding: 50px 20px;
            text-align: center;
            font-size: 16px;
            color: #777;
            background-color: #fff;
        }

        .empty-cart-icon {
            font-size: 40px;
            color: #ccc;
            margin-bottom: 15px;
            display: block;
        }

        /* Quantity Input Styling */
        .quantity-input {
            width: 70px;
            padding: 8px 5px;
            text-align: center;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 15px;
            transition: border-color 0.3s;
            background-color: #fff;
        }

        .quantity-input:focus {
            border-color: #f37319;
            outline: none;
            box-shadow: 0 0 0 2px rgba(243, 115, 25, 0.2);
        }

        .quantity-input::-webkit-inner-spin-button,
        .quantity-input::-webkit-outer-spin-button {
            opacity: 1;
            height: 20px;
        }

        /* Delete Button */
        .delete-btn {
            background-color: #f37319;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 8px 15px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s;
            font-size: 14px;
            width: auto;
            display: block;
            margin: 0 auto;
        }

        .delete-btn:hover {
            background-color: #ff4500;
            transform: translateY(-2px);
        }

        .delete-btn:active {
            transform: translateY(0);
        }

        /* Action Buttons Container */
        .button-group {
            display: flex;
            justify-content: space-between;
            margin-top: 25px;
            flex-wrap: wrap;
            gap: 10px;
        }

        /* Action Buttons */
        .cart-btn {
            padding: 12px 25px;
            font-size: 15px;
            font-weight: 600;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.3s ease;
            min-width: 180px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .continue-btn {
            background-color: #fff;
            color: #f37319;
            border: 2px solid #f37319;
        }

        .continue-btn:hover {
            background-color: #fff8f2;
            transform: translateY(-2px);
        }

        .checkout-btn {
            background-color: #f37319;
            color: white;
        }

        .checkout-btn:hover {
            background-color: #ff4500;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(243, 115, 25, 0.3);
        }

        /* Responsive Styles */
        @media (max-width: 768px) {
            .cart-table {
                display: block;
                overflow-x: auto;
            }
            
            .cart-table th, 
            .cart-table td {
                padding: 10px;
            }
            
            .product-image {
                width: 80px;
                height: 80px;
            }
            
            .button-group {
                flex-direction: column;
                gap: 15px;
            }
            
            .cart-btn {
                width: 100%;
            }
        }

        @media (max-width: 480px) {
            .cart-title {
                font-size: 24px;
            }
            
            .product-image {
                width: 60px;
                height: 60px;
            }
            
            .quantity-input {
                width: 60px;
            }
            
            .cart-table th, 
            .cart-table td {
                padding: 8px 5px;
                font-size: 14px;
            }
        }
        /* Cart Page Container Styling */
        .cart-container {
            max-width: 1200px;
            margin: 20px auto 40px;
            padding: 0 15px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        /* Page Title Styling */
        .cart-title {
            color: #333;
            font-size: 28px;
            font-weight: 600;
            margin-bottom: 25px;
            text-align: center;
            padding-bottom: 10px;
            border-bottom: 2px solid #f37319;
        }

        /* Table Styling */
        .cart-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            margin-bottom: 30px;
            background-color: #fff;
        }

        .cart-table th {
            background-color: #f37319;
            color: white;
            font-weight: 600;
            padding: 15px;
            text-align: center;
            text-transform: uppercase;
            font-size: 14px;
            letter-spacing: 0.5px;
        }

        .cart-table td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid #eee;
            color: #444;
            vertical-align: middle;
        }

        .cart-table tr:last-child td {
            border-bottom: none;
        }

        .cart-table tr:hover td {
            background-color: #fff8f2;
        }

        /* Product Image */
        .product-image {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .product-image:hover {
            transform: scale(1.05);
        }

        /* Product Name */
        .product-name {
            font-weight: 500;
            color: #333;
            max-width: 200px;
            margin: 0 auto;
        }

        /* Price styling */
        .price {
            font-weight: 500;
            color: #f37319;
        }

        /* Total Price Styling */
        .item-total {
            font-weight: 600;
            color: #f37319;
        }

        /* Grand Total Row */
        .grand-total-row td {
            background-color: #f9f9f9;
            font-weight: 700;
        }

        .grand-total-label {
            text-align: right;
            color: #333;
            font-size: 16px;
        }

        #grand-total {
            color: #FF0000;
            font-size: 18px;
            font-weight: 700;
        }

        /* Empty Cart Message */
        .empty-row td {
            padding: 50px 20px;
            text-align: center;
            font-size: 16px;
            color: #777;
            background-color: #fff;
        }

        .empty-cart-icon {
            font-size: 40px;
            color: #ccc;
            margin-bottom: 15px;
            display: block;
        }

        /* Quantity Input Styling */
        .quantity-input {
            width: 70px;
            padding: 8px 5px;
            text-align: center;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 15px;
            transition: border-color 0.3s;
            background-color: #fff;
        }

        .quantity-input:focus {
            border-color: #f37319;
            outline: none;
            box-shadow: 0 0 0 2px rgba(243, 115, 25, 0.2);
        }

        .quantity-input::-webkit-inner-spin-button,
        .quantity-input::-webkit-outer-spin-button {
            opacity: 1;
            height: 20px;
        }

        /* Delete Button */
        .delete-btn {
            background-color: #f37319;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 8px 15px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s;
            font-size: 14px;
            width: auto;
            display: block;
            margin: 0 auto;
        }

        .delete-btn:hover {
            background-color: #ff4500;
            transform: translateY(-2px);
        }

        .delete-btn:active {
            transform: translateY(0);
        }

        /* Action Buttons Container */
        .button-group {
            display: flex;
            justify-content: space-between;
            margin-top: 25px;
            flex-wrap: wrap;
            gap: 10px;
        }

        /* Action Buttons */
        .cart-btn {
            padding: 12px 25px;
            font-size: 15px;
            font-weight: 600;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.3s ease;
            min-width: 180px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .continue-btn {
            background-color: #fff;
            color: #f37319;
            border: 2px solid #f37319;
        }

        .continue-btn:hover {
            background-color: #fff8f2;
            transform: translateY(-2px);
        }

        .checkout-btn {
            background-color: #f37319;
            color: white;
        }

        .checkout-btn:hover {
            background-color: #ff4500;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(243, 115, 25, 0.3);
        }

        /* Notification for hidden products */
        .notification {
            background-color: #fff8f2;
            border-left: 4px solid #f37319;
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 4px;
            color: #333;
            font-size: 14px;
        }

        /* Responsive Styles */
        @media (max-width: 768px) {
            .cart-table {
                display: block;
                overflow-x: auto;
            }
            
            .cart-table th, 
            .cart-table td {
                padding: 10px;
            }
            
            .product-image {
                width: 80px;
                height: 80px;
            }
            
            .button-group {
                flex-direction: column;
                gap: 15px;
            }
            
            .cart-btn {
                width: 100%;
            }
        }

        @media (max-width: 480px) {
            .cart-title {
                font-size: 24px;
            }
            
            .product-image {
                width: 60px;
                height: 60px;
            }
            
            .quantity-input {
                width: 60px;
            }
            
            .cart-table th, 
            .cart-table td {
                padding: 8px 5px;
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <div class="cart-container">
        <h2 class="cart-title">GIỎ HÀNG CỦA BẠN</h2>
        
        <?php 
        // Check if any products were hidden and removed from cart
        if (isset($_SESSION['hidden_products_removed']) && $_SESSION['hidden_products_removed']): 
        ?>
        <div class="notification">
            <strong>Lưu ý:</strong> Một số sản phẩm đã bị gỡ khỏi giỏ hàng vì không còn khả dụng.
        </div>
        <?php 
        // Reset notification after showing it once
        unset($_SESSION['hidden_products_removed']); 
        endif; 
        ?>
        
        <?php if (empty($_SESSION['giohang'])): ?>
            <table class="cart-table">
                <thead>
                    <tr>
                        <th>Sản phẩm</th>
                        <th>Hình ảnh</th>
                        <th>Giá</th>
                        <th>Số lượng</th>
                        <th>Xóa</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="empty-row">
                        <td colspan="5">
                            <i class="fa-solid fa-cart-shopping empty-cart-icon"></i>
                            Giỏ hàng của bạn đang trống
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="button-group">
                <button type="button" class="cart-btn continue-btn" onclick="window.location.href='../controller/index.php'">
                    <i class="fa-solid fa-arrow-left"></i> Tiếp tục mua sắm
                </button>
            </div>
        <?php else: ?>     
            <table class="cart-table">
                <thead>
                    <tr>
                        <th>Sản phẩm</th>
                        <th>Hình ảnh</th>
                        <th>Giá</th>
                        <th>Số lượng</th>
                        <th>Thành tiền</th>
                        <th>Xóa</th>
                    </tr>
                </thead>
                <tbody>
                    <?php $totalAmount = 0; ?>
                    <?php foreach ($_SESSION['giohang'] as $id => $product): ?>
                        <?php 
                        // Double check product status before displaying
                        $productId = $product[0];
                        $checkStatusSql = "SELECT TrangThai FROM sanpham WHERE MaSP = $productId";
                        $statusResult = $conn->query($checkStatusSql);
                        $isVisible = true;
                        
                        if ($statusResult && $statusResult->num_rows > 0) {
                            $statusRow = $statusResult->fetch_assoc();
                            $isVisible = ((int)$statusRow['TrangThai'] !== 0);
                        }
                        
                        // Only display if product is visible (TrangThai != 0)
                        if ($isVisible):
                            $itemTotal = $product[3] * $product[4];
                            $totalAmount += $itemTotal;
                        ?>
                        <tr>
                            <td class="product-name"><?= $product[2] ?></td>
                            <td>
                                <img class="product-image" src="../view/img/product/<?= $product[1] ?>" alt="<?= $product[2] ?>">
                            </td>
                            <td class="price"><?= number_format($product[3]) ?> VND</td>
                            <td>
                                <input type="number" id="quantity-<?= $id ?>" class="quantity-input" 
                                    value="<?= $product[4] ?>" min="1" max="100" 
                                    data-price="<?= $product[3] ?>"
                                    onchange="updateTotal('<?= $id ?>', '<?= $product[3] ?>')"
                                    oninput="validateQuantityInput(this)">
                            </td>
                            <td id="total-<?= $id ?>" class="item-total"><?= number_format($itemTotal) ?> VND</td>
                            <td>
                                <form method="post">
                                    <input type="hidden" name="remove_id" value="<?= $id ?>">
                                    <button type="submit" name="remove_item" class="delete-btn">
                                        <i class="fa-solid fa-trash-can"></i> Xóa
                                    </button>
                                </form>
                            </td>
                        </tr>
                        <?php endif; ?>
                    <?php endforeach; ?>
                    
                    <!-- Hàng tổng tiền -->
                    <tr class="grand-total-row">
                        <td colspan="4" class="grand-total-label"><strong>Tổng tiền:</strong></td>
                        <td id="grand-total"><?= number_format($totalAmount) ?> VND</td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
            
            <form id="hiddenForm" action="check_order.php" method="post">
                <!-- Đảm bảo giá trị session được gán đúng cách vào các trường input -->
                <input type="hidden" name="tenNguoiDung" value="<?php echo isset($tenNguoiDung) ? $tenNguoiDung : ''; ?>">
                <input type="hidden" name="email" value="<?php echo isset($email) ? $email : ''; ?>">
                <input type="hidden" name="sdt" value="<?php echo isset($sdt) ? $sdt : ''; ?>">
                <input type="hidden" name="diaChi" value="<?php echo isset($diaChi) ? $diaChi : ''; ?>">
                <input type="hidden" name="quan_huyen" value="<?php echo isset($quan_huyen) ? $quan_huyen : ''; ?>">
                <input type="hidden" name="phuong_xa" value="<?php echo isset($phuong_xa) ? $phuong_xa : ''; ?>">
                
                <!-- Thêm tổng số tiền -->
                <input type="hidden" name="totalAmount" value="<?php echo $totalAmount; ?>">

                <!-- Các nút -->
                <div class="button-group">
                    <button type="button" class="cart-btn continue-btn" onclick="window.location.href='../controller/index.php'">
                        <i class="fa-solid fa-arrow-left"></i> Tiếp tục mua sắm
                    </button>
                    <button type="submit" class="cart-btn checkout-btn">
                        <i class="fa-solid fa-check"></i> Xác nhận đặt hàng
                    </button>
                </div>
            </form>
            
            <script>
                // Cập nhật tổng tiền ban đầu
                updateGrandTotal();
                
                // Add input event listeners to all quantity inputs for real-time validation
                document.addEventListener('DOMContentLoaded', function() {
                    const quantityInputs = document.querySelectorAll('.quantity-input');
                    quantityInputs.forEach(input => {
                        input.addEventListener('input', function() {
                            validateQuantityInput(this);
                        });
                    });
                });
            </script>
        <?php endif; ?>
    </div>
    
    <?php include "../view/footer.php" ?>
</body>
</html>
<?php
    include "../../model/thuvien.php"; // Đảm bảo kết nối DB
    $conn = ketnoidb();

    if (isset($_GET['id'])) {
        $id = intval($_GET['id']);
        $sql = "SELECT * FROM sanpham WHERE MaSP = $id";
        $result = mysqli_query($conn, $sql);
        $row = mysqli_fetch_array($result);

        if ($row) {
            if ($row['SoLuongBan'] == 0) {
                echo '
                <div class="warning">
                    <div class="warning-content">
                        <div class="warning-title">Cảnh báo</div>
                        <div class="warning-text">Sản phẩm vẫn chưa được bán, bạn có chắc muốn xóa không?</div>
                        <div class="warning-btns">
                            <button class="btn-cancle">Hủy bỏ</button>
                            <button class="btn-save" data-act="delete">Đồng ý</button>
                        </div>
                    </div>
                </div>';
            } else {
                echo '
                <div class="warning">
                    <div class="warning-content">
                        <div class="warning-title">Cảnh báo</div>
                        <div class="warning-text">Sản phẩm đã được bán, bạn có chắc muốn ẩn không?</div>
                        <div class="warning-btns">
                            <button class="btn-cancle">Hủy bỏ</button>
                            <button class="btn-save" data-act="hide">Đồng ý</button>
                        </div>
                    </div>
                </div>';
            }
        }
    }
    mysqli_close($conn);
?>

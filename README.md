# 🍏 OpenCore EFI for Intel X99-DM3 (Xeon E5-2686 v4 + AMD Radeon RX 580)

Bộ cài OpenCore EFI được tối ưu hóa cho hệ thống Hackintosh chạy **macOS Big Sur (11.x)**.

---

## 🖥️ Cấu Hình Phần Cứng (Hardware Specs)

| Linh Kiện | Chi Tiết | Trạng Thái macOS |
|:---|:---|:---:|
| **Mainboard** | INTEL X99-DM3 (v3.2) - Chipset Q87 | ✅ Hoàn toàn tương thích |
| **CPU** | Intel Xeon E5-2686 v4 (18 Cores / 36 Threads) - Broadwell-E | ✅ Cần `CpuTscSync.kext` |
| **GPU** | AMD Radeon RX 580 4GB (Polaris 20 / Ellesmere) | ✅ **Native Out-of-the-Box** |
| **Audio** | Realtek ALC897 (`10EC-0897`) | ✅ `AppleALC.kext` |
| **Ethernet** | Realtek RTL8168/8111 Gigabit Ethernet | ✅ `RealtekRTL8111.kext` |
| **Storage** | Lexar SSD NM610 250GB (NVMe MAP1202) + SATA SSD | ✅ Hỗ trợ |
| **SMBIOS** | `iMacPro1,1` | ✅ Tối ưu cho Xeon + dGPU AMD |

---

## 🛠️ Các Bản Vá ACPI (SSDTs Đã Tích Hợp)

* `SSDT-EC.aml`: Giả lập Embedded Controller cho macOS.
* `SSDT-PLUG.aml`: PluginType quản lý năng lượng CPU Intel.
* `SSDT-USBX.aml`: Cung cấp nguồn điện chuẩn USB cho thiết bị ngoại vi.
* `SSDT-SBUS.aml`: Sửa tên bus SMBus trên mainboard (`SMBS`).
* `SSDT-UNC.aml`: **Cực kỳ quan trọng cho main X99** — Vô hiệu hóa cầu nối Uncore giả lập (`UNC0`) để ngăn chặn Kernel Panic `IOPCIFamily` trên macOS 11 Big Sur+.
* `SSDT-EHCx-DISABLE.aml`: Tắt controller USB 2.0 EHCI cũ, ép tín hiệu qua Intel XHCI (USB 3.0) để tránh lỗi timeout USB trên Big Sur.

---

## ⚙️ Thiết Lập BIOS Khuyến Nghị

* **Secure Boot:** `Disabled`
* **UEFI Boot:** `Enabled`
* **XHCI Hand-off:** `Enabled` *(Bắt buộc để không bị treo USB)*
* **SATA Mode:** `AHCI`
* **Above 4G Decoding:** `Enabled`
* **CSM (Compatibility Support Module):** `Disabled`
* **VT-d:** `Disabled` (hoặc `Enabled` vì OpenCore đã có `DisableIoMapper`)

---

## 🚀 Hướng Dẫn Sử Dụng

1. Tải toàn bộ thư mục `EFI/` về máy.
2. Format USB định dạng **FAT32 (GUID Partition Table)**.
3. Chép thư mục `EFI/` vào phân vùng khởi động của USB.
4. Tải bộ cài macOS Big Sur qua `macrecovery.py` và chép thư mục `com.apple.recovery.boot/` vào gốc USB.
5. Cắm USB vào cổng **USB 2.0 màu đen phía sau mainboard** và khởi động máy.

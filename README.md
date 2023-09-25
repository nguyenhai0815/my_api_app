# my_api_app

A new Flutter project wit api mock data.

## Getting Started

## 1. Chuẩn bị môi trường
    flutter create my_api_app
    cd my_api_app

## 2. Tạo API mock data
### Tạo một tệp JSON để chứa dữ liệu mock: mock_data.json

## 3. Sử dụng gói http để tải dữ liệu từ API mock
### Thêm gói http vào pubspec.yaml
    dependencies:
        flutter:
        sdk: flutter
        http: ^0.13.3
### chạy lệnh sau để cài đặt
    flutter pub get

## 4. Tạo các class để biểu diễn dữ liệu
### Tạo một class để biểu diễn dữ liệu sản phẩm
    ./lib/products/product.dart

## 5. Tạo một class service để tương tác với API
### Tạo một lớp để biểu diễn dữ liệu sản phẩm
    ./lib/products/api_service.dart

## 6. Tạo giao diện người dùng

## 7. Chạy ứng dụng
    flutter run
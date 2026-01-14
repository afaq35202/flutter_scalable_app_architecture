## 📂 Project Structure

lib/
│
├── utils/
│   ├── http_utils/
│   │   ├── api_response.dart
│   │   ├── enum_methods.dart
│   │   ├── enum_status_codes.dart
│   │   └── http_exceptions_handler.dart
│   │
│   └── logger.dart
│
├── features/
│   │
│   ├── app_initializer/
│   │   └── presentation/
│   │       ├── pages/
│   │       │   └── app_initializer_mobile.dart
│   │       └── view_model/
│   │           ├── app_initializer_provider.dart
│   │           ├── app_initializer_view_model.dart
│   │           └── app_initializer_page.dart
│   │
│   ├── authentication/
│   │   └── presentation/
│   │       ├── login/
│   │       │   └── pages/
│   │       │       ├── login_mobile.dart
│   │       │       └── login_page.dart
│   │       │
│   │       └── forget_password/
│   │           └── pages/
│   │               ├── forget_password_mobile.dart
│   │               └── forget_password_page.dart
│   │
│   └── home/
│       └── presentation/
│           ├── pages/
│           │   ├── home_mobile.dart
│           │   ├── home_tablet.dart
│           │   └── home_desktop.dart
│           │
│           └── sections/
│               └── home/
│                   └── base/
│                       └── home_decorator.dart
│
└── main.dart

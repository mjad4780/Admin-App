# 🛠️ Admin App

A comprehensive Flutter-based admin application to manage your e-commerce platform: handle products, orders, users, and view analytics in real time.

---

## 📌 Table of Contents

1. [Features](#features)
2. [Screenshots](#screenshots)
3. [Project Structure](#project-structure)
4. [Requirements](#requirements)
5. [Getting Started](#getting-started)
6. [License](#license)

---

## ✨ Features

- 📊 **Dashboard Overview** – Key metrics at a glance
- 🛍️ **Order Management** – View, filter, and update orders
- 📦 **Product Management** – Add, edit, or remove products
- 👥 **User Management** – Manage user accounts and roles
- 📈 **Analytics & Reports** – Sales charts and performance data
- ⚙️ **Settings** – Configure app preferences and API keys

---

## 🖼️ Screenshots

<p align="center">
  <img src="https://github.com/user-attachments/assets/bb1b09c5-c2b1-4a28-ba2e-44105fc344ef" width="300">
  <img src="https://github.com/user-attachments/assets/fc807291-18a8-4fb3-a8ae-2cbbc5e31b1b" width="300">
  <img src="https://github.com/user-attachments/assets/1038a29b-f561-4469-b2b0-f03100429b0b" width="300">
  <img src="https://github.com/user-attachments/assets/559bfa6f-7f84-4248-b0ff-bf2a01af90f4" width="300">
  <img src="https://github.com/user-attachments/assets/6371087b-45b7-449d-b50e-3de4d393058a" width="300">
  <img src="https://github.com/user-attachments/assets/d858bb64-1542-40eb-beed-b8930cba15f6" width="300">
</p>

-------------------------|------------|
| 📊 Dashboard Overview   | <img src="https://github.com/user-attachments/assets/bb1b09c5-c2b1-4a28-ba2e-44105fc344ef" width="700"> |
| 🛒 Orders List          | <img src="https://github.com/user-attachments/assets/fc807291-18a8-4fb3-a8ae-2cbbc5e31b1b" width="700"> |
| 📈 Analytics Dashboard  | <img src="https://github.com/user-attachments/assets/6371087b-45b7-449d-b50e-3de4d393058a" width="700"> |
| 👥 User Management      | <img src="https://github.com/user-attachments/assets/559bfa6f-7f84-4248-b0ff-bf2a01af90f4" width="300"> |
| ➕ Add Notification     | <img src="https://github.com/user-attachments/assets/d858bb64-1542-40eb-beed-b8930cba15f6" width="700"> |
| ➕ Add/Edit Product     | <img src="https://github.com/user-attachments/assets/1038a29b-f561-4469-b2b0-f03100429b0b" width="300"> |


---

## 📁 Project Structure

```
/lib
├── core                  # App-wide configs, themes, and utilities
├── data                  # Models and repositories (API integration)
├── view_models           # MVVM ViewModels or state management logic
├── screens               # UI screens for admin panels
│   ├── dashboard.dart
│   ├── orders.dart
│   ├── products.dart
│   ├── users.dart
│   └── analytics.dart
├── services              # Remote API services and helpers
└── widgets               # Reusable UI components
```

---

## 🛠️ Requirements

- Flutter SDK (>=3.10.0)
- API backend endpoint for e-commerce platform
- Environment variables for API URLs and keys

---

## 🚀 Getting Started

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/admin_app.git
   cd admin_app
   ```
2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

---

## 📄 License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.



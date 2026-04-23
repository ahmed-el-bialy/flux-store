# 🛍️ Flux Store - Advanced E-commerce Flutter App

A professional Flutter application built with a focus on **Clean Architecture**, **Robust Networking**, and **Scalable Code Structure**.

## 🛠️ Technical Highlights (What's under the hood?)

This project isn't just about UI; it demonstrates advanced development patterns:

* **Modular Architecture:** Organized into `Models`, `Services`, `Views`, and `Widgets` for high maintainability.
* **Custom API Helper:** Built a reusable `API` helper class to handle HTTP methods (GET, POST, etc.) globally.
* **Advanced Networking with Dio:** * Implemented efficient data fetching using the **Dio** package.
    * Dynamic endpoint management for categories and products.
* **Data Modeling:** Used custom Factory Constructors (`fromJson`) for complex JSON parsing and type-safety.
* **Asynchronous UI:** Utilized `FutureBuilder` for seamless state handling during data fetching.

## ✨ Functional Features
* **Dynamic Home View:** Real-time product feed from remote servers.
* **Smart Category Search:** Filterable product catalog using dedicated category services.
* **Rich Product Details:** Complete product overview including ratings and user reviews.
* **Interactive UI:** Integrated `FontAwesome` icons and custom-built widgets for a premium feel.

## 🚀 Tech Stack
* **Frontend:** Flutter & Dart
* **API Management:** Dio
* **Architecture:** Clean Architecture (Services-based)
* **Icons:** Font Awesome Flutter
* **State Management:** Optimized using Flutter's native state handling with Service-view separation.

## 📸 Screenshots
*(Add your screenshots folder here to show off the UI)*

## 📦 Installation & Setup
1. Clone the repo: `git clone https://github.com/ahmed-el-bialy/flux-store.git`
2. Install packages: `flutter pub get`
3. Run: `flutter run`

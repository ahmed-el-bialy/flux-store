<div align="center">

# 🛍️ Flux Store

[![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![License](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS-blue.svg?style=for-the-badge)](https://flutter.dev)

**A modern, high-performance e-commerce mobile solution with beautiful UI, real-time API integration, and seamless shopping experience.**

[📱 Demo Video](#-demo-video) • [✨ Features](#-features) • [📸 Screenshots](#-screenshots) • [🏗️ Architecture](#%EF%B8%8F-architecture) • [🚀 Getting Started](#-getting-started) • [👤 Author](#-author)

</div>

---

## 📱 Demo Video

<div align="center">

### 🎬 Watch the App in Action

**[🔗 Watch on YouTube Shorts](https://youtube.com/shorts/PIg1rYA0CkQ)**

*A complete walkthrough of Flux Store demonstrating all core features and functionality.*

</div>

---

## 🎯 Overview

**Flux Store** is a modern Flutter e-commerce application that fetches real-time product data from the [DummyJSON API](https://dummyjson.com/). It features a clean product grid, smart category search, detailed product pages with customer reviews, and a persistent bottom service bar — built as a portfolio showcase for production-ready mobile development practices.

### 💡 Key Highlights
- 🎨 **Beautiful, Minimalist UI** — Clean Material Design with smooth interactions
- ⚡ **Performance Optimized** — Fast product loading with responsive grid layouts
- 🏗️ **Clean Architecture** — Well-organized layered code structure (`core`, `models`, `services`, `views`, `widgets`)
- 🌐 **Real API Integration** — Live product data from DummyJSON with Dio HTTP client
- 🔍 **Smart Category Search** — Search & browse products by category with chips and text input
- ⭐ **Customer Reviews** — Detailed review cards with ratings, comments, and formatted dates
- ❤️ **Favorites Toggle** — In-memory favorite system per product
- 📱 **Cross-Platform** — Works seamlessly on Android and iOS
- 🛡️ **Error Handling** — User-friendly error states, loading indicators, and empty guards

---

## ✨ Features

### 🏠 Core Features
- **Home Screen** — Browse all products with a modern grid layout via `ProductsList`
- **Product Categories** — Horizontal chip list for quick category filtering
- **Smart Search** — Real-time category search with validation and SnackBar feedback
- **Category Products** — Dedicated view showing products filtered by selected category
- **Product Details** — Comprehensive info with image, price, stock, rating, and description
- **Customer Reviews** — Scrollable reviews with reviewer name, date, rating, and comment
- **Favorites System** — Toggle favorite products on home cards and detail pages *(in-memory)*
- **Persistent Bottom Bar** — `ServicesBar` for Home, Search, Cart, Favorites, and Profile navigation

### ⚙️ Technical Features
- **REST API Integration** — Real-time data from DummyJSON with Dio HTTP client
- **Service Layer Pattern** — Dedicated service classes for each API endpoint
- **Responsive Design** — `flutter_screenutil` for pixel-perfect scaling across screen sizes
- **Date Formatting** — `intl` package for human-readable review dates
- **Material Design 3** — Latest Google Material Design principles
- **Named Routing** — Type-safe navigation with static route IDs
- **Defensive Parsing** — Null-safe JSON parsing with fallback values for reviews

---

## 📸 Screenshots

<div align="center">

| 🏠 Home | 🔍 Search | 📂 Category |
|:-------:|:---------:|:-----------:|
| <img src="screenshots/HomeView.png" width="200"> | <img src="screenshots/SearchView.png" width="200"> | <img src="screenshots/Categoryprducots.png" width="200"> |
| Browse all products | Search by category | Filtered products |

| 📦 Product Details | ⭐ Reviews |
|:------------------:|:----------:|
| <img src="screenshots/ProductViewP1.png" width="200"> | <img src="screenshots/ProductViewP2.png" width="200"> |
| Price, stock, description | Customer ratings & comments |

</div>

---

## 🛠️ Technical Stack

<div align="center">

| Component | Technology | Version | Purpose |
|:---------:|:----------:|:-------:|:-------:|
| **Framework** | Flutter | 3.x | Cross-platform UI |
| **Language** | Dart | 3.x | Core development |
| **HTTP Client** | Dio | ^5.9.2 | API communication |
| **Responsive UI** | flutter_screenutil | ^5.9.3 | Screen adaptation & scaling |
| **Date Formatting** | intl | ^0.20.2 | Human-readable dates |
| **Icons** | font_awesome_flutter | ^11.0.0 | Icon library |
| **State Mgmt** | setState / FutureBuilder | Built-in | UI state handling |
| **API** | DummyJSON | Live | Product data |
| **Design** | Material Design 3 | Latest | UI/UX guidelines |

</div>

---

## 🏗️ Architecture

### 📁 Project Structure

```
lib/
├── main.dart                          # App entry point with ScreenUtilInit & routes
│
├── core/                              # 🔧 Core Utilities & Configuration
│   ├── constants/
│   │   └── constants.dart             # API base URL & primary theme color
│   └── helper/
│       ├── API.dart                   # Dio HTTP wrapper (GET requests)
│       └── Data_Formater.dart         # Date formatting utility (intl)
│
├── models/                            # 📊 Data Models
│   ├── category_Model.dart            # Category data structure
│   └── product_model.dart             # Product + ReviewsModel parsing
│
├── services/                          # 🔌 API Service Layer
│   ├── all_product_services.dart      # GET /products
│   ├── category_list_services.dart    # GET /products/categories
│   └── category_products_services.dart # GET /products/category/{name}
│
├── views/                             # 🎬 UI Screens
│   ├── main_view.dart                 # Home screen — product grid + AppBar
│   ├── category_search_view.dart      # Category selection, chips & search
│   ├── category_products_view.dart    # Products filtered by category
│   └── product_view.dart              # Detailed product info + reviews
│
└── widgets/                           # 🧩 Reusable UI Components
    ├── product_card_widget.dart       # Individual product card (image, fav, price, rate)
    ├── products_list.dart             # Stateful FutureBuilder for all products
    ├── products_list_builder.dart     # Generic grid builder for product lists
    ├── categories_list_builder.dart   # Wrap of category chips
    ├── custom_text_field.dart         # Search input with validation
    ├── main_product_details.dart      # Product image, title, price & fav toggle
    ├── more_product_details.dart      # Description, rating & stock details
    ├── review_card_widget.dart        # Individual review card
    ├── reviews_list_builder.dart      # ListView of review cards
    └── services_bar.dart              # Persistent bottom navigation bar
```

### 🔄 Data Flow

```
┌─────────────┐     ┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│   Views     │────▶│  Services   │────▶│   Helper    │────▶│  DummyJSON  │
│  (Widgets)  │◀────│  (API Call) │◀────│   (Dio)     │◀────│    API      │
└─────────────┘     └─────────────┘     └─────────────┘     └─────────────┘
      │
      ▼
┌─────────────┐
│   Models    │
│ (fromJson)  │
└─────────────┘
```

**Routing:** Named routes with static ID pattern
```dart
// Route identifiers
static String id = "Home View";
static String id = "Category Search View";
static String id = "Category Products View";

// Navigation
Navigator.pushNamedAndRemoveUntil(context, MainView.id, (route) => false);
Navigator.push(context, MaterialPageRoute(builder: (_) => ProductView(model: model)));
```

---

## 🌐 API Integration

**Base URL:** `https://dummyjson.com/products`

| Endpoint | Method | Service Class | Response |
|:---------|:------:|:--------------|:---------|
| `/products` | `GET` | `AllProductsServices` | `List<ProductModel>` |
| `/products/categories` | `GET` | `CategoryListServices` | `List<CategoryModel>` |
| `/products/category/{name}` | `GET` | `CategoryProductsServices` | `List<ProductModel>` |

**HTTP Client:** Custom Dio wrapper (`core/helper/API.dart`) with exception interception.

**Example Response:**
```json
{
  "products": [
    {
      "id": 1,
      "title": "iPhone 9",
      "description": "An apple mobile which is nothing like apple",
      "price": 549,
      "rating": 4.69,
      "stock": 94,
      "thumbnail": "https://cdn.dummyjson.com/product-images/1/thumbnail.jpg",
      "reviews": [
        {
          "rating": 5,
          "comment": "Excellent product!",
          "date": "2024-05-23T08:56:21.618Z",
          "reviewerName": "Ahmed El-Bialy"
        }
      ]
    }
  ]
}
```

---

## 🧩 Data Models

### ProductModel
```dart
class ProductModel {
  final String image;           // Product thumbnail URL
  final String title;           // Product name
  final dynamic price;          // Product price
  final double rate;            // Average rating (0-5)
  final int stock;              // Available quantity
  final String description;     // Product details
  final List<ReviewsModel> reviews; // Customer reviews list
  bool isFav = false;           // Local favorite state (non-persisted)

  ProductModel({...});

  factory ProductModel.fromJson(jsonData) => ProductModel(
    image: jsonData["thumbnail"],
    title: jsonData["title"],
    price: jsonData["price"],
    rate: jsonData['rating'],
    stock: jsonData["stock"],
    description: jsonData["description"],
    reviews: rawReviews.map((r) => ReviewsModel.fromJson(r)).toList(),
  );
}
```

### ReviewsModel
```dart
class ReviewsModel {
  final int rating;             // Individual rating (1-5)
  final String comment;         // Review text
  final String date;            // ISO 8601 date string
  final String reviewerName;    // Customer name

  ReviewsModel({...});

  factory ReviewsModel.fromJson(jsonData) => ReviewsModel(
    rating: jsonData["rating"] ?? 0,
    comment: jsonData["comment"] ?? "not Found",
    date: jsonData["date"] ?? "?",
    reviewerName: jsonData["reviewerName"] ?? "unknown",
  );
}
```

### CategoryModel
```dart
class CategoryModel {
  final String name;            // Category slug/name

  CategoryModel({required this.name});

  factory CategoryModel.fromJson(jsonData) => CategoryModel(
    name: jsonData["slug"],
  );
}
```

---

## 🎨 Design System

### Color Palette
- **Primary:** `#9C27B0` (Purple) — Brand color, AppBar, bottom bar
- **Background:** `#FFFFFF` (White) — Clean, minimal aesthetic
- **Surface:** `#F5F5F5` (Light Gray) — Card backgrounds
- **Text Primary:** `#212121` (Dark Gray) — Main text
- **Text Secondary:** `#757575` (Medium Gray) — Secondary text, descriptions
- **Accent:** `#7B1FA2` (Dark Purple) — Price labels

### Typography
- **Font:** System default (Roboto / San Francisco)
- **Headlines:** Bold, 24-32sp (via flutter_screenutil)
- **Body:** Regular, 14-16sp
- **Captions:** Regular, 12-13sp

---

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.9
  dio: ^5.9.2                    # HTTP client for API calls
  font_awesome_flutter: ^11.0.0  # Icon library
  intl: ^0.20.2                  # Date formatting
  flutter_screenutil: ^5.9.3     # Responsive UI scaling

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^6.0.0
```

```bash
flutter pub get
```

---

## 🚀 Getting Started

### 📋 Prerequisites

| Requirement | Version | Purpose |
|:-----------:|:-------:|:-------:|
| Flutter SDK | >=3.11.4 | Framework |
| Dart SDK | >=3.0.0 | Language |
| Android Studio / Xcode | Latest | Emulators |
| Git | Latest | Version control |

### 💻 Installation

```bash
# 1. Clone the repository
git clone https://github.com/ahmed-el-bialy/flux-store.git
cd flux-store

# 2. Install dependencies
flutter pub get

# 3. Run the app
flutter run

# Build for production
flutter build apk --release      # Android APK
flutter build appbundle --release # Android AAB
flutter build ios --release      # iOS
```

---

## ⚠️ Known Limitations

| Issue | Details | Status |
|:------|:--------|:------:|
| Favorites not persisted | `isFav` resets on app restart | 🔧 Planned |
| Cart not implemented | Button exists in UI only | 🔧 Planned |
| No pagination | All products load at once | 🔧 Planned |
| Manual JSON parsing | No code generation | ✅ By design |
| Profile screen placeholder | Icon exists but not functional | 🔧 Planned |

---

## 🔮 Roadmap

- [ ] **Persist favorites** with Hive or SharedPreferences
- [ ] **Implement cart** with quantity management
- [ ] **Add product search** by name (not just category)
- [ ] **User authentication** with profiles
- [ ] **Offline caching** with Dio interceptors
- [ ] **State management** migration (Provider / Riverpod / Bloc)
- [ ] **Image caching** with cached_network_image
- [ ] **Widget & unit tests**
- [ ] **CI/CD** with GitHub Actions

---

## 🤝 Contributing

Contributions are welcome!

1. **Fork** the repository
2. **Create** a feature branch: `git checkout -b feature/amazing-feature`
3. **Commit** changes: `git commit -m 'feat: Add amazing feature'`
4. **Push** to branch: `git push origin feature/amazing-feature`
5. **Open** a Pull Request

---

## 📄 License

This project is licensed under the **MIT License** — see the [LICENSE](LICENSE) file for details.

---

## 👤 Author

**Ahmed El-Bialy**  
*Flutter Developer | Mobile App Specialist*

<div align="center">

[![LinkedIn](https://img.shields.io/badge/LinkedIn-%230077B5.svg?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/ahmedel-bialy/)
[![Email](https://img.shields.io/badge/Email-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:ah.elbialy.dev@gmail.com)
[![Phone](https://img.shields.io/badge/Phone-%2B201022121573-brightgreen?style=for-the-badge)](tel:+201022121573)
[![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/ahmed-el-bialy)

</div>

📧 **Email:** ah.elbialy.dev@gmail.com  
📞 **Phone:** +20 102 212 1573

---

<div align="center">

### ⭐ Star this repo if you found it helpful!

**Built with ❤️ by Ahmed El-Bialy**

</div>

# 🛍️ Flux Store

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white"/>
  <img src="https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart&logoColor=white"/>
  <img src="https://img.shields.io/badge/API-DummyJSON-6C63FF?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/Status-Completed-success?style=for-the-badge"/>
</p>

<p align="center">
A modern Flutter e-commerce app that fetches real products from a remote API, supports category browsing, product details, customer reviews, and favorites.
</p>

---

## 🎬 Demo Video

<p align="center">
  <a href="https://youtube.com/shorts/PIg1rYA0CkQ">
    <img src="https://img.shields.io/badge/▶ Watch Demo on YouTube-FF0000?style=for-the-badge&logo=youtube&logoColor=white"/>
  </a>
</p>

---

## 📸 Screenshots

<p align="center">
  <img src="screenshots/HomeView.png" width="18%" alt="Home View"/>
  &nbsp;
  <img src="screenshots/SearchView.png" width="18%" alt="Search View"/>
  &nbsp;
  <img src="screenshots/Categoryprducots.png" width="18%" alt="Category Products"/>
  &nbsp;
  <img src="screenshots/ProductViewP1.png" width="18%" alt="Product Detail"/>
  &nbsp;
  <img src="screenshots/ProductViewP2.png" width="18%" alt="Product Reviews"/>
</p>

<p align="center">
  <sub>🏠 Home &nbsp;&nbsp;&nbsp; 🔍 Search &nbsp;&nbsp;&nbsp; 📂 Category &nbsp;&nbsp;&nbsp; 📦 Product &nbsp;&nbsp;&nbsp; ⭐ Reviews</sub>
</p>

---

## ✨ Features

- 🏠 **Home Screen** — Grid view of all products with image, name, price & rating
- 🔍 **Category Search** — Browse all categories as chips or type to search
- 📂 **Category Filter** — View products filtered by selected category
- 📦 **Product Details** — Full product page with description, stock & rating
- ⭐ **Customer Reviews** — Reviews with reviewer name, date & star rating
- ❤️ **Favorites** — Toggle favorite on any product from card or detail view
- 📡 **Live API Data** — All data fetched in real-time from DummyJSON API
- ⚠️ **Error Handling** — No-internet UI with clear user message

---

## 🏗️ Project Structure

```
lib/
├── Constants/
│   └── Constants.dart                  # API base URL & theme color
│
├── Models/
│   ├── Product_Model.dart              # ProductModel + ReviewsModel
│   └── Category_Model.dart             # CategoryModel
│
├── Services/
│   ├── All_Product_Services.dart       # GET /products
│   ├── Category_List_Services.dart     # GET /products/categories
│   └── Category_Products_Services.dart # GET /products/category/{name}
│
├── Views/
│   ├── Main_View.dart                  # Home screen
│   ├── Product_View.dart               # Product detail screen
│   ├── Category_Search.dart            # Category search screen
│   └── Category_Products.dart          # Products by category screen
│
├── Widgets/
│   ├── Products_List.dart              # Stateful product list wrapper
│   ├── Products_List_Builder.dart      # FutureBuilder grid layout
│   ├── Product_Card_Widget.dart        # Single product card
│   ├── CategoriesListBuilder.dart      # Category chips list
│   ├── Custom_Text_Field.dart          # Search text field
│   ├── MainProductPart.dart            # Product image, title, price
│   ├── DetilsProductPart.dart          # Description, stock, rating
│   ├── Reviews_List_Builder.dart       # Reviews list
│   ├── Review_Card_Widget.dart         # Single review card
│   └── ServicesBar.dart                # Bottom navigation bar
│
└── helper/
    ├── API.dart                        # Dio HTTP GET wrapper
    └── Data_Formater.dart              # Date formatter (intl)
```

---

## 🔄 Navigation Flow

```
MainView (Home)
    │
    ├──► ProductView         (tap product card)
    │
    └──► CategorySearch      (tap search icon)
              │
              ├──► CategoryProducts    (tap category chip)
              │         │
              │         └──► ProductView  (tap product card)
              │
              └──► CategoryProducts    (type & submit in search field)
```

---

## 🌐 API — DummyJSON

| Method | Endpoint | Service Class |
|--------|----------|---------------|
| `GET` | `/products` | `AllProductsServices` |
| `GET` | `/products/categories` | `CategoryListServices` |
| `GET` | `/products/category/{name}` | `CategoryProductsServices` |

> Base URL is defined in `Constants/Constants.dart` as `apiUrl`.

---

## 🧩 Data Models

**ProductModel**
```
image · title · price · rate · stock · description · isFav · reviews[]
```

**ReviewsModel**
```
rating · comment · date · reviewerName
```

**CategoryModel**
```
name  (mapped from JSON "slug" field)
```

---

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  dio: ^5.x.x                    # HTTP client
  intl: ^0.x.x                   # Date formatting
  font_awesome_flutter: ^10.x.x  # AppBar icons
```

```bash
flutter pub get
```

---

## 🚀 Getting Started

### Requirements
- Flutter SDK `>=3.0.0`
- Dart `>=3.0.0`
- Active internet connection

### Run

```bash
git clone https://github.com/your-username/flux_store.git
cd flux_store
flutter pub get
flutter run
```

---

## ⚠️ Known Limitations

| Issue | Details |
|-------|---------|
| Favorites not persisted | `isFav` state resets on app restart |
| Cart not implemented | Button exists in UI only |
| Profile not implemented | Button exists in UI only |

---

## 🔮 Future Improvements

- [ ] Persist favorites with `Hive` or `shared_preferences`
- [ ] Implement cart with quantity management
- [ ] Add search by product name
- [ ] User authentication
- [ ] Offline caching with Dio interceptors
- [ ] State management (Provider / Bloc / Riverpod)

---

## 👨‍💻 Author

**Ahmed El-Bialy**

<p>
  <a href="https://www.linkedin.com/in/ahmedel-bialy">
    <img src="https://img.shields.io/badge/LinkedIn-Ahmed El--Bialy-0077B5?style=for-the-badge&logo=linkedin&logoColor=white"/>
  </a>
  &nbsp;
  <a href="mailto:ah.elbialy.dev@gmail.com">
    <img src="https://img.shields.io/badge/Gmail-ah.elbialy.dev@gmail.com-D14836?style=for-the-badge&logo=gmail&logoColor=white"/>
  </a>
</p>

📞 +20 102 212 1573

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

# 🛍️ Flux Store

&lt;p align="center"&gt;
  &lt;img src="https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white"&gt;
  &lt;img src="https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart&logoColor=white"&gt;
  &lt;img src="https://img.shields.io/badge/API-DummyJSON-6C63FF?style=for-the-badge"&gt;
  &lt;img src="https://img.shields.io/badge/State-setState-orange?style=for-the-badge"&gt;
  &lt;img src="https://img.shields.io/badge/License-MIT-green?style=for-the-badge"&gt;
&lt;/p&gt;

A production-ready Flutter e-commerce application demonstrating clean architecture principles, real-time API integration, and responsive UI design. Built as a portfolio showcase for modern mobile development practices.

---

## 🎬 Demo

[![Watch Demo](https://img.shields.io/badge/▶_Watch_Demo-FF0000?style=for-the-badge&logo=youtube&logoColor=white)](https://youtube.com/your-demo-link)

---

## 📱 Screenshots

| Home | Search | Category | Product | Reviews |
|:----:|:------:|:--------:|:-------:|:-------:|
| &lt;img src="screenshots/HomeView.png" width="150"&gt; | &lt;img src="screenshots/SearchView.png" width="150"&gt; | &lt;img src="screenshots/Categoryprducots.png" width="150"&gt; | &lt;img src="screenshots/ProductViewP1.png" width="150"&gt; | &lt;img src="screenshots/ProductViewP2.png" width="150"&gt; |

---

## ✨ Features

| Feature | Implementation Details |
|---------|----------------------|
| 🏠 **Product Grid** | 2-column responsive grid with `GridView.builder`, image caching via `CachedNetworkImage` |
| 🔍 **Category Search** | Real-time category chips + text search with `TextField` debouncing |
| 📂 **Category Filter** | Dynamic routing with category slug parameter |
| 📦 **Product Details** | Hero animation ready layout, stock indicator, price formatting |
| ⭐ **Reviews System** | Star rating display, date formatting with `intl`, reviewer attribution |
| ❤️ **Favorites** | In-memory toggle with `setState` (UI feedback immediate) |
| ⚠️ **Error Boundaries** | User-friendly error UI for network failures |
| 🌐 **Live API** | Real-time data from DummyJSON with loading states |

---

## 🏗️ Architecture

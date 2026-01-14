# 🏗 Architecture Overview

This project uses **Feature-First architecture**.

Each feature is isolated and modular. APIs and logic that are specific to a feature remain inside
that feature folder. Shared functionality is moved to a shared module.

---

## 🔁 Shared Features Usage

Shared features like common APIs are stored in the `shared` folder.

Example:  
The Translations API (used to update translations of the app by fetching from server) is required in
both the `app_initializer` feature and the `profile` feature, so it is placed in the `shared`
folder.

---

## ♻️ Promoting Shared Logic

If any API is needed in multiple features, extract it from the feature and move it to the `shared`
folder.  
Then inject it into any feature’s view model to use it.

---

## 🆕 Adding New APIs

Before adding a new API:

1. Search the **API endpoint** in the whole project.
2. Check if it already exists in a shared module or another feature.
3. If it exists, reuse it.
4. If not, implement it in the relevant feature or `shared` folder if it is expected to be reused.

---

## 🌍 Remote Translations

Translations are fetched from the server using the shared Translations API.

## 🔄 MVVM with Riverpod

Each feature follows MVVM:

- **View (Pages / Widgets)**  
  Platform-specific UI (mobile / tablet / desktop)

- **ViewModel**
  Handles UI logic, state, and business rules

- **Provider**
  Riverpod providers for dependency injection & lifecycle management


## 📱 Multi-Platform UI Support

This project supports:
- Mobile
- Tablet
- Desktop

Each platform has its own UI implementation while sharing the same ViewModel and business logic.

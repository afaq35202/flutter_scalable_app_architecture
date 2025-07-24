# 🔗 Shared Feature Guidelines

The `shared/` folder contains reusable logic or APIs that are used across multiple features.

Example:  
The Translations API is used by both `app_initializer` and `profile`, so it is saved in the `shared` folder.

---

## ✅ When to Use `shared/`

- When a feature or API is reused in multiple places
- When common logic like translations, auth, or utilities is needed globally

---

## ➕ How to Use Shared Features

- Simply inject the shared logic into any feature's view model where needed
- Avoid duplicating shared code in multiple features

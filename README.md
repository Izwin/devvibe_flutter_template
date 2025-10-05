# Flutter Starter Template 🚀

A production-ready Flutter boilerplate with authentication, theming, localization, and clean architecture to kickstart your next project.

## ✨ Features

- 🔐 **Google Authentication** - Firebase Auth integration with automatic Firestore user storage
- 🎨 **Dynamic Theming** - Light/Dark/System themes with persistent storage
- 🌍 **Internationalization** - Multi-language support with easy ARB-based translations
- 🧭 **Navigation** - GoRouter with authentication guards
- 🏗️ **Clean Architecture** - Separation of concerns with Domain, Data, and Presentation layers
- 📦 **State Management** - BLoC pattern for predictable state handling
- 💉 **Dependency Injection** - GetIt for loose coupling and testability
- ⚡ **Ready to Deploy** - Production-ready structure and best practices

## 📱 Demo

The template includes:
- Complete authentication flow with Google Sign-In
- Real-time theme switching (Light/Dark/System)
- Language selection with instant updates
- Smooth splash screen with authentication checks

## 🏗️ Architecture

This project follows **Clean Architecture** principles with three main layers:

```
features/
├── domain/          # Business logic and entities
│   ├── entity/      # Core business models
│   └── repository/  # Abstract repository interfaces
├── data/            # Data handling and external services
│   ├── datasource/  # Remote/Local data sources
│   ├── model/       # Data models
│   └── repository/  # Repository implementations
└── presentation/    # UI and state management
    ├── bloc/        # BLoC state management
    └── pages/       # UI screens
```

## 📂 Project Structure

```
lib/
├── core/
│   ├── di/              # Dependency injection setup
│   ├── failure/         # Error handling classes
│   ├── router/          # Navigation configuration
│   └── theme/           # Theme system (colors, widgets, BLoC)
├── features/
│   ├── auth/            # Authentication feature
│   └── home/            # Home screen example
├── l10n/                # Localization files and logic
├── main.dart            # App entry point
└── splash_page.dart     # Initial loading screen
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.0+)
- Firebase account
- Node.js (for Firebase CLI)

### Firebase Setup

1. **Create Firebase Project**
    - Go to [Firebase Console](https://console.firebase.google.com/)
    - Create a new project

2. **Enable Authentication**
    - Navigate to Authentication → Sign-in method
    - Enable Google authentication
    - Add your support email

3. **Enable Firestore**
    - Navigate to Firestore Database
    - Create database in test mode
    - ⚠️ Add security rules before production

4. **Configure Firebase CLI**
   ```bash
   npm install -g firebase-tools
   firebase login
   flutterfire configure
   ```

### iOS Configuration

1. Download `GoogleService-Info.plist` from Firebase Console
2. Open the file and copy the `CLIENT_ID`
3. Navigate to `ios/Runner/Info.plist`
4. Paste `CLIENT_ID` in the marked location (see comments in file)
5. Copy `REVERSED_CLIENT_ID` from the same plist
6. Paste it in the second marked location in `Info.plist`

### Android Configuration

1. **Generate SHA Keys**
   ```bash
   # Debug keys
   keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android
    ```

2. Add both SHA-1 and SHA-256 keys to Firebase Console (Project Settings → Your Android App)

3. Download the updated `google-services.json` and replace it in `android/app/`

### Installation

```bash
# Install dependencies
flutter pub get

# Generate localization files
flutter gen-l10n

# Run the app
flutter run
```

## 🎨 Customization

### Adding a New Language

1. Create a new ARB file in `lib/l10n/` (e.g., `app_fr.arb`)
2. Copy strings from `app_en.arb` and translate
3. Run `flutter gen-l10n`
4. The new language will be automatically available

### Customizing Theme Colors

Edit `lib/core/theme/app_colors.dart` to change colors for both light and dark themes. Changes apply instantly across the entire app.

### Adding Authentication Methods

1. Add new methods to `auth_remote_data_source.dart`
2. Update `auth_repository_impl.dart`
3. Create corresponding events in `auth_event.dart`
4. Handle events in `auth_bloc.dart`

### Adding New Features

Follow the clean architecture pattern:

1. Create a new folder in `features/`
2. Add `domain/`, `data/`, and `presentation/` layers
3. Register dependencies in `core/di/service_locator.dart`
4. Add routes in `core/router/app_router.dart`

## 📦 Dependencies

Key packages used:
- `firebase_auth` & `firebase_core` - Authentication
- `cloud_firestore` - User data storage
- `google_sign_in` - Google authentication
- `go_router` - Navigation
- `flutter_bloc` - State management
- `get_it` - Dependency injection
- `dartz` - Functional error handling
- `shared_preferences` - Local storage

## 🧪 Testing

The clean architecture structure makes testing straightforward:
- **Domain layer**: Test business logic in isolation
- **Data layer**: Mock data sources and test repositories
- **Presentation layer**: Test BLoC logic and UI components

## 📝 How It Works

1. **App Launch**: `main.dart` dispatches an authentication check event
2. **Splash Screen**: Listens to auth state and navigates accordingly
3. **Authentication**: Users are redirected to login or home based on auth status
4. **Persistent State**: Theme preferences and user sessions are saved locally

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## ⭐ Show Your Support

If this template helped you, please give it a star on GitHub!

## 📧 Contact

For questions or support, please open an issue on GitHub or contact me via email.

halilovrauf268@gmail.com

---

**Happy Coding!** 🎉
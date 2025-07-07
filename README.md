
# Flutter ChatApp 

A real-time chat application built with Flutter and Firebase.

This project enables users to chat with each other in real-time using Google Sign-In, Firebase Firestore, and Firebase Cloud Functions. It supports text messaging, media sharing, real-time updates, user authentication, profile management, and push notifications.

---

##  Features

- Google Sign-In for user authentication
- Real-time chat using Firebase Firestore
- Send text and image messages
- User profile management (update profile picture and display name)
- Push notifications using Firebase Cloud Messaging (via Firebase Cloud Functions)
- Firebase backend (Authentication, Firestore, Storage, Cloud Functions)
- Supports Android and iOS platforms

---

##  Getting Started

### Prerequisites

- Flutter SDK (stable version recommended)
- Dart SDK
- Android Studio or Xcode (for running emulator or physical device)
- A Firebase project (set up for both Android and iOS)

---

## ⚙ Setup Instructions

1. **Clone the Repository**
   ```bash
   git clone https://github.com/pukarnepali/flutter_chatapp.git
   cd flutter_chatapp


2. **Install Dependencies**

   ```bash
   flutter pub get
   ```

3. **Configure Firebase**

   * Create a new Firebase project from [Firebase Console](https://console.firebase.google.com/)
   * Enable **Authentication** > **Google Sign-In**
   * Enable **Cloud Firestore** (in test mode)
   * Enable **Cloud Storage** (for image uploads)
   * Enable **Cloud Messaging** (for push notifications)
   * Download the `google-services.json` file and place it in the `android/app/` directory
   * Download the `GoogleService-Info.plist` file and place it in the `ios/Runner/` directory

4. **Update Dependencies**

   ```bash
   flutter clean
   flutter pub get
   ```

5. **Run the Application**

   * For Android:

     ```bash
     flutter run
     ```
   * For iOS:

     ```bash
     cd ios
     pod install
     cd ..
     flutter run
     ```




# Salus Mental Health

This app is about users being able to chat with therapists easily.

## Getting Started

Flutter SDK Version => 3.0.4

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  # Network
  cached_network_image: ^3.2.1

  # Utility
  kartal:
    git: https://github.com/VB10/kartal

  # State
  flutter_bloc: ^8.0.1
  provider: ^6.0.3

  # Localization
  easy_localization: ^3.0.0
  hive_flutter: ^1.1.0

  

  cupertino_icons: ^1.0.2
  google_fonts: ^3.0.1

  # Firebase
  firebase_auth: ^3.6.2
  firebase_core: ^1.20.0
  cloud_firestore: ^3.4.2
  firebase_messaging: ^12.0.1
  
  # Auth
  sign_in_with_apple: ^4.1.0
  google_sign_in: ^5.4.0
  flutter_login: ^4.0.0


  # Helper
  crypto: ^3.0.2
  encrypt: ^5.0.1
  equatable: ^2.0.3
  font_awesome_flutter: ^10.1.0

  json_annotation: ^4.6.0
  logger: ^1.1.0
  
  shared_preferences: ^2.0.15
  dio: ^4.0.6
  intl: ^0.17.0
``` 
You can install packages from the command line:

```bash
$ flutter pub get
..
```

Technologies used in practice

- For database => Firebase
- For State Management => Bloc and Provider
- For CD process => Fastlane

Features available in the app 

- Login and Register 
- User Views
- Notification System(Have some bugs)
- Profile Page Edit
- Chat 
- Assign Page user to corp
- User status badges
- Fastlane update to App Store

The application summary is as follows, after the user logs in, the admin greets him. After the user talks to the admin via chat, the admin assigns a therapist to the user. Then, the user has a meeting with the therapist. The user has a page where he can update his name and surname. Users' online and offline statuses are under control, such as whether a therapist is appointed.



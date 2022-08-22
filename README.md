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


# Application ScreenShoots
  <table>
  <tr>
  <td><img width="297" alt="Screen Shot 2022-08-08 at 08 26 03" src="https://user-images.githubusercontent.com/45129432/183347207-31641ee5-8cb8-47e5-bddc-62dd16b3b6ae.png" ></td>
    <td><img width="291" alt="Screen Shot 2022-08-08 at 08 36 48" src="https://user-images.githubusercontent.com/45129432/183346976-aeaacd9e-6b83-4b9d-a957-dd748c205173.png" ></td>
    <td><img width="291" alt="Screen Shot 2022-08-08 at 08 37 33" src="https://user-images.githubusercontent.com/45129432/183347108-1bc64c62-defd-4f3b-9bfc-ed37769d1fd9.png" ></td>
   </td>
   
    
  </tr>
 <td><img width="294" alt="Screen Shot 2022-08-08 at 08 34 43" src="https://user-images.githubusercontent.com/45129432/183347143-1fe5cff9-afdb-4e76-bd04-2f432b9a6801.png" >
  <td><img width="293" alt="Screen Shot 2022-08-08 at 08 32 49" src="https://user-images.githubusercontent.com/45129432/183347164-edc17717-34bb-4acf-b9a0-0eb971d851da.png" ></td>
  <td><img width="295" alt="Screen Shot 2022-08-08 at 08 29 47" src="https://user-images.githubusercontent.com/45129432/183347188-2c2a442a-1b78-41bf-b2f9-44d3d9126e07.png"></td>
  
  </table>







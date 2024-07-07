# open_weathermap

## Overview📙 <br>
The Flutter Weather App is a visually captivating and fully functional User Interface for discovering the weather status. The app allows users to access their accurate weather information in addition to some cities around the world. It provides real-time weather updates, forecasts, and more.

## Dependencies 📦️
- [google_fonts](https://pub.dev/packages/google_fonts)- To manage the fonts.
- [http](https://pub.dev/packages/http) -Http networking package for flutter/dart.
- [provider](https://pub.dev/packages/provider) - to manage the app state.
- [shared_preferences](https://pub.dev/packages/shared_preferences) - to store last searched city on locally.
- [connectivity_plus](https://pub.dev/packages/connectivity_plus) - To check internet connections eg. wifi or mobile.

## Features🌟<br>
- Discover the weather at your place.
- Discover the weather around the world.
- 24-hour weather forecast.
- Sunrise time, sunset time
- Wind speed and direction.
- Provide details on humidity, pressure, UV, and chance of rain.
- Beautiful and friendly user interface.

  
## Getting Started
1. Get your API key by creating an account at [WeatherAPI](https://www.weatherapi.com).
2. Clone the repository

   ```sh
   git clone https://github.com/flutterrushikesh/Statemanagement-flutter.git and go to this path app state/Provider/WeatherMap App/open_weathermap.
   ```
3. Install all the packages by running
   ```sh
   flutter pub get
   ```
4. Navigate to **lib/controller/api_key.dart** and paste your API key to the apiKey variable
   ```dart
   const String apiKey='Your API Key';
   ```
5. Run the App
   ```dart
   flutter run
   ```
---

# 🌿 Ecopocket - Expenses Tracker & Budget Manager

**Ecopocket** is a simple yet powerful **Flutter** app designed to help users track their personal expenses and manage their budgets effectively. Built using **Clean Architecture** and **Riverpod 2.0**, the app offers a minimalistic UI with robust features for expense tracking and financial analysis.

## 📱 Features

- **Track Personal Expenses**: Keep a log of your daily, weekly, and monthly spending habits.
- **Spending Analytics**: Get insights into your spending patterns with visual analytics.
- **Budget Management**: Set and manage budgets for different categories (e.g., food, transport, entertainment).
- **Minimalistic UI**: A simple, easy-to-use interface for a seamless experience.

## 🏗️ Architecture

The app is designed following **Clean Architecture** principles, ensuring:

- **Separation of Concerns**: Organized codebase with well-defined layers:  
  - `Data Layer`: Responsible for fetching and storing data (local/remote).
  - `Domain Layer`: Contains business logic and entities.
  - `Application Layer`: Manages use cases and business rules.
  - `Presentation Layer`: UI and state management.
  
- **Scalability**: Features are organized into modules, making it easy to add or update without impacting the whole app.
  
- **Maintainability**: With a modular structure and domain-driven design, the app can be extended and maintained over time.

## 🌊 State Management with Riverpod 2.0

This app uses **Riverpod 2.0**, a powerful state management solution for Flutter, offering:

- **Reactive State Management**: Efficient handling of state changes and async data.
- **Boilerplate Reduction**: With Riverpod's code generation, there's no need to manually write providers.
- **Performance**: Efficient caching and data binding for smooth app performance.

## 📸 Screenshots

![App Platorm](https://i.ibb.co/rcqsP5p/Ecopocket-Mockup.png)

## 🛠️ Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/ecopocket.git

2. Navigate to the project directory:
   ```bash
   cd ecopocket

3. Install the necessary dependencies:
   ```bash
   flutter pub get

4. Run the app on your preferred device:
   ```bash
   flutter run

## 🔧 Technologies Used

- **Flutter**: Mobile development framework.
- **Riverpod**: 2.0: State management library.
- **Dart**: Programming language.
- **Clean Architecture**: Software design pattern.

## 🤝 Contribution

Contributions are welcome! Please open an issue or submit a pull request with your improvements or bug fixes.

## 📝 License

This project is licensed under the MIT License.




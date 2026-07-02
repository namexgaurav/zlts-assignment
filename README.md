# ZLTS ASSIGNMENT - Flutter Clean Architecture App

## Overview

This project is a Flutter application built using **Clean Architecture** principles and **BLoC (flutter_bloc)** for state management.
The app fetches and displays data from a public REST API in a scalable and maintainable way.

---

## Architecture

The project follows **Clean Architecture**, which separates the app into three main layers:

### 1. Presentation Layer

* Handles UI and user interaction
* Uses **BLoC (Business Logic Component)** for state management
* Components:
  
  * Pages (UI)
  * Bloc / Events / States

### 2. Domain Layer

* Contains business logic
* Independent of external frameworks
* Components:

  * Entities
  * Repositories
  * UseCases

### 3. Data Layer

* Handles data fetching and storage
* Implements repository interfaces
* Components:

  * Models
  * DataSources (API)
  * Repository Implementations

---

## Folder Structure

```
lib/
│── core/                  # Common network, error handling
│── features/
│   └── show_posts/
│       ├── data/
│       │   ├── datasources/
│       │   ├── models/
│       │   └── repositories/
│       │
│       ├── domain/
│       │   ├── entities/
│       │   ├── repositories/
│       │   └── usecases/
│       │
│       └── presentation/
│           ├── bloc/
│           └── pages/
│
│── init_dependencies.dart  # Dependency Injection setup
│── main.dart
```

---

## Third-Party Packages Used
  ### Dependencies 
 (are required at runtime)

* `flutter_bloc` → State management
* `equatable` → Simplifies value comparison
* `dio` → HTTP client for API calls
* `go_router` → Routing
* `retrofit` → Type-safe API integration
* `get_it` → Dependency injection
* `json_annotation` → JSON serialization

  ### Dev_Dependencies
  (are only used during development)
  
  * `build_runner` → It reads annotation and generates files
  * `retrofit_generator` → Generate API implementation from abstract class
  * `json_serializable` → Automatically generate code for converting to end from JSON by annotating Dart classes.
---

## Setup Instructions

### Prerequisites

* Flutter SDK (>= 3.x)
* Dart SDK
* Android Studio / VS Code
* Emulator or physical device

---

### 1. Clone the Repository

```bash
git clone https://github.com/namexgaurav/zlts-assignment.git
cd zlts-assignment
```

---

### 2. Install Dependencies

```bash
flutter pub get
```

---

### 3. Generate Required Files

(For Retrofit & JSON serialization)

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

---

### 4. Run the App

```bash
flutter run
```

---

## 🚀 Features

* API Integration using Dio + Retrofit
* Scalable Clean Architecture
* State Management with BLoC
* Error handling and loading states
* Modular and testable codebase


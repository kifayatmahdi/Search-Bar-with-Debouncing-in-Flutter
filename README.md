# Search Bar with Debouncing in Flutter
This example demonstrates how to implement a search bar with debouncing in Flutter.
Debouncing ensures that the search function is not called on every keystroke.
Instead, it waits for the user to stop typing before making the API request.

## Features
- Debounced search bar
- Avoids unnecessary API calls
- Improves performance
- Clean and simple code structure

## How Debouncing Works
- Runs a timer every time text changes.
- If typing continues, the previous timer is canceled.
- Search triggers only when user stops typing for400ms.
- Great for reducing API load.

## How to Run

1. **Clone the project:**
   ```sh
   git clone https://github.com/yourname/yourrepo
2. **Install dependencies:**
    ```sh
   flutter pub get
3. **Run the app:**
    ```sh
   flutter run


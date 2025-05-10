# Dynamic Nonprofit Project

[![GitHub repo](https://img.shields.io/badge/Repository-Visit-blue?style=flat-square)](https://github.com/sisovin/dynamic-nonprofit-project)

Welcome to the **Dynamic Nonprofit Project**! This repository is designed to serve as the foundation for dynamic nonprofit projects, leveraging the power of Python (Django) and Dart (Flutter) to create a seamless backend and frontend integration.

## Features

- **Backend**: A robust RESTful API built with Django, ensuring scalability and reliability.
- **Frontend**: A cross-platform mobile and web app designed with Flutter (Dart), providing a dynamic and intuitive user interface.
- **Containerization**: Dockerized services for easy deployment and development.

---

## Getting Started

Follow these instructions to set up the project locally and start contributing.

---

### How to Set Up Django (Backend)

1. **Clone the Repository**  
   ```bash
   git clone https://github.com/sisovin/dynamic-nonprofit-project.git
   cd dynamic-nonprofit-project
   ```

2. **Navigate to the Backend Directory**  
   If the backend is located in a subdirectory (e.g., `backend`), move into it:  
   ```bash
   cd backend
   ```

3. **Create and Activate a Virtual Environment**  
   ```bash
   python3 -m venv env
   source env/bin/activate  # On Windows, use `env\Scripts\activate`
   ```

4. **Install Dependencies**  
   ```bash
   pip install -r requirements.txt
   ```

5. **Apply Migrations**  
   ```bash
   python manage.py migrate
   ```

6. **Run the Development Server**  
   ```bash
   python manage.py runserver
   ```

   The server will be running at `http://127.0.0.1:8000`.

---

### How to Set Up Flutter (Frontend)

1. **Install Flutter**  
   Follow the official guide to install Flutter: [Flutter Installation Guide](https://flutter.dev/docs/get-started/install).

2. **Verify Installation**  
   Run the following command to ensure Flutter is installed correctly:  
   ```bash
   flutter doctor
   ```

3. **Navigate to the Flutter Directory**  
   If the frontend is located in a subdirectory (e.g., `frontend`), move into it:  
   ```bash
   cd frontend
   ```

4. **Install Dependencies**  
   ```bash
   flutter pub get
   ```

5. **Run the Application**  
   To run the Flutter app on a connected device or emulator:  
   ```bash
   flutter run
   ```

6. **Build the Application**  
   To build the application for release:  
   ```bash
   flutter build apk  # For Android
   flutter build ios  # For iOS
   ```

---

## Project Structure

```
dynamic-nonprofit-project/
├── backend/        # Django backend
├── frontend/       # Flutter frontend
├── Dockerfile      # Docker configuration
├── README.md       # Project documentation
└── ...
```

---

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request with your changes.

---

## License

This project is licensed under the [MIT License](LICENSE).

---

# Dynamic Nonprofit Project

This project is a dynamic nonprofit project management application. It consists of a backend API built with Django and a frontend application built with Flutter. The application is containerized using Docker and can be deployed using Docker Compose.

## Project Structure

```
├── apps/
│   ├── backend/
│   │   ├── my_api/
│   │   │   ├── migrations/
│   │   │   ├── __init__.py
│   │   │   ├── admin.py
│   │   │   ├── apps.py
│   │   │   ├── models.py
│   │   │   ├── serializers.py
│   │   │   ├── urls.py
│   │   │   ├── views.py
│   │   │   └── tests.py
│   └── frontend/
│       ├── android/
│       ├── ios/
│       ├── lib/
│       │   ├── constants/
│       │   │   └── app_constants.dart
│       │   ├── app.dart
│       │   ├── main.dart
│       │   └── routes.dart
│       ├── web/
│       │   ├── favicon.png
│       │   ├── icons/
│       │   ├── index.html
│       │   ├── manifest.json
│       │   └── styles/
│       ├── pubspec.yaml
│       ├── README.md
│       └── Dockerfile
├── .gitignore
├── README.md
└── docker-compose.yml
```

## Backend API

The backend API is built using Django and is located in the `apps/backend/my_api` directory.

### Models

The data models are defined in `models.py`. The following models are included:

- `Nonprofit`: Represents a nonprofit organization with fields for name, description, and website.
- `Project`: Represents a project associated with a nonprofit, with fields for title, description, start date, and end date.

### Serializers

Serializers are used to convert model instances to JSON. They are defined in `serializers.py`:

- `NonprofitSerializer`: Serializes the `Nonprofit` model.
- `ProjectSerializer`: Serializes the `Project` model.

### Views

Views handle API requests and are implemented in `views.py`.

### URLs

URL patterns are defined in `urls.py` to route requests to the appropriate views.

### Admin

The models are registered with the Django admin site in `admin.py`.

### Tests

Tests for the API endpoints are written in `tests.py`.

## Frontend Application

The frontend application is built using Flutter and is located in the `apps/frontend` directory.

### Constants

App-wide constants are defined in `lib/constants/app_constants.dart`.

### Main App Structure

The main app structure is implemented in `lib/app.dart` and `lib/main.dart`.

### Routes

Routes for navigation between screens are defined in `lib/routes.dart`.

## Docker and Deployment

The application is containerized using Docker.

### Frontend Dockerfile

A Dockerfile to build the frontend container is located in `apps/frontend/Dockerfile`.

### Docker Compose

The `docker-compose.yml` file defines and runs multi-container Docker applications. It ensures that the backend and frontend containers can communicate with each other.

## Setup and Usage

### Prerequisites

- Docker
- Docker Compose
- Python 3.x
- Flutter

### Backend Setup

1. Navigate to the `apps/backend` directory:
   ```
   cd apps/backend
   ```

2. Create a virtual environment:
   ```
   python -m venv venv
   ```

3. Activate the virtual environment:
   - On Windows:
     ```
     venv\Scripts\activate
     ```
   - On macOS/Linux:
     ```
     source venv/bin/activate
     ```

4. Install the required packages:
   ```
   pip install -r requirements.txt
   ```

5. Apply the database migrations:
   ```
   python manage.py migrate
   ```

6. Run the development server:
   ```
   python manage.py runserver
   ```

### Frontend Setup

1. Navigate to the `apps/frontend` directory:
   ```
   cd apps/frontend
   ```

2. Get the Flutter dependencies:
   ```
   flutter pub get
   ```

3. Run the Flutter app:
   ```
   flutter run
   ```

### Docker Setup

1. Build and run the Docker containers using Docker Compose:
   ```
   docker-compose up --build
   ```

2. Access the application:
   - Backend API: `http://localhost:8000`
   - Frontend: `http://localhost:3000`

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
│       │   ├── models/
│       │   │   ├── campaign.dart
│       │   │   ├── donation.dart
│       │   │   ├── team_member.dart
│       │   │   ├── testimonial.dart
│       │   │   ├── volunteer.dart
│       │   ├── pages/
│       │   │   ├── home_page.dart
│       │   │   ├── about_page.dart
│       │   │   ├── causes_page.dart
│       │   │   ├── donate_page.dart
│       │   │   ├── contact_page.dart
│       │   │   ├── team_page.dart
│       │   │   ├── testimonial_page.dart
│       │   ├── services/
│       │   │   ├── api_service.dart
│       │   │   ├── auth_service.dart
│       │   │   ├── donation_service.dart
│       │   ├── widgets/
│       │   │   ├── animated_progress_bar.dart
│       │   │   ├── responsive_navbar.dart
│       │   │   ├── carousel_slider.dart
│       │   │   ├── donation_form.dart
│       │   │   ├── parallax_background.dart
│       │   ├── app.dart
│       │   ├── main.dart
│       │   ├── routes.dart
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
- `Campaign`: Represents a fundraising campaign with fields for title, description, image, target amount, raised amount, start date, end date, and is_featured.
- `TeamMember`: Represents a team member with fields for name, position, bio, image, and social links.
- `Testimonial`: Represents a testimonial with fields for author, role, content, image, and rating.
- `Donation`: Represents a donation with fields for amount, donor, campaign, date, and anonymous.
- `Volunteer`: Represents a volunteer with fields for name, email, phone, skills, and availability.

### Serializers

Serializers are used to convert model instances to JSON. They are defined in `serializers.py`:

- `NonprofitSerializer`: Serializes the `Nonprofit` model.
- `ProjectSerializer`: Serializes the `Project` model.
- `CampaignSerializer`: Serializes the `Campaign` model.
- `TeamMemberSerializer`: Serializes the `TeamMember` model.
- `TestimonialSerializer`: Serializes the `Testimonial` model.
- `DonationSerializer`: Serializes the `Donation` model.
- `VolunteerSerializer`: Serializes the `Volunteer` model.

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

### Models

Data models are defined in the `lib/models` directory:

- `Campaign`: Represents a fundraising campaign.
- `Donation`: Represents a donation.
- `TeamMember`: Represents a team member.
- `Testimonial`: Represents a testimonial.
- `Volunteer`: Represents a volunteer.

### Pages

The main pages of the application are defined in the `lib/pages` directory:

- `home_page.dart`: The home page of the application.
- `about_page.dart`: The about page with mission, vision, and team member grid.
- `causes_page.dart`: The causes page with campaign cards grid, filtering, and pagination.
- `donate_page.dart`: The donate page with donation form, payment gateway integration, and progress bar animation.
- `contact_page.dart`: The contact page with contact form, Google Maps integration, and form validation.
- `team_page.dart`: The team page with team member bios, social links, and modal for detailed view.
- `testimonial_page.dart`: The testimonial page with testimonial carousel, rating stars, and swipe gestures.

### Services

Services for API calls and authentication are defined in the `lib/services` directory:

- `api_service.dart`: Base API client with all API calls and error handling.
- `auth_service.dart`: Handles login/logout, JWT storage, and user state management.
- `donation_service.dart`: Handles donation processing, receipt generation, and payment validation.

### Widgets

Reusable widgets are defined in the `lib/widgets` directory:

- `animated_progress_bar.dart`: Animated progress indicator with percentage display and smooth transitions.
- `responsive_navbar.dart`: Desktop navigation, mobile drawer, and active route highlighting.
- `carousel_slider.dart`: Auto-sliding carousel with indicator dots and smooth transitions.
- `donation_form.dart`: Donation form fields, validation, and payment options.
- `parallax_background.dart`: Parallax effect with scroll listener and optimized performance.

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

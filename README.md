# Krishi-Bazar

Krishi-Bazar is a digital agricultural marketplace platform that connects farmers directly with buyers, facilitating efficient trade of agricultural products.

## Overview

This platform aims to eliminate middlemen in agricultural trade, providing farmers with better prices for their produce while offering buyers access to fresh, locally-sourced agricultural products. The system includes bidding functionality, crop management, user profiles, and notifications.

## Features

- **User Authentication**: Separate registration and login for farmers and buyers
- **Crop Management**: Farmers can add, update, and manage their crop listings
- **Bidding System**: Buyers can create demands and farmers can place bids
- **Multilingual Support**: Available in English, Hindi, and Kannada
- **Notifications**: Real-time notifications for bids, demands, and transactions
- **Dashboards**: Specialized dashboards for farmers and buyers
- **Crop Recommendations**: Intelligent crop recommendations based on various factors

## Technology Stack

- **Backend**: Django (Python)
- **Database**: SQLite (Development)
- **Frontend**: HTML, CSS, JavaScript
- **Authentication**: Django Allauth

## Project Structure

```
├── accounts/            # User authentication and profiles
├── bidding/             # Demand and bid management
├── crops/               # Crop listings and management
├── krishibazaar/        # Main project settings
├── locale/              # Internationalization files
├── media/               # User-uploaded files
├── notifications/       # User notification system
├── static/              # Static files (CSS, JS, images)
├── templates/           # HTML templates
└── manage.py            # Django management script
```

## Setup Instructions

### Prerequisites

- Python 3.x
- pip (Python package manager)

### Installation

1. Clone the repository:
   ```
   git clone https://github.com/yourusername/Krishi-Bazar.git
   cd Krishi-Bazar
   ```

2. Create and activate a virtual environment:
   ```
   python -m venv venv
   # On Windows
   venv\Scripts\activate
   # On macOS/Linux
   source venv/bin/activate
   ```

3. Install dependencies:
   ```
   pip install -r requirements.txt
   ```

4. Apply migrations:
   ```
   python manage.py migrate
   ```

5. Create a superuser (admin):
   ```
   python manage.py createsuperuser
   ```

6. Run the development server:
   ```
   python manage.py runserver
   ```

7. Access the application at http://127.0.0.1:8000/

## Usage

### For Farmers

1. Register as a farmer
2. Add your crops with details and pricing
3. Browse buyer demands and place bids
4. Manage your crop listings and bids

### For Buyers

1. Register as a buyer
2. Browse available crops
3. Create demands for specific crops
4. Accept bids from farmers

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Contact

Project Link: [https://github.com/yourusername/Krishi-Bazar](https://github.com/yourusername/Krishi-Bazar)
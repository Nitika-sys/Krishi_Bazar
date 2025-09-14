# Krishibazaar - Agricultural Marketplace Platform

A comprehensive Django-based agricultural marketplace platform that connects farmers and buyers for crop trading, bidding, and agricultural services.

## Features

- **User Management**: Separate dashboards for farmers and buyers
- **Crop Management**: Add, edit, and manage crop listings
- **Bidding System**: Place bids on crop demands
- **Notifications**: Real-time notifications for bids and updates
- **Multi-language Support**: English, Hindi, and Kannada
- **Responsive Design**: Mobile-friendly interface
- **Admin Panel**: Comprehensive admin interface

## Technology Stack

- **Backend**: Django 5.2
- **Frontend**: HTML, CSS, JavaScript, Tailwind CSS
- **Database**: PostgreSQL (production), SQLite (development)
- **Authentication**: Django Allauth
- **Forms**: Django Crispy Forms with Tailwind
- **Real-time**: Django Channels
- **File Storage**: WhiteNoise for static files

## Quick Start (Development)

1. **Clone the repository**
   ```bash
   git clone <your-repo-url>
   cd krishibazaar-project
   ```

2. **Create and activate virtual environment**
   ```bash
   python -m venv venv
   venv\Scripts\activate  # Windows
   source venv/bin/activate  # Linux/Mac
   ```

3. **Install dependencies**
   ```bash
   pip install -r requirements.txt
   ```

4. **Run migrations**
   ```bash
   python manage.py migrate
   ```

5. **Create superuser**
   ```bash
   python manage.py createsuperuser
   ```

6. **Start development server**
   ```bash
   python manage.py runserver
   ```

7. **Access the application**
   - Main site: http://localhost:8000
   - Admin panel: http://localhost:8000/admin

## Production Deployment

This project is configured for deployment on Render. See the [DEPLOYMENT_GUIDE.md](DEPLOYMENT_GUIDE.md) for detailed instructions.

### Quick Deploy to Render

1. **Push your code to GitHub**
2. **Connect to Render**
   - Go to [Render Dashboard](https://dashboard.render.com)
   - Click "New" → "Blueprint"
   - Connect your GitHub repository
3. **Deploy automatically**
   - Render will detect `render.yaml` and create services
   - Your app will be live at `https://your-app-name.onrender.com`

## Project Structure

```
krishibazaar-project/
├── accounts/           # User management and authentication
├── crops/             # Crop listing and management
├── bidding/           # Bidding system
├── notifications/     # Notification system
├── krishibazaar/      # Main project settings
├── templates/         # HTML templates
├── static/            # Static files (CSS, JS, images)
├── media/             # User uploaded files
├── locale/            # Translation files
└── requirements.txt   # Python dependencies
```

## Environment Variables

See [ENVIRONMENT_VARIABLES.md](ENVIRONMENT_VARIABLES.md) for a complete list of environment variables needed for production deployment.

## Key Features Explained

### User Roles
- **Farmers**: Can list crops, respond to demands, manage their profile
- **Buyers**: Can create demands, place bids, browse crops
- **Admin**: Full access to admin panel and system management

### Crop Management
- Add crop details with images
- Set pricing and availability
- Climate zone and growing season information
- Market preferences and yield data

### Bidding System
- Create crop demands
- Place competitive bids
- Accept/reject bids
- Real-time notifications

### Multi-language Support
- English (default)
- Hindi (हिंदी)
- Kannada (ಕನ್ನಡ)

## API Endpoints

The application provides RESTful APIs for:
- User authentication
- Crop management
- Bidding operations
- Notifications

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support and questions:
- Create an issue in the GitHub repository
- Check the [DEPLOYMENT_GUIDE.md](DEPLOYMENT_GUIDE.md) for deployment issues
- Review [ENVIRONMENT_VARIABLES.md](ENVIRONMENT_VARIABLES.md) for configuration help

## Changelog

### Version 1.0.0
- Initial release
- User authentication and management
- Crop listing and management
- Bidding system
- Multi-language support
- Admin panel
- Responsive design

---

**Built with ❤️ for the agricultural community**

#!/bin/bash
# Build script for Krishibazaar deployment on Render

echo "Starting build process..."

# Install dependencies
echo "Installing Python dependencies..."
pip install -r requirements-prod.txt

# Create logs directory
echo "Creating logs directory..."
mkdir -p logs

# Collect static files
echo "Collecting static files..."
python manage.py collectstatic --noinput --settings=krishibazaar.settings_production

# Run database migrations
echo "Running database migrations..."
python manage.py migrate --settings=krishibazaar.settings_production

# Create cache table for database cache
echo "Creating cache table..."
python manage.py createcachetable --settings=krishibazaar.settings_production

# Create superuser if it doesn't exist (optional)
echo "Checking for superuser..."
python manage.py shell --settings=krishibazaar.settings_production << EOF
from django.contrib.auth import get_user_model
User = get_user_model()
if not User.objects.filter(username='admin').exists():
    User.objects.create_superuser('admin', 'admin@krishibazaar.com', 'admin123')
    print('Superuser created')
else:
    print('Superuser already exists')
EOF

echo "Build process completed successfully!"

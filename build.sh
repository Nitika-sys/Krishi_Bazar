#!/usr/bin/env bash
# exit on error
set -o errexit

echo "Starting build process..."

# Print Python and pip versions for debugging
echo "Python version:"
python --version
echo "Pip version:"
pip --version

echo "Upgrading pip..."
pip install --upgrade pip

echo "Installing dependencies..."
pip install -r requirements.txt

echo "Collecting static files..."
python manage.py collectstatic --no-input

echo "Running migrations..."
python manage.py migrate

echo "Build completed successfully!"
# Krishibazaar Deployment Guide for Render

## Prerequisites
1. GitHub repository with your Krishibazaar code
2. Render account (free tier available)
3. Email service credentials (optional)

## Step-by-Step Deployment

### 1. Prepare Your Repository
Ensure all deployment files are committed to your repository:
- `requirements-prod.txt`
- `render.yaml`
- `krishibazaar/settings_production.py`
- `build.sh`
- `Procfile`
- `runtime.txt`
- `ENVIRONMENT_VARIABLES.md`

### 2. Create Render Services

#### Option A: Using render.yaml (Recommended)
1. Go to Render Dashboard
2. Click "New" → "Blueprint"
3. Connect your GitHub repository
4. Render will automatically detect `render.yaml` and create services

#### Option B: Manual Setup
1. **Create PostgreSQL Database:**
   - Go to Render Dashboard
   - Click "New" → "PostgreSQL"
   - Name: `krishibazaar-db`
   - Plan: Starter (Free)
   - Click "Create Database"

2. **Create Web Service:**
   - Go to Render Dashboard
   - Click "New" → "Web Service"
   - Connect your GitHub repository
   - Configure:
     - **Name:** `krishibazaar-web`
     - **Environment:** `Python 3`
     - **Build Command:** `pip install -r requirements-prod.txt && python manage.py collectstatic --noinput && python manage.py migrate`
     - **Start Command:** `gunicorn krishibazaar.wsgi:application`
     - **Plan:** Starter (Free)

### 3. Configure Environment Variables

In your web service settings, add these environment variables:

#### Required Variables:
```
DJANGO_SETTINGS_MODULE=krishibazaar.settings_production
ALLOWED_HOSTS=your-app-name.onrender.com
```

#### Database (Auto-connected):
```
DATABASE_URL=<automatically provided by Render>
```

#### Optional Variables:
```
EMAIL_HOST=smtp.gmail.com
EMAIL_PORT=587
EMAIL_HOST_USER=your-email@gmail.com
EMAIL_HOST_PASSWORD=your-app-password
DEFAULT_FROM_EMAIL=noreply@krishibazaar.com
```

### 4. Configure Static Files

1. **Add Persistent Disk:**
   - In your web service settings
   - Go to "Disks" tab
   - Add disk:
     - **Name:** `krishibazaar-media`
     - **Mount Path:** `/opt/render/project/src/media`
     - **Size:** 1GB

2. **Static Files:**
   - Static files are automatically served by WhiteNoise
   - No additional configuration needed

### 5. Deploy

1. Click "Create Web Service"
2. Render will automatically:
   - Install dependencies
   - Run migrations
   - Collect static files
   - Start your application

### 6. Post-Deployment Setup

1. **Create Admin User:**
   ```bash
   # Access Render shell or run via Django shell
   python manage.py createsuperuser
   ```

2. **Access Your Application:**
   - Visit your Render URL: `https://your-app-name.onrender.com`
   - Admin panel: `https://your-app-name.onrender.com/admin/`

### 7. Custom Domain (Optional)

1. In Render Dashboard, go to your web service
2. Go to "Settings" → "Custom Domains"
3. Add your domain
4. Update DNS records as instructed
5. Update `ALLOWED_HOSTS` environment variable

## Troubleshooting

### Common Issues:

1. **Build Failures:**
   - Check `requirements-prod.txt` for correct package versions
   - Ensure all dependencies are compatible

2. **Database Connection Issues:**
   - Verify `DATABASE_URL` is correctly set
   - Check PostgreSQL service is running

3. **Static Files Not Loading:**
   - Ensure `collectstatic` runs during build
   - Check WhiteNoise configuration

4. **Media Files Not Persisting:**
   - Verify persistent disk is mounted correctly
   - Check `MEDIA_ROOT` setting

### Logs:
- View logs in Render Dashboard → Your Service → "Logs" tab
- Check for error messages and stack traces

## Performance Optimization

1. **Enable Caching:**
   - Add Redis service for better performance
   - Update `CACHES` setting in production settings

2. **CDN Integration:**
   - Use Cloudflare or similar for static assets
   - Update `STATIC_URL` to point to CDN

3. **Database Optimization:**
   - Add database indexes
   - Use connection pooling

## Security Checklist

- [ ] `DEBUG=False` in production
- [ ] Strong `SECRET_KEY` generated
- [ ] HTTPS enabled
- [ ] Secure headers configured
- [ ] Database credentials secured
- [ ] Email credentials secured
- [ ] Regular security updates

## Monitoring

1. **Health Checks:**
   - Render automatically monitors your service
   - Set up custom health check endpoints

2. **Logs:**
   - Monitor application logs
   - Set up log aggregation if needed

3. **Performance:**
   - Monitor response times
   - Track database performance

## Support

- Render Documentation: https://render.com/docs
- Django Deployment Guide: https://docs.djangoproject.com/en/stable/howto/deployment/
- WhiteNoise Documentation: https://whitenoise.readthedocs.io/

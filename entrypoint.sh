#!/bin/bash

# Collect static files
#echo "Collect static files"
#python manage.py collectstatic --noinput --clear

# Reset the data from the database
# python manage.py flush --no-input

# Apply migrations and create the superuser.
# If there are no changes in he migrations or
# the superuser already exists it will just
# ignore it.
#python manage.py makemigrations
#python manage.py makemigrations pathology
#python manage.py migrate
#python manage.py pathology_createsu

# ------------
# NOT WORKING!
# ------------
# Only initialise the container running the
# migrations and creating the superuser if
# the .initialized file does not exist.
#if [ ! -f .initialized ]; then
#    echo "Initializing web container"
#    python manage.py makemigrations
#    python manage.py makemigrations pathology
#    python manage.py migrate
#    python manage.py pathology_createsu
#    touch .initialized
#fi

# Apply database migrations
# .. note: It is not recommended to run migrations
#          automatically as it can lead to issues
#          such as parallel migrations leading to
#          breakage.
# .. use:
#   $ docker run --rm -e DEV_MODE=1 ???
#if [ -v DEV_MODE ]; then
#    echo "Apply database migrations"
#    python manage.py makemigrations
#    python manage.py makemigrations pathology
#    python manage.py migrate
#    python manage.py pathology_createsu
#fi

# Fake the migrations that are already applied
#python manage.py migrate --fake

# Load some fixture
#python manage.py loaddata file

# Load sample data (from fixtures)
#python manage.py loaddata ./pathology/fixtures/sample/pathology.app.yaml

# Execute
exec "$@"

#gunicorn portfolio.wsgi
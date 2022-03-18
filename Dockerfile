FROM python:3

# set work directory
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# upgrade pip
RUN pip install --upgrade pip

# copy requirements
COPY requirements.txt /usr/src/app
RUN pip install -r /usr/src/app/requirements.txt

# copy entrypoint.sh
COPY entrypoint.sh /usr/src/app/
RUN chmod +x /usr/src/app/entrypoint.sh

# copy project
COPY . /usr/src/app/

# collect static files
RUN python manage.py collectstatic --noinput

# quick log to see it was executed
RUN echo '[bahp] Dockerfile executed.'

# add and run as non-root user
#RUN adduser -D myuser
#USER myuser

# run entrypoint.sh
ENTRYPOINT ["/usr/src/app/entrypoint.sh"]

#CMD gunicorn hello_django.wsgi:application --bind 0.0.0.0:$PORT
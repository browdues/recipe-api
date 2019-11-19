# Build the python docker image
1. Found the image at dockerhub.com
2. Set up a Dockerfile
3. Added the image, set a working directory, installed python req's, and created a user

# Construct docker-compose *yml file
1. Set a context, mapped ports/volumes, created a start command

Ran the following command to *build* the project. Following this, files seemed to appear.

```zsh
docker-compose run app sh -c "django-admin.py startproject app ."
```

# Running unit tests

```zsh
docker-compose run --rm app sh -c "python manage.py test && flake8"
```

## Starting the app and then customizing

For the first command to work, settings.py needed to be updated to include the name or our app, 'core' within the INSTALLED_APPS declaration constant. This comand will create the template files for our app.

```zsh
docker-compose run --rm app sh -c "python manage.py startapp core"

docker-compose run app sh -c "python manage.py makemigrations core"
```

This later command allowed us to create a file that will later be used to populate our database. This needed to be done because we customized our models. This command need be run everytime the models are updated.

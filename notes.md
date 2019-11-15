# Build the python docker image
1. Found the image at dockerhub.com
2. Set up a Dockerfile
3. Added the image, set a working directory, installed python req's, and created a user

# Construct docker-compose *yml file
1. Set a context, mapped ports/volumes, created a start command
Ran the following command to *build* the project

```zsh
docker-compose run app sh -c "django-admin.py startproject app ."
```
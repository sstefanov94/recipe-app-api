FROM python:3.7-alpine
LABEL maintainer="Stefan Stefanov"

# Run Python in unbuffered mode (recommended when running Python in Docker image)
# It doesn't allow python to buffer the outputs but prints them directly
ENV PYTHONUNBUFFERED 1

# Install all requirements in the docker image
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

# Create /app directory and make it the default directory
RUN mkdir /app 
WORKDIR /app
# Copy /app directory from the host to the docker image
COPY ./app /app

# Create a user with rights for running applications only
RUN adduser -D backend_user
USER backend_user


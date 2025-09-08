Workoutplan configuration
===

## Setup

* Create `uploads` folder in the home directory.

## Celery

Not yet implemented.

## Web backend

* Django application that runs with uvicorn.
* `runbackend.sh` - use in the service to start the web backend

## Web frontend

* Static files that are served by nginx.
* `buildfrontend.sh` - use in the shell script that restarts the services

## Logs

* $WOPL_TEST_HOME/logs/startlog_*.log resultaat van db migraties na een server herstart.
* $WOPL_TEST_HOME/logs/backend.log logs van de backend
* $WOPL_TEST_HOME/logs/access.log nginx toegang logs van de frontend
* $WOPL_TEST_HOME/logs/error.log nginx foutmeldingen van de frontend


## Variables

```sh
# Home folder of the running system user.
export WOPL_TEST_HOME=
# Name and group name of the system user
export WOPL_TEST_PROJECT_USER=
export WOPL_TEST_PROJECT_GROUP=
# Hostnames for the backend and frontend services.
export WOPL_TEST_BACKEND_HOSTNAME=
export WOPL_TEST_FRONTEND_HOSTNAME=
```

Workoutplan configuration
===

## Celery

Not yet implemented.

## Web backend

* Django application that runs with uvicorn.
* `runbackend.sh` - use in the service to start the web backend
* `runmigrations.sh` - use in the shell script that restarts the services

## Web frontend

* Static files that are served by nginx.
* `buildfrontend.sh` - use in the shell script that restarts the services

## Logs

* $APP_ROOT/logs/startlog_*.log resultaat van db migraties na een server herstart.
* $APP_ROOT/logs/backend.log logs van de backend
* $APP_ROOT/logs/access.log nginx toegang logs van de frontend
* $APP_ROOT/logs/error.log nginx foutmeldingen van de frontend
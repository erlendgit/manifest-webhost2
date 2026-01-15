#!/usr/bin/env bash

if [[ $(whoami) != $HSRP_PROJECT_USER ]]; then
  echo "Should run as $HSRP_PROJECT_USER"
  exit 2
fi

cd $HSRP_HOME

set -o allexport
source project/.env
set +o allexport

rm -rf next_backup
mkdir next_backup
cd next_backup

# create backup here
mysqldump -u$HSR_DATABASE_USER -p$HSR_DATABASE_PASSWORD $HSR_DATABASE_NAME > ./db_backup.sql
rsync -a ../project/media/documents/ ./documents
rsync -a ../project/log/ ./log
rsync -a ../project/.env ./env.txt

export BACKUP_NAME="backup_$(date +"%d")"

cd $HSRP_HOME
tar -czf $BACKUP_NAME.tar.gz -C next_backup .
rm -rf next_backup

mkdir -p backups
rm -rf backups/$BACKUP_NAME.tar.gz
mv $BACKUP_NAME.tar.gz backups/
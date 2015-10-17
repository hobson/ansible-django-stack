#!/usr/bin/env sh
# su postgres
dropdb "${DATABASE_NAME}"
psql -c "CREATE USER ${DATABASE_USER};"
psql -c "ALTER USER ${DATABASE_USER} WITH PASSWORD '${DATABASE_PASSWORD}';"
createdb "$DATABASE_NAME" -O "$DATABASE_USER"
psql "$DATABASE_NAME" -f dump.sql
psql "$DATABASE_NAME" -c "GRANT ALL ON ALL TABLES IN SCHEMA public to ${DATABASE_USER};"
psql "$DATABASE_NAME" -c "GRANT ALL ON ALL SEQUENCES IN SCHEMA public to ${DATABASE_USER};"
psql "$DATABASE_NAME" -c "GRANT ALL ON ALL FUNCTIONS IN SCHEMA public to ${DATABASE_USER};"
curl https://dl.dropboxusercontent.com/u/27181407/hackoregon_dump_2015-10-02.sql | psql "${DATABASE_USER}"
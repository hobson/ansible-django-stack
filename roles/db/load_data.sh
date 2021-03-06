#!/usr/bin/env sh
sudo su postgres
# dropdb "${DATABASE_NAME}"
# psql -c "CREATE USER ${DATABASE_USER};"
# psql -c "ALTER USER ${DATABASE_USER} WITH PASSWORD '${DATABASE_PASSWORD}';"
# createdb "$DATABASE_NAME" -O "$DATABASE_USER"
# psql "$DATABASE_NAME" -f dump.sql
for tbl in `psql -qAt -c "select tablename from pg_tables where schemaname = 'public';" $DATABASE_NAME` ; do  psql -c "alter table \"$tbl\" owner to $DATABASE_USER" $DATABASE_NAME ; done
psql "$DATABASE_NAME" -c "GRANT ALL ON ALL TABLES IN SCHEMA public to ${DATABASE_USER};"
for tbl in `psql -qAt -c "select sequence_name from information_schema.sequences where sequence_schema = 'public';" $DATABASE_NAME` ; do  psql -c "alter table \"$tbl\" owner to $DATABASE_USER" $DATABASE_NAME ; done
psql "$DATABASE_NAME" -c "GRANT ALL ON ALL SEQUENCES IN SCHEMA public to ${DATABASE_USER};"
for tbl in `psql -qAt -c "select table_name from information_schema.views where table_schema = 'public';" $DATABASE_NAME` ; do  psql -c "alter table \"$tbl\" owner to $DATABASE_USER" $DATABASE_NAME ; done
psql "$DATABASE_NAME" -c "GRANT ALL ON ALL FUNCTIONS IN SCHEMA public to ${DATABASE_USER};"

# curl https://dl.dropboxusercontent.com/u/27181407/hackoregon_dump_2015-10-02.sql | psql "${DATABASE_USER}"
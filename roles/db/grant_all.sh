#!/usr/bin/env sh

# if you source this script as the postgres user and you have set
# the DATABASE_NAME and DATABASE_USER
# this script will grant that user permissions to all the tables/rels in that DB

# sudo su postgres

# if [ -n "$1" ]; then
#    DATABASE_NAME="$1"
# fi
# if [ -n "$2" ]; then
#    DATABASE_USER="$2"
# fi

for tbl in `psql -qAt -c "select tablename from pg_tables where schemaname = 'public';" $DATABASE_NAME` ; do  psql -c "alter table \"$tbl\" owner to $DATABASE_USER" $DATABASE_NAME ; done
psql "$DATABASE_NAME" -c "GRANT ALL ON ALL TABLES IN SCHEMA public to ${DATABASE_USER};"
for tbl in `psql -qAt -c "select sequence_name from information_schema.sequences where sequence_schema = 'public';" $DATABASE_NAME` ; do  psql -c "alter table \"$tbl\" owner to $DATABASE_USER" $DATABASE_NAME ; done
psql "$DATABASE_NAME" -c "GRANT ALL ON ALL SEQUENCES IN SCHEMA public to ${DATABASE_USER};"
for tbl in `psql -qAt -c "select table_name from information_schema.views where table_schema = 'public';" $DATABASE_NAME` ; do  psql -c "alter table \"$tbl\" owner to $DATABASE_USER" $DATABASE_NAME ; done
psql "$DATABASE_NAME" -c "GRANT ALL ON ALL FUNCTIONS IN SCHEMA public to ${DATABASE_USER};"

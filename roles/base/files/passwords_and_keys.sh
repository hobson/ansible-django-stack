#/usr/bin/env bash

# SECRETS that should only exist in environment variables on a running server instance
# The real version of this script should be secured on the server/laptop where you run your ansible playbooks
# and never pushed to public github repos. 
# So if you open source everything, then just keep it in your private dropbox/drive/laptop archive


export RMQ_APP_PASSWORD='Rabbit MQ password here'
export RMQ_ADMIN_PASSWORD='Rabbit MQ admin password here'

export DB_PASSWORD='PosgreSQL database password here'

export DJ_SECRET_KEY='Django secret key, 32 characters'
export DJ_ADMIN_PASSWORD_HASHED='pbkdf2_sha256$20000$47 characters and symbols from "manage.py createsuperuser" then "manage.py dumpdata"'

export GMAIL_TG_PASSWORD='your GMAIL SMTP password'

export SSH_PORT=12345  # your top-secret port number here
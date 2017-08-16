#!/bin/bash
NAME="twmail"
FLASKDIR=/home/twmail/code/twmail
SOCKFILE=/home/twmail/code/twmail/sock
LOGFILE=/var/log/twmail.log
USER=twmail
GROUP=twmail
NUM_WORKERS=3
PIDFILE=/var/run/twmail.pid

echo "Starting $NAME"

# Create the run directory if it doesn't exist
. /home/twmail/code/twmail/venv/bin/activate
RUNDIR=$(dirname $SOCKFILE)
test -d "$RUNDIR" || mkdir -p "$RUNDIR"
 
# Start your gunicorn
exec gunicorn3 twmail:app -b 0.0.0.0:5000 \
  --name "$NAME" \
  --workers "$NUM_WORKERS" \
  --user="$USER" --group="$GROUP" \
  --bind=unix:"$SOCKFILE" \
  --pythonpath /home/twmail/code/twmail \
  --log-file="$LOGFILE" \
  --daemon \
  --pid="$PIDFILE"

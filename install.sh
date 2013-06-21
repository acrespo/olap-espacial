#! /bin/sh

if [ -n $1 ]
    echo "Usage: $0 [database]"
else
    psql --quiet -d $1 < install.sql
fi

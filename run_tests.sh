#! /bin/sh

db=$1

if [ -z "$db" ]; then
    echo "Usage: $0 [database]"
else
    echo "Executng tests for ST_Intersects...";
    psql -d $db --quiet < test_st_intersects.sql
fi


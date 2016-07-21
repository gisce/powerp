#!/bin/bash
if [ "$1" == "sleep" ]
then
    sleep inf
else
  exec "$@"
fi

#!/bin/sh
echo 'db.createCollection("csubs")' | mongo orion
echo 'db.createCollection("entities")' | mongo orion
mongoimport --db orion --collection entities --file /home/entities.json 


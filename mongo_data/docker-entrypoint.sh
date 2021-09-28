#!/bin/sh
echo 'db.createCollection("movies")' | mongo Library
echo 'db.createCollection("cinema")' | mongo Library
echo 'db.createCollection("favorites")' | mongo Library
mongoimport --db Library --collection movies --file /home/movies.json && \
mongoimport --db Library --collection cinema --file /home/cinema.json && \
mongoimport --db Library --collection favorites --file /home/favorites.json


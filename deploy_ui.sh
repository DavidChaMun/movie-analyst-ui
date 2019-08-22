#!/bin/bash
cd $(dirname $0)
docker build -t movie_analyst_ui .
host_dir=$(docker exec -it malyst_apic01 bash -c 'IP=$(hostname -i); echo $IP')
host_dir=$(echo $host_dir | sed -e 's/\n//g')
host_dir=$(echo $host_dir | sed -e 's/\r//g')
docker run --name malyst_uic01 -e BACK_HOST=$host_dir -d movie_analyst_ui
echo ""
echo -n "Movie Anlayst UI running on: "
echo -n $(docker exec -it malyst_uic01 bash -c 'IP=$(hostname -i); echo $IP')
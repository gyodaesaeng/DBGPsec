#!/bin/bash

year="2024"
month="05"

archive_base_url="https://archive.routeviews.org/route-views3/bgpdata/${year}.${month}"

# Download Start Date RIB

rib_file_name="rib.${year}${month}01.0000.bz2"
wget -q ${archive_base_url}/RIBS/${rib_file_name}
bzip2 -d ${rib_file_name}

# Download Update Message

for day in {01..31}; do
    date="${year}${month}${day}"
    for hour in {00..23}; do
        for minute in 00 15 30 45; do
            file_name="updates.${date}.${hour}${minute}.bz2"

            wget -q ${archive_base_url}/UPDATES/${file_name} -P data
            bzip2 -d data/${file_name}
        done
    done
done
#!/usr/bin/env bash

for tuto_dir in topics/*/tutorials/*
do
    tuto="$(basename $tuto_dir)"
    topic="$(basename $(dirname $(dirname $tuto_dir)))"
    echo "$topic / $tuto"
    planemo training_fill_data_library --topic_name $topic --tutorial_name $tuto
    echo ""
done
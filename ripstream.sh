#!/bin/bash

streamripper $OPTIONS -d $DIR
find $DIR/* -mtime +1 -exec rm -f {} \;
rm -rf $DIR/*.cue
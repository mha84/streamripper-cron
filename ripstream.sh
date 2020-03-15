#!/bin/bash

streamripper $SR_OPTS -d $SR_DIR
find $SR_DIR/* -mtime +1 -exec rm -f {} \;
rm -rf $SR_DIR/*.cue
rclone sync $SR_DIR $RCLONE_TARGET $RCLONE_OPTS
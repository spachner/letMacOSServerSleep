#!/usr/bin/env bash

#link this script to where you would like (e.g. ~/Desktop) for easy start with double click by mouse

path2scriptfollowlink=`realpath $BASH_SOURCE`
scriptdirname=`dirname $path2scriptfollowlink`
cd $scriptdirname
./checkAndSleep.rb

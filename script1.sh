#!/bin/bash
NUMPROCESOS=$(ps ax | tail -n +2 | wc -l)
PORCMEMORIA=$(free | grep Mem | awk '{print $4/$2 * 100.0}')
PORCHDD=$(df --total | grep total | awk '{print 100 - $5}')

curl --silent --request POST --header "X-THINGSPEAKAPIKEY: ZV6UGQIMF9W26U7S" --data "field1=${NUMPROCESOS}&field2=${PORCMEMORIA}&field3=${PORCHDD}" http://api.thingspeak.com/update

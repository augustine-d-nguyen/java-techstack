#!/bin/bash
export JTS_GIT_PKEY=$(cat ./jts_rsa)
exec java -jar ./serv.jar
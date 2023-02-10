#!/bin/bash
export JTS_GIT_PKEY=$(cat ./JTS_rsa)
exec java -jar ./serv.jar
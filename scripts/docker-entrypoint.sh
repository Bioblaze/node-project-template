#!/bin/bash

if [ -z "${USER_ID}" ]; then
  USER_ID=$(id -u)
fi

USER_NAME=$(getent passwd "${USER_ID}" | awk -F ':' '{print $1}')

if [ "${USER_NAME}" != "" ] && [ "${USER_NAME}" != "root" ]; then
  usermod -d /usr/src/app "${USER_NAME}"
fi

useradd -o -m -u "${USER_ID}" -d /usr/src/app docker-user 2>/dev/null

exit "0"
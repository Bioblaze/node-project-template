# NODE-VERSION: The most recent version (current)
FROM node:current-alpine

LABEL author="Randolph `Bioblaze Payne` Aarseth"

# Set the HOME Env
ENV HOME /usr/src/app
# Set NODE_ENV Production
ENV NODE_ENV production

# Docker Image uses OpenRC as a Process Supervisor on Alpine Linux
# RUN apk add openrc --no-cache
RUN set -x \
    && apk add --update --no-cache openrc \
    # Disable getty's
    && sed -i 's/^\(tty\d\:\:\)/#\1/g' /etc/inittab \
    && sed -i \
        # Change subsystem type to "docker"
        -e 's/#rc_sys=".*"/rc_sys="docker"/g' \
        # Allow all variables through
        -e 's/#rc_env_allow=".*"/rc_env_allow="\*"/g' \
        # Define extra dependencies for services
        -e 's/#rc_provide=".*"/rc_provide="loopback net"/g' \
        /etc/rc.conf \
        # Can't do cgroups
    && sed -i 's/cgroup_add_service /# cgroup_add_service /g' /lib/rc/sh/openrc-run.sh \
    && sed -i 's/VSERVER/DOCKER/Ig' /lib/rc/sh/init.sh

# Install PM2 along with Base Log Rotation
RUN npm install -g pm2@latest 
RUN pm2 install pm2-logrotate
# Set Log Rotation Settings
RUN pm2 set pm2-logrotate:retain 30 pm2-logrotate:compress true pm2-logrotate:workerInterval 300
# Install PM2 Typescript if we need it.
# RUN pm2 install typescript
# Set the LOGLEVEL
ENV NPM_CONFIG_LOGLEVEL warn
# Create the Base Directory
RUN mkdir -p /usr/src/app
# Set Permissions for the Base Directory
RUN chmod -R a+wrx /usr/src/app
# Set the Base Directory as our Working Directory
WORKDIR /usr/src/app
# A wildcard is used to ensure both package.json AND package lock.json are copied
COPY package*.json /usr/src/app
# Install Production Quality Modules
RUN npm install
# RUN yarn

# Add your source files
COPY . /usr/src/app

VOLUME ["/usr/src/app"]

# Expose a Port Number
# EXPOSE #####

ENTRYPOINT ["./scripts/docker-entrypoint.sh"]

# Start Node Service with PM2
CMD ["pm2-runtime", "ecosystem.config.js"]
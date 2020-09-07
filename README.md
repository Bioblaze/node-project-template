# Node Project Template
## Public Template Project

[![License](https://img.shields.io/badge/License-Apache2-blue.svg)](https://www.apache.org/licenses/LICENSE-2.0)



*Read this in other languages: [English](README.md).*

## Contents

1. [Short description](#short-description)
1. [Long description](#long-description)
1. [Project roadmap](#project-roadmap)
1. [Getting started](#getting-started)
1. [Projects using Template](#projects-using-template)
1. [Useful Commands](#useful-commands)
1. [Built with](#built-with)
1. [Contributing](#contributing)
1. [Versioning](#versioning)
1. [Authors](#authors)
1. [License](#license)
1. [Acknowledgments](#acknowledgments)

## Short description
    Base Template for any Node.js Application.

### What's the problem?
    It can take minutes, to sometimes hours to setup the Base Project, get your Process Manager Setup, Figure out your Docker Support, get your Development Tools setup, maybe even setup your Readme with all the commands you need and copy/paste them into the terminal.

### How can technology help?
    It has a simple, base structure to build off of for any Node.js Application Development. It comes with a complete Makefile with docker-compose and docker support along with pm2 deployment support.

### The idea
    I got sick and tired of setting up Node.js Micro Service projects, and after doing it 1000 times I just said.. Template time, and here we are.

## Long description

[More detail is available here](DESCRIPTION.md)

## Project roadmap

[RoadMap](ROADMAP.md)

## Getting started

### Prerequisites

1. Docker Installed
2. If you are a Windows User please Install Windows SubSystem Linux (Ubuntu)
2. 1. Make sure you have `make` installed. and WSL2 along with patch kernal & Docker-edge
3. Install Node.js
3. 1. Install PM2 Globally
4. Rename the `example.env` file to `.env` and fill in the Information requested as well as put your Variables there.


### Installing

Just Git Pull the Repo, or download a Zip of it.

## Projects using Template
    Currently working on utilizing this in a few Projects will List them here, once they are ready.

## Useful Commands

1. make npm
1. 1. Installs Project Deps utilizing NPM
2. make yarn
2. 1. Installs Project Deps utilizing Yarn
3. make start
3. 1. Starts Project Locally with what the NODE_ENV has set. production, staging, or development
4. make stop
4. 1. Stops the Project Locally
5. make build
5. 1. Builds the Project into a docker container.
6. make up
6. 1. Brings the Docker Container up for Testing utilizing Docker Compose
7. make logs
7. 1. Allows you to see all the Logs for a Current Project
8. make down
8. 1. Brings the Docker Container down
9. make console
9. 1. Opens a console into the Container for the Project
10. make pm2deploy
10. 1. Deploy's the Project too whatever server it is set too, with settings based on NODE_ENV
11. make pm2setup
11. 1. This will Setup the Server the Project is being Deployed too.
12. make pm2update
12. 1. Update a Project on the Deployment Servers.

## Built with

* [Node.js](https://nodejs.org/en/about/) - Base of the Project
* [Docker](https://www.docker.com/why-docker) - Easy Local Testing
* [PM2](https://pm2.keymetrics.io/docs/usage/pm2-doc-single-page/) - Fastest way to keep a process for testing 
* [GIT](https://git-scm.com/about) - Doing the Storage and Updating WOOT
* [Make](https://www.gnu.org/software/make/manual/make.html) - I couldn't live without you, I want you too know <3

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/Bioblaze/node-project-template/tags).

## Authors

* **Randolph `Bioblaze Payne` Aarseth** - *Initial work* - [Bioblaze](https://github.com/Bioblaze)

See also the list of [contributors](https://github.com/Bioblaze/node-project-template/graphs/contributors) who participated in this project.

## License

This project is licensed under the Apache 2 License - see the [LICENSE](LICENSE) file for details

## Acknowledgments

* Based on [Billie Thompson's README template](https://gist.github.com/PurpleBooth/109311bb0361f32d87a2).
* Built off of [Code and Response Sample Project](https://github.com/Code-and-Response/Project-Sample).

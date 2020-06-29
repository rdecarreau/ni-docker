## LabVIEW Docker Containers

This dockerfile will build a Windows image with LabVIEW 2019.

## Usage

### Building the Image

1. Clone the repo
1. CD into this directory
1. Download the NIPM 20.1 offline installer from here: https://www.ni.com/en-us/support/downloads/software-products/download.package-manager.html#322516
    * The offline download is hiding in a note section below the "Download" button
1. Save it in this directory, and double-check that the name in the Dockerfile matches
1. Run `docker build --pull --rm -f "Dockerfile" -t nilabviewdocker:latest "."`
    * Depending on your docker setup you may need to pass a `--network` flag
    * Run `docker network ls` to see all your available networks, pick one that can reach the outside world
1. The install __should__ take a while and complete

### Running a Container

1. Ensure the docker image you just built is available
    * `docker image ls`
1. Run `docker run -it --name=labview-test nilabviewdocker`
    * This will run a container from the image you just made, and you should be able to call labview via command line


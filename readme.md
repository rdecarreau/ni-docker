## LabVIEW Docker Containers

This dockerfile will build a Windows image with LabVIEW 2019.

## Usage

### Building the Image

1. Clone the repo
1. CD into this directory
1. Run `docker build --pull --rm -f "Dockerfile" -t nidocker:latest "."`
    * Depending on your docker setup you may need to pass a `--network` flag
    * Run `docker network ls` to see all your available networks, pick one that can reach the outside world
1. The install __should__ take a while and complete

### Running a Container

1. Ensure the docker image you just built is available
    * `docker image ls`
1. Run `docker run -it --name=labview-test nidocker`
    * This will run a container from the image you just made, and you should be able to call labview via command line

### Licensing the container

1. Big thanks to Chris Stryker for [this](http://stry.kr/2020/06/09/contain-your-excitement/) writeup on how to license 
a container-based LabVIEW instance. I, too, spent a long time trying a better way, but I have nothing, yet.

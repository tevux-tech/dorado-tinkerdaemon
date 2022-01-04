This runs Tinkerforge brickd daemon in a separate container. Note that container must be created using privileged mode, or otherwise brickd willnot be able to communicate with bricks:

```docker run -p 4223:4223 --privileged ghcr.io/tevux-tech/dorado:latest``
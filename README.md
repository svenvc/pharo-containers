# Pharo Containers

Experiments with OCI (docker/podman) containers for Pharo.

First use the `Dockerfile` to build a new image in a two stage build.
```
podman build -t pharo_test .
```
Then start a new container based on that image, exporting port 8080.
```
podman run -d --name pharo_test -p 8080:8080 pharo_test
```
You can now access the HTTP server.
```
curl http://localhost:8080/random/64
```

To debug the image, you can test the Pharo version.
```
podman run --rm -it pharo_test ./pharo Pharo.image printVersion
```
or explore the file system.
```
podman run --rm -it pharo_test bash
```

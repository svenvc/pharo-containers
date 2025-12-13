# Pharo Containers

Experiments with OCI (docker/podman) containers for Pharo.

Several variations are available:
- [pharo-plain-1-stage](pharo-plain-1-stage/README.md) very simple, no optimizations
- [pharo-image-clean-2-stage](pharo-image-clean-2-stage/README.md) clean and reduce Pharo image, use 2 stage build
- [pharo-image-vm-clean-2-stage](pharo-image-vm-clean-2-stage/README.md) clean and reduce Pharo image and VM, use 2 stage build

Go into any of the above directories to try that variation.
```
podman build -t pharo_test .
podman run -d --name pharo_test -p 8080:8080 pharo_test
curl http://localhost:8080/up
```
You can use docker or podman or any compatible service.

To debug the image, you can test the Pharo version.
```
podman run --rm -it pharo_test ./pharo Pharo.image printVersion
```
evaluate arbitrary code
```
podman run --rm -it pharo_test ./pharo Pharo.image eval 42 factorial
```
or explore the file system.
```
podman run --rm -it pharo_test bash
```

Once you have a container running, you can open a shell to run similar commands.
```
podman exec -it pharo_test bash
```

# Pharo Containers

Experiments with OCI (docker/podman) containers for Pharo.

```
podman build -t pharo_test .
podman run --rm -it pharo_test ./pharo Pharo.image printVersion
podman run -d --name pharo_test -p 8080:8080 pharo_test
```


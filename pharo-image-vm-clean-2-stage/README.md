# Pharo Containers
## pharo-image-vm-clean-2-stage

This is a Dockerfile with optimizations.

The `build.st` file is a Pharo script to load application code.

The `remove.st` file is a Pharo script to remove unnecessary code.

The `run.st` file is a Pharo script to start the application.

The `delete-vm-libs.st` file is a Pharo script that defines which VM libraries are kept.

The source side of the Pharo image is reduced after loading the application code by
- running the clean --production command
- all tests are removed
- the Pharo image is set up to run without changes or source file

The size of the Pharo VM is further reduced by removing libraries that are not needed.

This is a 2 stage build to create a smaller final image.
Only the bare minimum is copied over from the 1st stage.

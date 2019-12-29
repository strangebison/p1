load(
    "@io_bazel_rules_docker//toolchains/docker:toolchain.bzl",
    docker_toolchain_configure = "toolchain_configure",
)

########################################
# container_repositories
########################################
#
# This rule configures the following repositories:
# * base_images_docker: https://github.com/GoogleContainerTools/base-images-docker
# * bazel_gazelle: https://github.com/bazelbuild/bazel-gazelle
# * bazel_skylib: https://github.com/bazelbuild/bazel-skylib
# * io_bazel_rules_go: https://github.com/bazelbuild/rules_go
# * puller
# * importer
# * bazel_source
# * six
# * containerregistry
# * httplib2
# * others...

load(
    "@io_bazel_rules_docker//repositories:repositories.bzl",
    container_repositories = "repositories",
)

def stage3():
    # This call is optional but should go before container_repositories
    # which will otherwise provide a default.
    docker_toolchain_configure(
        name = "docker_config",
    )

    container_repositories()

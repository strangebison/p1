load(
    "@io_bazel_rules_docker//toolchains/docker:toolchain.bzl",
    docker_toolchain_configure = "toolchain_configure",
)

def stage3():
    docker_toolchain_configure(
        name = "docker_config",
    )

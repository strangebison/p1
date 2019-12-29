load(
    "@bazel_tools//tools/build_defs/repo:http.bzl",
    "http_archive",
    "http_file",
)
load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")

########################################
# bazel_toolchains_repositories
########################################
#
# This rule configures the following repositories:
# * io_bazel_rules_docker: https://github.com/bazelbuild/rules_docker
# * bazel_skylib: https://github.com/bazelbuild/bazel-skylib
# * bazel_gpg: https://bazel.build/bazel-release.pub.gpg
load(
    "@bazel_toolchains//repositories:repositories.bzl",
    bazel_toolchains_repositories = "repositories",
)

def stage2():
    bazel_toolchains_repositories()

    protobuf_deps()

    http_archive(
        name = "gtest",
        build_file = "@com_google_or_tools//bazel:gtest.BUILD",
        strip_prefix = "googletest-release-1.8.0/googletest",
        url = "https://github.com/google/googletest/archive/release-1.8.0.zip",
    )

    http_archive(
        name = "glpk",
        build_file = "@com_google_or_tools//bazel:glpk.BUILD",
        sha256 = "9a5dab356268b4f177c33e00ddf8164496dc2434e83bd1114147024df983a3bb",
        url = "http://ftp.gnu.org/gnu/glpk/glpk-4.52.tar.gz",
    )

load(
    "@bazel_tools//tools/build_defs/repo:http.bzl",
    "http_archive",
    "http_file",
)

def _or_tools_repositories():
    http_archive(
        name = "com_google_or_tools",
        sha256 = "b87922b75bbcce9b2ab5da0221751a3c8c0bff54b2a1eafa951dbf70722a640e",
        strip_prefix = "or-tools-7.3",
        urls = ["https://github.com/google/or-tools/archive/v7.3.tar.gz"],
    )

    # https://github.com/gflags/gflags
    http_archive(
        name = "com_github_gflags_gflags",
        sha256 = "34af2f15cf7367513b352bdcd2493ab14ce43692d2dcd9dfc499492966c64dcf",
        strip_prefix = "gflags-2.2.2",
        urls = [
            "https://mirror.bazel.build/github.com/gflags/gflags/archive/v2.2.2.tar.gz",
            "https://github.com/gflags/gflags/archive/v2.2.2.tar.gz",
        ],
    )

    # Both names are required by or_tools, see:
    # https://github.com/google/or-tools/blob/stable/WORKSPACE
    http_archive(
        name = "com_google_protobuf",
        sha256 = "c90d9e13564c0af85fd2912545ee47b57deded6e5a97de80395b6d2d9be64854",
        strip_prefix = "protobuf-3.9.1",
        urls = ["https://github.com/google/protobuf/archive/v3.9.1.zip"],
    )
    http_archive(
        name = "com_google_protobuf_cc",
        sha256 = "c90d9e13564c0af85fd2912545ee47b57deded6e5a97de80395b6d2d9be64854",
        strip_prefix = "protobuf-3.9.1",
        urls = ["https://github.com/google/protobuf/archive/v3.9.1.zip"],
    )

    http_archive(
        name = "com_github_glog_glog",
        sha256 = "f28359aeba12f30d73d9e4711ef356dc842886968112162bc73002645139c39c",
        strip_prefix = "glog-0.4.0",
        urls = ["https://github.com/google/glog/archive/v0.4.0.tar.gz"],
    )

    # https://github.com/abseil/abseil-cpp
    http_archive(
        name = "com_google_absl",
        sha256 = "8100085dada279bf3ee00cd064d43b5f55e5d913be0dfe2906f06f8f28d5b37e",
        strip_prefix = "abseil-cpp-20190808",
        urls = ["https://github.com/abseil/abseil-cpp/archive/20190808.tar.gz"],
    )

def _boost_repositories():
    http_archive(
        name = "boost",
        build_file = "@//repositories:boost.BUILD",
        sha256 = "d73a8da01e8bf8c7eda40b4c84915071a8c8a0df4a6734537ddde4a8580524ee",
        strip_prefix = "boost_1_71_0",
        urls = ["https://dl.bintray.com/boostorg/release/1.71.0/source/boost_1_71_0.tar.bz2"],
    )

def _opencv_repositories():
    http_file(
        name = "opencv",
        sha256 = "5de5d96bdfb9dad6e6061d70f47a0a91cee96bb35afb9afb9ecb3d43e243d217",
        urls = ["https://github.com/opencv/opencv/archive/4.1.1.tar.gz"],
    )

def _bazel_toolchains_repositories():
    version = "2.0.0"
    sha256 = "e2126599d29f2028e6b267eba273dcc8e7f4a35ff323e9600cf42fb03875b7c6"

    # https://releases.bazel.build/bazel-toolchains.html
    # https://github.com/bazelbuild/bazel-toolchains
    http_archive(
        name = "bazel_toolchains",
        sha256 = sha256,
        strip_prefix = "bazel-toolchains-{version}".format(version = version),
        urls = [
            "https://github.com/bazelbuild/bazel-toolchains/releases/download/{version}/bazel-toolchains-{version}.tar.gz".format(version = version),
            "https://mirror.bazel.build/github.com/bazelbuild/bazel-toolchains/archive/{version}.tar.gz".format(version = version),
        ],
    )

def stage1():
    _bazel_toolchains_repositories()
    _boost_repositories()
    _or_tools_repositories()
    _opencv_repositories()

# Mirror-Release-Action V1

This action download the release of any public repository, add and commit it to a branch, push the branch to your repository and you can clone the branch with single-branch from your repository if cloning the branch is much faster than downloading the release.

This action does not mirror the release again if it is already mirrored. Please delete the remote branch mirroring the release if you want to mirror again.

# Usage

See [action.yml](action.yml)

## Mirror the release of nerdctl

```ymal
steps:
- uses: actions/checkout@v3

- uses: mirror-release-action@v1
  with:
    repository: containerd/nerdctl
    tag: v0.20.0
    patterns: nerdctl-0.20.0-linux-amd64.tar.gz SHA256SUMS* nerdctl-0.20.0-linux-arm*.tar.gz

- uses: mirror-release-action@v1
  with:
    repository: cli/cli
    tag: v2.11.3
    patterns: gh_2.11.3_linux_amd64.tar.gz gh_2.11.3_checksums.txt

```

The branches mirroring the releases:

1. Nerdctl

- destination branch: containerd/nerdctl@v0.20.0
- destination directory: containerd/nerdctl/v0.20.0
- downloaded files: nerdctl-0.20.0-linux-amd64.tar.gz nerdctl-0.20.0-linux-arm-v7.tar.gz nerdctl-0.20.0-linux-arm64.tar.gz SHA256SUMS SHA256SUMS.asc

2. GitHub CLI

- destination branch: cli/cli@v2.11.3
- destination directory: cli/cli/v2.11.3
- downloaded files: gh_2.11.3_checksums.txt gh_2.11.3_linux_amd64.tar.gz

Cloning the branch with no references other than single cloned branch:
```sh
git clone --branch <name> --depth 1 --no-tags --single-branch <repository> [<directory>]
```

# License

The scripts and documentation in this project are released under the [MIT License](LICENSE)


# Install

This guide teaches how to download and install `Bend` through `Rust`, using `Cargo`, a tool used for managing packages. It may be necessary to have an internet connection to proceed with this guide.

## Install depedencies

### On Windows

1. Install Windows Subsystem for Linux (WSL2) by following the [official guide](https://docs.microsoft.com/en-us/windows/wsl/install).

2. After installing WSL2, open your WSL2 terminal and follow the Linux installation instructions below.

### On Linux

```py
# Install Rust if you haven't it already.
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# For the C version of Bend, use GCC. We recommend a version up to 12.x.
sudo apt install gcc
```

For the CUDA runtime [install the CUDA toolkit for Linux](https://developer.nvidia.com/cuda-downloads?target_os=Linux) version 12.x.

### On Mac

```py
# Install Rust if you haven't it already.
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# For the C version of Bend, use GCC. We recommend a version up to 12.x.
brew install gcc
```

### Install Bend

1. Install HVM2 by running:

```sh
# HVM2 is HOC's massively parallel Interaction Combinator evaluator.
cargo install hvm

# This ensures HVM is correctly installed and accessible.
hvm --version
```

2. Install Bend by running:

```sh
# This command will install Bend
cargo install bend-lang

# This ensures Bend is correctly installed and accessible.
bend --version
```

By following the above steps, we can start using Bend.

Now, let's proceed to [Text Editors](./IDE.md) and finish preparing our setup for exploration.

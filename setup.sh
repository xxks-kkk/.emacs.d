# Install some dependencies for this configuration works

rustup toolchain add nightly
rustup component add rust-src
cargo +nightly install racer

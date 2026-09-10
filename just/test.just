# Run all unit, integration, binary, and documentation tests.
[group('test')]
test args="":
  cargo test --all-targets {{ args }}
  cargo test --doc {{ args }}

# Run emulator-backed integration tests.
[group('test')]
integration test_args="":
  cargo test --features with-containers,tokio --test gcs --test gcs_blocking -- {{ test_args }} --test-threads=1

# Generate an LCOV coverage report.
[group('test')]
coverage output="lcov.info":
  cargo llvm-cov --all-targets --lcov --output-path {{ output }}

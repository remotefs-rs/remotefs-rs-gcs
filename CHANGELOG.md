# Changelog

All notable changes to this project are documented in this file.

## 1.0.0

Released on 2026-09-15

### Breaking changes

- migrate to remotefs 1

> `GoogleCloudStorageFs` now implements `remotefs::AsyncRemoteFs` natively and
> no longer takes a Tokio runtime in its constructors. Every path must be
> absolute; `pwd` and `change_dir` are gone. `open` and `create` return owned
> streams that must be finished explicitly, `read_file` and `write_file`
> replace `open_file` and `create_file`, `rename` replaces `mov`, and
> `set_metadata` replaces `setstat`. Blocking callers enable the `tokio`
> feature and call `into_blocking` to obtain a
> `BlockingGoogleCloudStorageFs` that implements `remotefs::RemoteFs`.

### Added

- Breaking: migrate to remotefs 1
- honor read offsets and lengths natively and advertise capabilities

## 0.1.0

Released on 2026-08-29

### Added

- add Google Cloud Storage client

### Changed

- remove useless mod visibility

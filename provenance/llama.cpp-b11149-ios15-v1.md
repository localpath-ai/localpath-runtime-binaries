# llama.cpp b11149 for iOS 15

## Identity

- Upstream repository: <https://github.com/ggml-org/llama.cpp>
- Upstream commit: `d2e54583c7452353eb35d40431281f6ee984332f`
- Upstream build tag: `b11149`
- Release tag: `llama.cpp-b11149-ios15-v1`
- Asset: `llama-b11149-ios15-xcframework.zip`
- Archive size: `58,537,957` bytes
- Archive SHA-256: `f7830c9986b595150eb619f3d89edbbace40de61e03f72bed40d4c02429559f7`

## Build environment

- Xcode: `27.1 (27A9275)`
- iPhoneOS SDK: `27.1`
- iPhoneSimulator SDK: `27.1`
- Minimum deployment target: iOS `15.0`
- Slices: `ios-arm64` and `ios-arm64_x86_64-simulator`

The build script rejects a dirty checkout or any upstream commit other than the identity above. It
uses llama.cpp's upstream Apple XCFramework builder, changes only the minimum iOS deployment target,
and normalizes timestamps and ZIP metadata. Two clean builds on the same machine and toolchain
produced the archive digest above.

## Contents and boundaries

The archive contains compiled llama.cpp/ggml runtime code, public C headers, and debug symbols. It
does not contain model weights, LocalPath SDK source, LocalPath credentials, signing keys, or user
content. LocalPath model artifacts remain separately authorized, signed, downloaded, and verified.

The upstream MIT license is preserved in `LICENSES/llama.cpp-MIT.txt`.

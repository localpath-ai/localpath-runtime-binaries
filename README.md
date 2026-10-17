# LocalPath Runtime Binaries

This repository publishes immutable, checksummed native runtime binaries used by LocalPath mobile
SDKs. It is public so package managers can resolve the artifacts without receiving access to
LocalPath's private SDK repositories.

Only third-party runtime code, public headers, licenses, build scripts, and reproducibility metadata
belong here. This repository must never contain model weights, LocalPath credentials, signing keys,
private SDK source, user content, or temporary download URLs.

## Published artifacts

| Release | Platform | Upstream source | Archive SHA-256 |
| --- | --- | --- | --- |
| `llama.cpp-b11149-ios15-v1` | iOS device and Simulator, iOS 15+ | [`ggml-org/llama.cpp@d2e5458`](https://github.com/ggml-org/llama.cpp/commit/d2e54583c7452353eb35d40431281f6ee984332f) | `f7830c9986b595150eb619f3d89edbbace40de61e03f72bed40d4c02429559f7` |

See the matching document under `provenance/` and the build script under `Scripts/` before
publishing or replacing an artifact. Release assets are additive and immutable; changing source,
toolchain, flags, platform slices, or deployment target requires a new release identifier.

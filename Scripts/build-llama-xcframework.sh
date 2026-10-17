#!/usr/bin/env bash

set -euo pipefail

readonly expected_commit="d2e54583c7452353eb35d40431281f6ee984332f"
readonly minimum_ios_version="15.0"

if [[ $# -ne 2 ]]; then
  echo "usage: $0 /path/to/llama.cpp /path/to/output-directory" >&2
  exit 64
fi

readonly source_dir="$1"
readonly output_dir="$2"

if [[ ! -d "${source_dir}/.git" ]] || [[ ! -f "${source_dir}/build-xcframework.sh" ]]; then
  echo "the source path must be a llama.cpp Git checkout" >&2
  exit 66
fi

actual_commit="$(git -C "${source_dir}" rev-parse HEAD)"
if [[ "${actual_commit}" != "${expected_commit}" ]]; then
  echo "llama.cpp must be checked out at ${expected_commit}; found ${actual_commit}" >&2
  exit 65
fi

if [[ -n "$(git -C "${source_dir}" status --short)" ]]; then
  echo "the llama.cpp checkout must be clean" >&2
  exit 65
fi

mkdir -p "${output_dir}"
readonly patched_builder="${output_dir}/build-xcframework.localpath.sh"
readonly framework_path="${output_dir}/llama.xcframework"
readonly archive_path="${output_dir}/llama-b11149-ios15-xcframework.zip"

sed \
  "s/^IOS_MIN_OS_VERSION=.*/IOS_MIN_OS_VERSION=${minimum_ios_version}/" \
  "${source_dir}/build-xcframework.sh" > "${patched_builder}"
chmod +x "${patched_builder}"

(
  cd "${source_dir}"
  "${patched_builder}" ios-sim ios-device
)

rm -rf "${framework_path}"
ditto "${source_dir}/build-apple/llama.xcframework" "${framework_path}"

# Normalize metadata so rebuilding the same source and toolchain produces a stable archive.
find "${framework_path}" -exec touch -h -t 202001010000 {} +
rm -f "${archive_path}"
(
  cd "${output_dir}"
  COPYFILE_DISABLE=1 /usr/bin/zip -X -q -r "${archive_path}" llama.xcframework
)

swift package compute-checksum "${archive_path}"

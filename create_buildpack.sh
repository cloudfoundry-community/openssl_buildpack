#! /usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

VERSION=$(cat "$SCRIPT_DIR/VERSION")
IFS='.' read -r MAJOR MINOR <<< "$VERSION"
MINOR=$((MINOR + 1))
NEXTVERSION="$MAJOR.$MINOR"

pushd "$SCRIPT_DIR"
zip -r "/tmp/openssl_buildpack-v$NEXTVERSION.zip" . -x .DS_Store
popd
cf delete-buildpack openssl_buildpack -f
cf create-buildpack openssl_buildpack "/tmp/openssl_buildpack-v$NEXTVERSION.zip" 99

echo "$NEXTVERSION" > "$SCRIPT_DIR/VERSION"

#!/bin/sh
if command -v swiftlint >/dev/null 2>&1; then
  swiftlint --strict
else
  echo "SwiftLint is not installed. Install it to enforce lint rules during builds."
fi


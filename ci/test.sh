#!/bin/sh

set -e

pub run test test/kt_dart_test.dart
pub global activate coverage
pub global run coverage:collect_coverage --port=8111 -o coverage.json --resume-isolates --wait-paused &
dart --observe=8111 --enable-asserts test/kt_dart_test.dart
pub global run coverage:format_coverage --packages=.packages --report-on lib --in coverage.json --out lcov.info --lcov
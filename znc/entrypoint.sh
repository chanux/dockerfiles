#!/usr/bin/env bash
set -e

chown -R znc:znc /znc

exec sudo -u znc "$@"

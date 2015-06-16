#!/bin/sh

set -e

desktop-file-install --dir=${HOME}/.local/share/applications ${1}

killall unity-scope-home

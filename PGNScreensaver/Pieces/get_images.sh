#!/bin/bash -euo pipefail

#  get_images.sh
#  PGNScreensaver
#
#  Created by Bogdan Constantin Popescu on 25/02/2018.
#  Copyright © 2018 MathPlayer. All rights reserved.

readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly URL_BASE_PATH="https://upload.wikimedia.org/wikipedia/commons"

# Determine if we'll use curl or wget
DOWNLOAD_TOOL=""
if command -V curl 2>&1 1>/dev/null; then
    echo "Using curl as a download tool"
    DOWNLOAD_TOOL="curl -o "
elif command -V wget 2>&1 1>/dev/null; then
    echo "Using wget as a download tool"
    DOWNLOAD_TOOL="wget -O "
else
    ecxo >&2 "Cannot find a download tool. Install curl or wget and try again."
    exit 1
fi

for PIECE in "k" "q" "r" "b" "n" "p"; do
    for COLOR in "d" "l"; do
        IMAGE="Chess_${PIECE}${COLOR}t45.svg"
        if [ -f "${SCRIPT_DIR}/${IMAGE}" ]; then
            echo "${IMAGE} exists, skip download"
            continue
        fi
        set -x
        MD5_HASH="$(echo -n ${IMAGE} | md5)"
        A="${MD5_HASH:0:1}"
        B="${MD5_HASH:0:2}"
        set +x
        CMD="${DOWNLOAD_TOOL} ${SCRIPT_DIR}/${IMAGE} ${URL_BASE_PATH}/${A}/${B}/${IMAGE}"
        echo "[run] ${CMD}"
        eval "${CMD}"
    done
done

# TODO: automate svg->pdf conversion
# maybe use Gapplin

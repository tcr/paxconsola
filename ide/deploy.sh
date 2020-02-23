#!/bin/bash

(rm build/*.* || true) &&
    cargo web deploy --release --output build &&
    now ./build --prod

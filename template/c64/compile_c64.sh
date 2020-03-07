#!/bin/bash

cargo run -- compile-c64 snake.pax > generated.asm && \
  make && \
#  x64sc -initbreak 0x80D paxconsola.com
  x64sc paxconsola.com

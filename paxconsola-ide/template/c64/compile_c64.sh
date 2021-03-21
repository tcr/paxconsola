#!/bin/bash

cargo run -- compile-c64 snake.pax > generated.asm && \
  make && \
#  x64sc -moncommands "paxconsola.vs" paxconsola.prg
  x64sc -moncommands "paxconsola.vs" -nativemonitor paxconsola.prg

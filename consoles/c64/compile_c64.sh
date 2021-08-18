#!/bin/bash

FILE=snake.fth
OPTS=""

paxforth dump $FILE $OPTS > build/$FILE.dump

paxforth compile $FILE $OPTS --target c64 > paxconsola_generated.asm && \
  make && \
#  x64sc -moncommands "paxconsola.vs" paxconsola.prg
  x64sc -moncommands "paxconsola.vs" -nativemonitor build/paxconsola.prg

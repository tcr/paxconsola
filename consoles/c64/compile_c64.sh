#!/bin/bash

FILE=snake.fth
OPTS="--inline"

paxforth dump $FILE $OPTS > $FILE.dump

paxforth compile $FILE $OPTS --target c64 > generated.asm && \
  make && \
#  x64sc -moncommands "paxconsola.vs" paxconsola.prg
  x64sc -moncommands "paxconsola.vs" -nativemonitor paxconsola.prg

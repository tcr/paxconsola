#!/bin/bash

FILE=snake.fth

paxforth dump $FILE --inline > $FILE.dump

paxforth compile $FILE --inline --target c64 > generated.asm && \
  make && \
#  x64sc -moncommands "paxconsola.vs" paxconsola.prg
  x64sc -moncommands "paxconsola.vs" -nativemonitor paxconsola.prg

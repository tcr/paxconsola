#!/bin/bash

FILE=snake.pax

paxforth dump $FILE --inline > $FILE.dump

paxforth compile $FILE --inline --optimize --target c64 > generated.asm && \
  make && \
#  x64sc -moncommands "paxconsola.vs" paxconsola.prg
  x64sc -moncommands "paxconsola.vs" -nativemonitor paxconsola.prg

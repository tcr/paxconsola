extern read-line

variable prsa
variable prso
variable prsi

variable current-room
variable player

s" Would you like to play Cave World?" type cr
s" > " type

cr

variable input-text
2 cells allot

s" look" input-text 2!

input-text @ .
input-text 1 + @ .


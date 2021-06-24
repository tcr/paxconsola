
7 r> begin
    6 r< dup r> = if 0 print leave then
    7 r< dup r> = if 1 print leave then
    8 r< dup r> = if 2 print leave then
    ( default ) 3 print
    r< drop
    1
until

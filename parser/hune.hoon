::  parse hune
::
|=  t=tape
|^  (scan t hune)
+$  hun
  $@  @ud
  $%  [%tisfas tape hun hun]
      [%wutcol hun hun hun]
  ==
::
++  hune
  %+  knee  *hun
  |.  ~+
  ;~  pose
    dem
    tisfas
    wutcol
  ==
::
::  parse letters until a non-letter
++  face
  (star (shim 'a' 'z'))
::
::
++  tisfas
  %+  knee  *hun
  |.  ~+
  ;~  (glue gap)
    (cold %tisfas ;~(plug tis fas))
    face
    hune
    hune
  ==
::
++  wutcol
  %+  knee  *hun
  |.  ~+
  ;~  (glue gap)
    (cold %wutcol ;~(plug wut col))
    hune
    hune
    hune
  ==
--
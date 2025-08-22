::  parse hoon
::
|=  t=tape
|^  (scan t p-hoon)
+$  hoon
  $@  @ud
  $%  [%tsfs p=skin q=hoon q=hoon]
      [%wtcl p=hoon q=hoon r=hoon]
      [%clhp p=hoon q=hoon]
  ==
::
++  p-hoon
  %+  knee  *hoon
  |.  ~+
  ;~  pose
    dem
    tisfas
    wutcol
    colhep
  ==
::
+$  skin  term
::
++  p-skin
  %+  boss
    256
  ;~  pose
    (star (shim 'a' 'z'))
  ==
::
::
++  tisfas
  %+  knee  *hoon
  |.  ~+
  (rune-three %tsfs tis fas p-skin p-hoon p-hoon)
::
++  wutcol
  %+  knee  *hoon
  |.  ~+
  (rune-three %wtcl wut col p-hoon p-hoon p-hoon)
::
++  colhep
  %+  knee  *hoon
  |.  ~+
  (rune-two %clhp col hep p-hoon p-hoon)
::
++  rune-three
  |*  [symbol=term chara=rule charb=rule childa=rule childb=rule childc=rule]
  ;~  pose
    :: tall
    ;~  (glue gap)
      (cold symbol ;~(plug chara charb))
      childa
      childb
      childc
    ==
    :: wide
    ;~  plug
      (cold symbol ;~(plug chara charb))
      %+  ifix
        [pal par]
      ;~  (glue ace)
        childa
        childb
        childc
      ==
    ==
  ==
::
++  rune-two
  |*  [symbol=term chara=rule charb=rule childa=rule childb=rule]
  ;~  pose
    :: tall
    ;~  (glue gap)
      (cold symbol ;~(plug chara charb))
      childa
      childb
    ==
    :: wide
    ;~  plug
      (cold symbol ;~(plug chara charb))
      %+  ifix
        [pal par]
      ;~  (glue ace)
        childa
        childb
      ==
    ==
  ==
--
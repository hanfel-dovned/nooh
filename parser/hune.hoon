::  parse hoon
::
::  Next steps:
::  1. Implement every rune in both tall and wide forms (see comment blow)
::  2. Go down the list of irregular syntax https://docs.urbit.org/hoon/irregular
::  3. Testing and performance
::  Open question: when do I run into LL vs. PEG, backtracking, etc
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
::  It might be both most readable and most succint to just hardcode all the possibilities:
::  - a generic rune arm for each exact number of children a rune can take, where we pass in rules. so rune-three can be used for both wutcol and tisfas
::  - (map term tome)
::  - (list hoon)
::  - (list (pair wing hoon))
::  - etc
::  might want to start with |_ and |^ to see how to reuse the (map term tome) arm despite different preceding children
::  so the generic arms are a new thing to cut down on hoon.hoon having an arm for every single permutation, and
::  the other ones are more similar to what hoon.hoon is doing but we can just use ++star for every one
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
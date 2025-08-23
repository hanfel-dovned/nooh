::  parse hoon
::
::  Next Steps:
::  - Parse limbs and wings
::  - Implement all atom auras in p-sand
::  - Implement every rune in both tall and wide forms
::  - Implement all irregular syntax
::  - Testing and performance
::
::  Known Unknowns:
::  - LL vs. PEG. Does this naive parser grow the call stack too much? What does the current LL Hoon parser do to prevent this?
::
|=  t=tape
::
|^  (scan t p-hoon)
++  p-hoon
  %+  knee  *hoon
  |.  ~+
  ;~  pose
    p-sand
::    p-limb
    tisfas
    wutcol
    colhep
  ==
::
++  p-sand
  ;~  pose
    :: @ud
    %+  cook  
      |=  a=@ud  [%sand p=%ud q=a]
    dem
  ==
::
:: ++  p-wing
::   ;~  (gap dot)
::
:: ++  p-limb
::   %+  cook
::     |=  t=@t  [%limb p=t]
::   (star (shim 'a' 'z'))
::
++  p-skin
  %+  boss
    256
  ;~  pose
    (star (shim 'a' 'z'))
  ==
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
::  Obviously these rune-n rule builders are hideous from a code reuse perspective,
::  but naively they seem way more legible than hoon.hoon's method of
::  having a separate rule for each permutation of children a rune can have.
::
::  They can't take variable-sized children because of the way they apply their
::  rules with ++plug, so I think I can write specific arms for each of those
::  recursive data typed child that runes expect. I'm not sure if this is the correct
::  approach, so I should start with |_ and |^ to see how to reuse the (map term tome) arm despite different preceding children
::
++  rune-one
  |*  [symbol=term chara=rule charb=rule childa=rule]
  ;~  pose
    :: tall
    ;~  (glue gap)
      (cold symbol ;~(plug chara charb))
      childa
    ==
    :: wide
    ;~  plug
      (cold symbol ;~(plug chara charb))
      %+  ifix
        [pal par]
      ;~  (glue ace)
        childa
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
++  rune-four
  |*  [symbol=term chara=rule charb=rule childa=rule childb=rule childc=rule childd=rule]
  ;~  pose
    :: tall
    ;~  (glue gap)
      (cold symbol ;~(plug chara charb))
      childa
      childb
      childc
      childd
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
        childd
      ==
    ==
  ==
--
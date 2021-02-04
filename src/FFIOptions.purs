-- modified from https://github.com/joneshf/purescript-option/blob/v2.1.0/src/Option.purs
module FFIOptions
  ( class FFIOptions
  , class Helper
  ) where

import Prim.Row (class Lacks, class Union)
import Prim.Row as R
import Prim.RowList (kind RowList, class RowToList, Nil)
import Prim.RowList as RL

class FFIOptions (required :: # Type) (optional :: # Type) r

instance ffiOptions ::
  ( Union required sub r
  , RowToList sub list
  , Helper list optional sub
  ) =>
  FFIOptions required optional { | r }

class Helper (list :: RowList) (optional :: # Type) (sub :: # Type) | list -> optional sub

instance helperNil :: Helper Nil options ()

instance helperCons ::
  ( R.Cons label type_ o options
  , R.Cons label type_ s sub
  , Lacks label o
  , Lacks label s
  , Helper list o s
  ) =>
  Helper (RL.Cons label type_ list) options sub

-- modified from https://github.com/joneshf/purescript-option/blob/v2.1.0/src/Option.purs
module FFIOptions
  ( class FFIOptions
  , class Helper
  ) where

import Prim.Row as R
import Prim.RowList (kind RowList, Nil)
import Prim.RowList as RL

class FFIOptions (requried :: # Type) (optional :: # Type) (row :: # Type)

instance ffiOptions ::
  ( R.Union required r row
  , RL.RowToList r list
  , Helper list optional r
  ) =>
  FFIOptions required optional row

class Helper (list :: RowList) (optional :: # Type) (row :: # Type) | list -> optional row

instance helperNil :: Helper Nil options ()

instance helperCons ::
  ( R.Cons label type_ o options
  , R.Cons label type_ r row
  , R.Lacks label o
  , R.Lacks label r
  , Helper list o r
  ) =>
  Helper (RL.Cons label type_ list) options row

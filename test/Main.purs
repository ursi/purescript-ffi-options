-- compiles = tests passed
module Test.Main where

import FFIOptions (class FFIOptions)

type Required
  = ( a :: Int, b :: String )

type Optional
  = ( c :: Int, d :: String )

a :: ∀ r. FFIOptions Required Optional r => Record r -> Int
a _ = 0

a1 = a { a: 0, b: "" }

a2 = a { a: 0, b: "", c: 0 }

a3 = a { a: 0, b: "", d: "" }

a4 = a { a: 0, b: "", c: 0, d: "" }

b :: ∀ r. FFIOptions () Optional r => Record r -> Int
b _ = 0

b1 = b {}

b2 = b { c: 0 }

b3 = b { d: "" }

b4 = b { c: 0, d: "" }

c :: ∀ r. FFIOptions Required () r => Record r -> Int
c _ = 0

c1 = c { a: 0, b: "" }

{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Data.Binary.Instances.Scientific where

import Data.Binary.Orphans ()

#if !(MIN_VERSION_scientific(0,3,4))
import Control.Monad (liftM2)
import Data.Binary   (Binary, Get, Put, get, put)

import qualified Data.Scientific as S

instance Binary S.Scientific where
    get = liftM2 S.scientific get get
    put s = put (S.coefficient s) >> put (S.base10Exponent s)
#endif

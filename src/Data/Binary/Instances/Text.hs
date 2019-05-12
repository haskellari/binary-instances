{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Data.Binary.Instances.Text where

import Data.Binary.Orphans ()

#if !(MIN_VERSION_text(1,2,1))
import Data.Text.Binary ()
#endif

{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Data.Binary.Instances.Primitive where

import Data.Binary.Orphans ()

import Control.Monad (replicateM)
import Data.Binary   (Binary, Get, Put, get, put)
import Data.Word     (Word8)

import qualified Data.Primitive as Prim

-- | @since 1.0.3
instance Binary Prim.ByteArray where
  put ba = put maxI >> go 0
    where
      maxI :: Int
      maxI = Prim.sizeofByteArray ba

      go :: Int -> Put
      go i | i < maxI  = put (Prim.indexByteArray ba i :: Word8) >> go (i + 1)
           | otherwise = return ()

  get = do
    len <- get
    xs  <- replicateM len get
    return (Prim.byteArrayFromListN len (xs :: [Word8]))

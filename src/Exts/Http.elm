module Exts.Http where

{-| Extensions to the core Http library. |-}

import List
import Set
import Set (Set)
import Http
import Http (..)

isWaiting : Response a -> Bool
isWaiting response =
  case response of
    Waiting -> True
    _            -> False

isSuccess : Response a -> Bool
isSuccess response =
  case response of
    Success _ -> True
    _              -> False

justResponse : Response a -> Maybe (Result String a)
justResponse x =
  case x of
    Success v -> Just (Ok v)
    Waiting -> Nothing
    Failure _ msg -> Just (Err msg)

justSuccess : Response a -> Maybe a
justSuccess x =
  case x of
    Success v -> Just v
    _ -> Nothing

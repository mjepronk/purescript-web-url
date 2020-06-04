module Web.URL
  ( fromAbsolute
  , fromRelative
  , module Exports
  )
where

import Data.Maybe (Maybe(..))
import Web.URL.Foreign (URL, mkURL, mkURLRel, isUndefined)
import Web.URL.Foreign (toString, hash, host, hostname, href, origin, password,
    pathname, port, protocol, search, searchParams, username) as Exports


-- | Construct a URL from a string containing an absolute URL.
fromAbsolute :: String -> Maybe URL
fromAbsolute base = if isUndefined url then Nothing else Just url
    where url = mkURL base

-- | Construct a URL from two strings containing a relative and absolute URL
-- | respectively.
fromRelative :: String -> String -> Maybe URL
fromRelative rel base = if isUndefined url then Nothing else Just url
    where url = mkURLRel rel base

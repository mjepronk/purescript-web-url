module Web.URL
  ( URL
  , URLSearchParams
  , fromAbsolute
  , fromRelative
  , toString
  , hash
  , host
  , hostname
  , href
  , origin
  , password
  , pathname
  , port
  , protocol
  , search
  , searchParams
  , setHash
  , setHost
  , setHostname
  , setHref
  , setPassword
  , setPathname
  , setPort
  , setProtocol
  , setSearch
  , setUsername
  , username
  )
where

import Prelude
import Data.Maybe (Maybe(..))


foreign import data URL :: Type

instance showURL :: Show URL where
  show = toString

foreign import data URLSearchParams :: Type

-- | Construct a URL from a string containing an absolute URL.
fromAbsolute :: String -> Maybe URL
fromAbsolute base = if isUndefined url then Nothing else Just url
    where url = mkURL base

-- | Construct a URL from two strings containing a relative and absolute URL
-- | respectively.
fromRelative :: String -> String -> Maybe URL
fromRelative rel base = if isUndefined url then Nothing else Just url
    where url = mkURLRel rel base

foreign import mkURL :: String -> URL
foreign import mkURLRel :: String -> String -> URL
foreign import isUndefined :: URL -> Boolean


-- | Returns a String containing the whole URL.
foreign import toString :: URL -> String

-- | A String containing a '#' followed by the fragment identifier of the URL.
foreign import hash :: URL -> String

-- | A String containing the domain (that is the hostname) followed by (if a
-- | port was specified) a ':' and the port of the URL.
foreign import host :: URL -> String

-- | A String containing the domain of the URL.
foreign import hostname :: URL -> String

-- | Returns a String containing the whole URL (synonym for toString).
foreign import href :: URL -> String

-- | Returns a String containing the origin of the URL, that is its scheme,
-- | its domain and its port.
foreign import origin :: URL -> String

-- | A String containing the password specified before the domain name.
foreign import password :: URL -> String

-- | A String containing an initial '/' followed by the path of the URL.
foreign import pathname :: URL -> String

-- | A String containing the port number of the URL.
foreign import port :: URL -> String

-- | A String containing the protocol scheme of the URL, including the final ':'.
foreign import protocol :: URL -> String

-- | A String indicating the URL's parameter string; if any parameters are
-- | provided, this string includes all of them, beginning with the leading '?'
-- | character.
foreign import search :: URL -> String

-- | A URLSearchParams object which can be used to access the individual query
-- | parameters found in search.
foreign import searchParams :: URL -> URLSearchParams

-- | A String containing the username specified before the domain name.
foreign import username :: URL -> String

foreign import setHash :: String -> URL -> URL
foreign import setHost :: String -> URL -> URL
foreign import setHostname :: String -> URL -> URL
foreign import setHref :: String -> URL -> URL
foreign import setPassword :: String -> URL -> URL
foreign import setPathname :: String -> URL -> URL
foreign import setPort :: String -> URL -> URL
foreign import setProtocol :: String -> URL -> URL
foreign import setSearch :: String -> URL -> URL
foreign import setUsername :: String -> URL -> URL

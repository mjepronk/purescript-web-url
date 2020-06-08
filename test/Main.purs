module Test.Main where

import Prelude

import Data.Maybe (Maybe(..))
import Data.Tuple (Tuple(..))
import Effect (Effect)
import Effect.Aff (launchAff_)
import Test.Spec (describe, it, pending)
import Test.Spec.Assertions (shouldEqual)
import Test.Spec.Reporter.Console (consoleReporter)
import Test.Spec.Runner (runSpec)
import Web.URL as URL
import Web.URL.URLSearchParams as USP

main :: Effect Unit
main = launchAff_ $ runSpec [consoleReporter] do
  describe "URL" do

    describe "fromAbsolute" do
      it "returns a URL from an a String" do
        let u = URL.fromAbsolute "http://www.remakingthe.world"
        (show <$> u) `shouldEqual` Just "http://www.remakingthe.world/"
      it "returns Nothing when given an invalid URL" do
        let u = URL.fromAbsolute "this.is.not.valid"
        u `shouldEqual` Nothing

    describe "fromRelative" do
      it "returns a URL from a relative and base URL" do
        let u = URL.fromRelative "/matthias/" "http://www.remakingthe.world"
        (show <$> u) `shouldEqual` Just "http://www.remakingthe.world/matthias/"
      it "returns Nothing when given an invalid URL" do
        let u = URL.fromRelative "/matthias/" "this.is.not.valid"
        u `shouldEqual` Nothing

    describe "hash" do
      it "returns a hash from a URL" do
        let u = URL.hash $ URL.unsafeFromAbsolute "http://www.remakingthe.world/matthias/#fr"
        u `shouldEqual` "#fr"
      it "returns empty string when URL has no hash" do
        let u = URL.hash $ URL.unsafeFromAbsolute "http://www.remakingthe.world/matthias/"
        u `shouldEqual` ""

    describe "hosts" do
      it "returns a host from a URL" do
        let u = URL.host $ URL.unsafeFromAbsolute "http://www.remakingthe.world/matthias/#fr"
        u `shouldEqual` "www.remakingthe.world"
      it "returns host with port from a URL" do
        let u = URL.host $ URL.unsafeFromAbsolute "http://www.remakingthe.world:8000/"
        u `shouldEqual` "www.remakingthe.world:8000"

    describe "hostname" do
      it "returns the hostname from a URL" do
        let u = URL.host $ URL.unsafeFromAbsolute "http://www.remakingthe.world/matthias/#fr"
        u `shouldEqual` "www.remakingthe.world"
      it "returns the hostname without port from a URL" do
        let u = URL.hostname $ URL.unsafeFromAbsolute "http://www.remakingthe.world:8000/"
        u `shouldEqual` "www.remakingthe.world"

    describe "href" do
      it "returns the href (complete string) from a URL" do
        let u = URL.href $ URL.unsafeFromAbsolute "http://www.remakingthe.world/matthias/#fr"
        u `shouldEqual` "http://www.remakingthe.world/matthias/#fr"

    describe "origin" do
      it "returns the origin (scheme, domain & port) from a URL" do
        let u = URL.origin $ URL.unsafeFromAbsolute "http://www.remakingthe.world/matthias/#fr"
        u `shouldEqual` "http://www.remakingthe.world"
      it "returns the hostname without port from a URL if port is default port of scheme" do
        let u = URL.origin $ URL.unsafeFromAbsolute "https://www.remakingthe.world:443/"
        u `shouldEqual` "https://www.remakingthe.world"

    describe "password" do
      it "returns the password from a URL" do
        let u = URL.password $ URL.unsafeFromAbsolute "http://matthias:ensure@www.remakingthe.world/"
        u `shouldEqual` "ensure"
      it "returns empty string if URL has no password" do
        let u = URL.password $ URL.unsafeFromAbsolute "http://matthias@www.remakingthe.world/"
        u `shouldEqual` ""

    pending "pathname"
    pending "port"
    pending "protocol"
    pending "search"
    pending "searchParams"
    pending "username"

  describe "URLSearchParams" do
    describe "fromString" do
      it "returns a URLSearhParams for form encoded string" do
        let p = USP.fromString "foo=1&bar=2"
        show p `shouldEqual` "foo=1&bar=2"

    describe "append" do
      it "appends the parameters to the URLSearchParams" do
        let p = USP.append "baz" "3" $ USP.fromString "foo=1&bar=2"
        show p `shouldEqual` "foo=1&bar=2&baz=3"
      it "keeps the original URLSearchParams unmodified" do
        let p = USP.fromString "foo=1&bar=2"
        let _ = USP.append "baz" "3"
        show p `shouldEqual` "foo=1&bar=2"

    describe "delete" do
      it "deletes the given key from the URLSearchParams" do
        let p = USP.delete "bar" $ USP.fromString "foo=1&bar=2"
        show p `shouldEqual` "foo=1"
      it "keeps the original URLSearchParams unmodified" do
        let p = USP.fromString "foo=1&bar=2"
        let _ = USP.delete "baz"
        show p `shouldEqual` "foo=1&bar=2"

    describe "entries" do
      it "returns an Array of Tuples from a URLSearchParams" do
        let x = USP.entries $ USP.fromString "foo=1&bar=2"
        x `shouldEqual` [Tuple "foo" "1", Tuple "bar" "2"]
      it "returns an empty Array from an empty URLSearchParams" do
        let x = USP.entries $ USP.fromString ""
        x `shouldEqual` []

    describe "get" do
      it "returns an existing key from a URLSearchParams" do
        let x = USP.get "foo" $ USP.fromString "foo=1&bar=2"
        x `shouldEqual` Just "1"
      it "returns Nothing if the key is missing" do
        let x = USP.get "baz" $ USP.fromString "foo=1&bar=2"
        x `shouldEqual` Nothing

    describe "getAll" do
      it "returns an Array from a URLSearchParams" do
        let x = USP.getAll "foo" $ USP.fromString "foo=1&foo=there_is_more_foo"
        x `shouldEqual` ["1", "there_is_more_foo"]
      it "returns an empty Array if the key is missing" do
        let x = USP.getAll "baz" $ USP.fromString "foo=1&bar=2"
        x `shouldEqual` []

    describe "has" do
      it "returns True if the key exists in the URLSearchParams" do
        let x = USP.has "foo" $ USP.fromString "foo=1&bar=2"
        x `shouldEqual` true
      it "returns False if the key exists in the URLSearchParams" do
        let x = USP.has "baz" $ USP.fromString "foo=1&bar=2"
        x `shouldEqual` false

    describe "keys" do
      it "returns an Array of keys for the given URLSearchParams" do
        let x = USP.keys $ USP.fromString "foo=1&bar=2"
        x `shouldEqual` ["foo", "bar"]
      it "returns an empty Array if the URLSearchParams is empty" do
        let x = USP.keys $ USP.fromString ""
        x `shouldEqual` []

    describe "set" do
      it "setting an existing key updates it in the URLSearchParams" do
        let p = USP.set "foo" "3" $ USP.fromString "foo=1&bar=2"
        show p `shouldEqual` "foo=3&bar=2"
      it "setting a non existing key adds it to the URLSearchParams" do
        let p = USP.set "baz" "3" $ USP.fromString "foo=1&bar=2"
        show p `shouldEqual` "foo=1&bar=2&baz=3"
      it "keeps the original URLSearchParams unmodified" do
        let p = USP.fromString "foo=1&bar=2"
        let _ = USP.set "baz" "3"
        show p `shouldEqual` "foo=1&bar=2"

    describe "sort" do
      it "sorts the key/values in the URLSearchParams" do
        let p = USP.sort $ USP.fromString "foo=1&bar=2"
        show p `shouldEqual` "bar=2&foo=1"
      it "keeps the original URLSearchParams unmodified" do
        let p = USP.fromString "foo=1&bar=2"
        let _ = USP.sort p
        show p `shouldEqual` "foo=1&bar=2"

    describe "toString" do
      it "toString <<< fromString ~ identity" do
        let x = USP.toString $ USP.fromString "foo=1&bar=2"
        x `shouldEqual` "foo=1&bar=2"
      it "toString <<< fromString ~ identity (empty string)" do
        let x = USP.toString $ USP.fromString ""
        x `shouldEqual` ""

    describe "values" do
      it "returns an Array of values for the given URLSearchParams" do
        let x = USP.values $ USP.fromString "foo=1&bar=2"
        x `shouldEqual` ["1", "2"]
      it "returns an empty Array if the URLSearchParams is empty" do
        let x = USP.values $ USP.fromString ""
        x `shouldEqual` []

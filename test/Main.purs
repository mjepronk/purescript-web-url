module Test.Main where

import Prelude

import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Aff (launchAff_)
import Test.Spec (pending, describe, it)
import Test.Spec.Assertions (shouldEqual)
import Test.Spec.Reporter.Console (consoleReporter)
import Test.Spec.Runner (runSpec)
import Web.URL as URL

main :: Effect Unit
main = launchAff_ $ runSpec [consoleReporter] do
  describe "Web URL" do

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

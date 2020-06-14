{ name = "web-url"
, dependencies =
  [ "maybe", "partial", "prelude", "psci-support", "spec", "tuples" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
, license = "BSD-3-Clause"
, repository = "https://github.com/mjepronk/purescript-web-url.git"
}

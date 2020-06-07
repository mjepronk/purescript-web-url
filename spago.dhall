{ name = "web-url"
, dependencies =
  [ "console", "effect", "maybe", "partial", "prelude", "spec", "tuples" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}

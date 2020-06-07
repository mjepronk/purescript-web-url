{ name = "web-url"
, dependencies =
  [ "console", "effect", "maybe", "partial", "prelude", "tuples" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}

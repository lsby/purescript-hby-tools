{ name = "hby-tools"
, dependencies = [ "console", "effect", "prelude", "psci-support", "either", "exceptions" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}

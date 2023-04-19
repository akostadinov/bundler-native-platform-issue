defs = ::Bundler::Definition.build(__dir__ + "/Gemfile", "Gemfile.lock", nil)
defs.specs_for([:default])

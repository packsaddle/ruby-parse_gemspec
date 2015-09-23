module ParseGemspec
  class Parser
    def self.load(gemspec_path)
      spec = Gem::Specification.load(gemspec_path)
      {
        name: spec.name,
        version: spec.version.version
      }
    end
  end
end

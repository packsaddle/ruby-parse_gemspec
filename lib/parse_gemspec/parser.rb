module ParseGemspec
  class Parser
    def self.parse(contents)
      spec = nil
      Tempfile.create('parse_gemspec') do |f|
        f.write contents
        f.rewind
        spec = Gem::Specification::load(f.path)
      end
      {
        name: spec.name,
        version: spec.version.version
      }
    end
  end
end

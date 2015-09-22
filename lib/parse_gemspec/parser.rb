module ParseGemspec
  class Parser
    def self.parse(contents)
      spec = build_spec(contents)
      {
        name: spec.name,
        version: spec.version.version
      }
    end

    def self.build_spec(gemspec)
      temp_file, spec = Tempfile.open('parse_gemspec') do |f|
        f.write gemspec
        f.flush
        f.rewind
        [f, Gem::Specification.load(f.path)]
      end
      spec
    ensure
      temp_file.close!
    end
  end
end

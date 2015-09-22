module ParseGemspec
  class Parser
    def self.parse(contents)
      spec = nil
      begin
        temp_file = Tempfile.open('parse_gemspec') do |f|
          f.write contents
          f.flush
          f.rewind
          spec = Gem::Specification.load(f.path)
          f
        end
      ensure
        temp_file.close!
      end
      {
        name: spec.name,
        version: spec.version.version
      }
    end
  end
end

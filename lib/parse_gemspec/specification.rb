module ParseGemspec
  class Specification
    extend Forwardable
    def_delegators :@spec, :name, :version, :authors, :homepage

    def self.load(file)
      fail GemspecFileNotFoundError, "file: #{file}" unless File.file?(file)
      spec = Gem::Specification.load(file)
      fail ParseGemspecError, "file: #{file}" unless spec
      new(spec)
    end

    def initialize(spec)
      @spec = spec
    end

    def to_hash_object
      {
        name: name,
        version: version.version,
        authors: authors,
        homepage: homepage
      }
    end
  end
end

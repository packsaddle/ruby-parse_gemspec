module ParseGemspec
  class Specification
    extend Forwardable
    def_delegators :@spec, :name, :version, :authors, :description, :homepage
    def_delegators :@spec, :email, :metadata, :summary

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
        description: description,
        email: email,
        homepage: homepage,
        metadata: metadata,
        summary: summary
      }
    end
  end
end

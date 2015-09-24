module ParseGemspec
  class Specification
    extend Forwardable
    def_delegators :@spec, :name, :version, :homepage

    def self.load(file)
      fail ParseGemspecError unless file
      fail GemspecFileNotFoundError unless File.file?(file)
      spec = Gem::Specification.load(file)
      fail ParseGemspecError unless spec
      new(spec)
    end

    def initialize(spec)
      @spec = spec
    end

    def to_hash_object(format: {}) # rubocop:disable Lint/UnusedMethodArgument
      {
        name: name,
        version: version.version,
        homepage: homepage
      }
    end
  end
end

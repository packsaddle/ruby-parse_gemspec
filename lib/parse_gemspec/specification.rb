module ParseGemspec
  class Specification
    extend Forwardable
    def_delegators :@spec, :name, :version, :homepage

    def self.load(*args)
      spec = Gem::Specification.load(*args)
      new(spec)
    end

    def initialize(spec)
      @spec = spec
    end

    def format(format: {}) # rubocop:disable Lint/UnusedMethodArgument
      {
        name: name,
        version: version.version,
        homepage: homepage
      }
    end
  end
end

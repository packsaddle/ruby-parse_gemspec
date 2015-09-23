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

    def format(output_format: {})
      # avoid rubocop warn
      output_format.nil?

      {
        name: name,
        version: version.version,
        homepage: homepage
      }
    end
  end
end

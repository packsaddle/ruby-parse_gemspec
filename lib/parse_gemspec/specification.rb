module ParseGemspec
  class Specification
    def self.load(*args)
      spec = Gem::Specification.load(*args)
      new(spec)
    end

    def initialize(spec)
      @spec = spec
    end

    def format(output_format: {})
      {
        name: @spec.name,
        version: @spec.version.version
      }
    end
  end
end

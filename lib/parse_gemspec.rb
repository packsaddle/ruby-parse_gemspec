require 'rubygems'

require 'parse_gemspec/constants'
require 'parse_gemspec/parser'
require 'parse_gemspec/version'

module ParseGemspec
  def self.load(gemspec_path)
    Parser.load(gemspec_path)
  end
end

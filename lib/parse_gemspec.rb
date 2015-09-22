require 'rubygems'
require 'tempfile'

require 'parse_gemspec/constants'
require 'parse_gemspec/parser'
require 'parse_gemspec/version'

module ParseGemspec
  def self.parse(contents)
    Parser.parse(contents)
  end
end

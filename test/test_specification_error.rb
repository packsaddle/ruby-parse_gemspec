require_relative 'helper'

module ParseGemspec
  class TestSpecificationError < Test::Unit::TestCase
    fixture_path = File.join('.', 'test', 'fixtures')

    def self.startup
      # http://stackoverflow.com/questions/15430551/suppress-console-output-during-rspec-tests
      @original_stderr = $stderr
      @original_stdout = $stdout
      # Redirect stderr and stdout
      $stderr = File.open(File::NULL, 'w')
      $stdout = File.open(File::NULL, 'w')
    end

    def self.shutdown
      $stderr = @original_stderr
      $stdout = @original_stdout
    end

    test 'gemspec file not found' do
      invalid_gemspec_path = File.join('path', 'to', 'file_not_found.gemspec')
      assert_raise(GemspecFileNotFoundError) do
        ParseGemspec::Specification.load(invalid_gemspec_path)
      end
    end

    test 'not gemspec file' do
      not_gemspec_file = File.join(
        'bigdecimal-1.2.7',
        'README'
      )
      not_gemspec_path = File.join(fixture_path, not_gemspec_file)
      assert_raise(ParseGemspecError) do
        ParseGemspec::Specification.load(not_gemspec_path)
      end
    end
  end
end

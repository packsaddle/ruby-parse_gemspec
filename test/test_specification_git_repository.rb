require_relative 'helper'

module ParseGemspec
  class TestSpecificationGitRepository < Test::Unit::TestCase
    fixture_path = File.join('.', 'test', 'fixtures')
    gemspec_file = File.join(
      'rubocop-select',
      'rubocop-select.gemspec'
    )
    gemspec_path = File.join(fixture_path, gemspec_file)

    test '.load' do
      assert_nothing_raised do
        ParseGemspec::Specification.load(gemspec_path)
      end
    end

    test '#to_hash_object' do
      expected = {
        name: 'rubocop-select',
        version: '0.1.2.pre.beta',
        authors: ['sanemat'],
        description: 'Pipe between git diff and rubocop.',
        email: ['o.gata.ken@gmail.com'],
        homepage: 'https://github.com/packsaddle/rubocop-select',
        metadata: {}
      }
      spec = ParseGemspec::Specification.load(gemspec_path)

      assert do
        spec.to_hash_object == expected
      end
    end
  end
end

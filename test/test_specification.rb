require_relative 'helper'

module ParseGemspec
  class TestSpecification < Test::Unit::TestCase
    sub_test_case 'bigdecimal' do
      gemspec_path = './test/fixtures/bigdecimal-1.2.7/bigdecimal.gemspec'
      expected = {
        name: 'bigdecimal',
        version: '1.2.7'
      }
      test '.load' do
        assert do
          ParseGemspec::Specification.load(gemspec_path).format == expected
        end
      end
    end

    sub_test_case 'rubocop-select' do
      gemspec_path = './test/fixtures/rubocop-select/rubocop-select.gemspec'
      expected = {
        name: 'rubocop-select',
        version: '0.1.2.pre.beta'
      }
      test '.load' do
        assert do
          ParseGemspec::Specification.load(gemspec_path).format == expected
        end
      end
    end
  end
end

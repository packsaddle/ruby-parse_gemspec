require_relative 'helper'

module ParseGemspec
  class TestParser < Test::Unit::TestCase
    sub_test_case 'bigdecimal' do
      gemspec = File.read('./test/fixtures/bigdecimal-1.2.7/bigdecimal.gemspec')
      expected = {
        name: 'bigdecimal',
        version: '1.2.7'
      }
      test '.parse' do
        assert do
          Parser.parse(gemspec) == expected
        end
      end
    end

    sub_test_case 'rubocop-select' do
      gemspec = File.read('./test/fixtures/rubocop-select/rubocop-select.gemspec')
      expected = {
        name: 'rubocop-select',
        version: '2.2'
      }
      test '.parse' do
        assert do
          Parser.parse(gemspec) == expected
        end
      end
    end
  end
end

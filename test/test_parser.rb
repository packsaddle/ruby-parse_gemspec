require_relative 'helper'

module ParseGemspec
  class TestParser < Test::Unit::TestCase
    sub_test_case 'bigdecimal' do
      gemspec = File.read('./test/fixtures/bigdecimal/bigdecimal.gemspec')
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
  end
end

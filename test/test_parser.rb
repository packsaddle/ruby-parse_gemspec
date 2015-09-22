require_relative 'helper'

module ParseGemspec
  class TestParser < Test::Unit::TestCase
    test '.parse' do
      assert do
        Parser.parse('contents') == 'parsed'
      end
    end
  end
end

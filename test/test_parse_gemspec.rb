require_relative 'helper'

module ParseGemspec
  class TestGemspec < Test::Unit::TestCase
    test 'version' do
      assert do
        !::ParseGemspec::VERSION.nil?
      end
    end
  end
end

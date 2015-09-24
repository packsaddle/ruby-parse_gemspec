require_relative 'helper'

module ParseGemspec
  class TestSpecificationGemAsIs < Test::Unit::TestCase
    fixture_path = File.join('.', 'test', 'fixtures')
    gemspec_file = File.join(
      'bigdecimal-1.2.7',
      'bigdecimal.gemspec'
    )
    gemspec_path = File.join(fixture_path, gemspec_file)

    test '.load' do
      assert_nothing_raised do
        ParseGemspec::Specification.load(gemspec_path)
      end
    end

    test '#to_hash_object' do
      expected = {
        name: 'bigdecimal',
        version: '1.2.7',
        authors: ['Kenta Murata', 'Zachary Scott', 'Shigeo Kobayashi'],
        description:
          'This library provides ' \
            'arbitrary-precision decimal floating-point number class.',
        email: 'mrkn@mrkn.jp',
        homepage: 'http://www.ruby-lang.org',
        metadata: {}
      }
      spec = ParseGemspec::Specification.load(gemspec_path)

      assert do
        spec.to_hash_object == expected
      end
    end
  end
end

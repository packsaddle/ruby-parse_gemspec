require_relative 'helper'

module ParseGemspec
  class TestSpecification < Test::Unit::TestCase
    fixture_path = File.join('.', 'test', 'fixtures')
    sub_test_case 'gem as is (bigdecimal)' do
      gemspec_file = File.join(
        'bigdecimal-1.2.7',
        'bigdecimal.gemspec'
      )
      gemspec_path = File.join(fixture_path, gemspec_file)
      expected = {
        name: 'bigdecimal',
        version: '1.2.7',
        homepage: 'http://www.ruby-lang.org'
      }
      spec = ParseGemspec::Specification.load(gemspec_path)
      test '.format' do
        assert do
          spec.to_hash_object == expected
        end
      end
    end

    sub_test_case 'git repository (rubocop-select)' do
      gemspec_file = File.join(
        'rubocop-select',
        'rubocop-select.gemspec'
      )
      gemspec_path = File.join(fixture_path, gemspec_file)
      expected = {
        name: 'rubocop-select',
        version: '0.1.2.pre.beta',
        homepage: 'https://github.com/packsaddle/rubocop-select'
      }
      spec = ParseGemspec::Specification.load(gemspec_path)
      test '.format' do
        assert do
          spec.to_hash_object == expected
        end
      end
    end

    sub_test_case 'gem git command included (checkstyle_filter-git)' do
      gemspec_file = File.join(
        'checkstyle_filter-git-1.0.2',
        'checkstyle_filter-git.gemspec'
      )
      gemspec_path = File.join(fixture_path, gemspec_file)
      expected = {
        name: 'checkstyle_filter-git',
        version: '1.0.2',
        homepage: 'https://github.com/packsaddle/ruby-checkstyle_filter-git'
      }
      spec = ParseGemspec::Specification.load(gemspec_path)
      test '.format' do
        assert do
          spec.to_hash_object == expected
        end
      end
    end
  end
end

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

      test '.to_hash_object' do
        expected = {
          name: 'bigdecimal',
          version: '1.2.7',
          homepage: 'http://www.ruby-lang.org'
        }
        spec = ParseGemspec::Specification.load(gemspec_path)

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

      test '.to_hash_object' do
        expected = {
          name: 'rubocop-select',
          version: '0.1.2.pre.beta',
          homepage: 'https://github.com/packsaddle/rubocop-select'
        }
        spec = ParseGemspec::Specification.load(gemspec_path)

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

      test '.to_hash_object' do
        expected = {
          name: 'checkstyle_filter-git',
          version: '1.0.2',
          homepage: 'https://github.com/packsaddle/ruby-checkstyle_filter-git'
        }
        spec = ParseGemspec::Specification.load(gemspec_path)

        assert do
          spec.to_hash_object == expected
        end
      end
    end

    test 'gemspec file not found' do
      gemspec_path = File.join('path', 'to', 'file_not_found.gemspec')
      assert_raise(GemspecFileNotFoundError) do
        ParseGemspec::Specification.load(gemspec_path)
      end
    end
    test 'not gemspec file' do
      not_gemspec_file = File.join(
        'checkstyle_filter-git-1.0.2',
        'Gemfile'
      )
      not_gemspec_path = File.join(fixture_path, not_gemspec_file)
      assert_raise(ParseGemspecError) do
        ParseGemspec::Specification.load(not_gemspec_path)
      end
    end

    sub_test_case 'gem unpacked (checkstyle_filter-git)' do
      gem_file = 'checkstyle_filter-git-1.0.2.gem'
      gem_path = File.join(fixture_path, gem_file)
      test '.to_hash_object' do
        expected = {
          name: 'checkstyle_filter-git',
          version: '1.0.2',
          homepage: 'https://github.com/packsaddle/ruby-checkstyle_filter-git'
        }
        Dir.mktmpdir do |dir|
          command = ['gem', 'unpack', gem_path, '--target', dir]
          _, err, status = Open3.capture3(*command)
          $stderr.puts err
          fail if !status.exitstatus.nil? && status.exitstatus != 0

          gemspec_path = File.join(
            dir,
            'checkstyle_filter-git-1.0.2',
            'checkstyle_filter-git.gemspec'
          )
          spec = ParseGemspec::Specification.load(gemspec_path)

          assert do
            spec.to_hash_object == expected
          end
        end
      end
    end
  end
end

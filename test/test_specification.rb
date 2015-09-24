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
          homepage: 'https://github.com/packsaddle/rubocop-select'
        }
        spec = ParseGemspec::Specification.load(gemspec_path)

        assert do
          spec.to_hash_object == expected
        end
      end
    end

    sub_test_case 'gem unpacked (checkstyle_filter-git)' do
      gem_file = 'checkstyle_filter-git-1.0.2.gem'
      gem_path = File.join(fixture_path, gem_file)

      test '.load' do
        Dir.mktmpdir do |dir|
          command = ['gem', 'unpack', gem_path, '--target', dir]
          _, err, status = Open3.capture3(*command)
          fail err if !status.exitstatus.nil? && status.exitstatus != 0

          gemspec_path = File.join(
            dir,
            'checkstyle_filter-git-1.0.2',
            'checkstyle_filter-git.gemspec'
          )
          assert_nothing_raised do
            ParseGemspec::Specification.load(gemspec_path)
          end
        end
      end

      test '#to_hash_object' do
        expected = {
          name: 'checkstyle_filter-git',
          version: '1.0.2',
          authors: ['sanemat'],
          description: 'Filter errors(checkstyle) by git diff.',
          homepage: 'https://github.com/packsaddle/ruby-checkstyle_filter-git'
        }
        Dir.mktmpdir do |dir|
          command = ['gem', 'unpack', gem_path, '--target', dir]
          _, err, status = Open3.capture3(*command)
          fail err if !status.exitstatus.nil? && status.exitstatus != 0

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

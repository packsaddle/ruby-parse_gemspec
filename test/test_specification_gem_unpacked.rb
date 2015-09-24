require_relative 'helper'

module ParseGemspec
  class TestSpecificationGemUnpacked < Test::Unit::TestCase
    fixture_path = File.join('.', 'test', 'fixtures')
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
        email: ['o.gata.ken@gmail.com'],
        homepage: 'https://github.com/packsaddle/ruby-checkstyle_filter-git',
        metadata: {}
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

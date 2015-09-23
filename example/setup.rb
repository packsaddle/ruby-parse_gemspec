#!/usr/bin/env ruby

require 'open3'
out, err, status = Open3.capture3(*%w(bundle install --path vendor/bundle))
$stdout.puts out
$stderr.puts err
exit status.exitstatus if !status.exitstatus.nil? && status.exitstatus != 0

#!/usr/bin/env rake
require "bundler/gem_tasks"
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs.push "lib"
  t.libs.push "spec"
  t.test_files = FileList['spec/**/*_spec.rb']
  t.verbose = true
end

desc "Default: run specs."
task :default => :test

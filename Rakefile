require 'bundler'
Bundler::GemHelper.install_tasks
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:rspec) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rspec_opts = ['-cfs --backtrace --color']
end

task :simpletest do
  if system("which php > /dev/null")
    system "php test/all_tests.php"
  else
    puts "ERROR! Couldn't find PHP executable in $PATH."
  end
end

task :test_all do
  puts "Running php unit tests ..."
  Rake::Task["simpletest"].invoke

  puts "Running rspec specs ..."
  Rake::Task["rspec"].invoke
end

task :default => :test_all

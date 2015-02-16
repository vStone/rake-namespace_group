require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rake/namespace_group'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = '--format documentation --colour --backtrace --tty'
end

namespace_group :default, :all => true
namespace :default do
  task :foo do
    puts "Namespace 'default' task 'foo'"
  end
  task :bar do
    puts "Namespace 'default' task 'bar'"
  end
end

namespace :original do
  task :regular do
    puts "Namespace 'original' task 'regular'"
  end
end

namespace_group :original do
  task :foo do
    puts "Namespace 'original' task 'foo'"
  end
end

namespace_group :original do
  task :bar do
    puts "Namespace 'original' task 'bar'"
  end
end

namespace_group :arguments, :arguments => :bar do
  task :foo, :bar, :ext do |task, args|
    puts "Namespace 'arguments' task 'foo' argument: '#{args[:bar]}'"
  end
end

namespace_group :failures, :keep_going => false do
  task :bar do |task|
    puts "Namespace 'failures' task 'bar'"
    raise "BAR NO PLAY EITHER"
  end

  task :foo do |task|
    puts "Namespace 'failures' task 'foo'"
    raise "FOO NO PLAY"
  end
end
# Fix ordering for tests
task :failures => ['failures:foo', 'failures:bar' ]

namespace_group :aggregate_failure, :keep_going => true do
  task :foo do |task|
    puts "Namespace 'aggregate_failures' task 'foo'"
    raise "FOO NO PLAY"
  end

  task :bar do |task|
    puts "Namespace 'aggregate_failures' task 'bar'"
    raise "BAR NO PLAY EITHER"
  end
end

namespace_group :exclude_single, :exclude => /^foo$/ do |ns|
  task :foo do |task|
    puts "Namespace 'exclude_single' task 'foo'"
  end

  task :bar do |task|
    puts "Namespace 'exclude_single' task 'bar'"
  end
end

namespace_group :exclude_multi, :exclude => [/^ignore/, /foo/ ] do
  task :ignore_foo do |task|
    puts "Namespace 'exclude_multi' task 'ignore_foo'"
  end

  task :ignore_bar do |task|
    puts "Namespace 'exclude_multi' task 'ignore_bar'"
  end

  task :foo do |task|
    puts "Namespace 'exclude_multi' task 'foo'"
  end

  task :bar do |task|
    puts "Namespace 'exclude_multi' task 'bar'"
  end
end

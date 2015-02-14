require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rake/namespace_group'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = '--format documentation --colour --backtrace --tty'
end

namespace_group :default, :all => true
namespace :default do
  desc "Namespace 'default' task 'foo'"
  task :foo do
    puts "Namespace 'default' task 'foo'"
  end
  desc "Namespace 'default' task 'bar'"
  task :bar do
    puts "Namespace 'default' task 'bar'"
  end
end

namespace :original do
  desc "Namespace 'original' do task 'regular'"
  task :regular do
    puts "Namespace 'original' task 'regular'"
  end
end

namespace_group :original do
  desc "Namespace 'original' task 'foo'"
  task :foo do
    puts "Namespace 'original' task 'foo'"
  end
end

namespace_group :original do
  desc "Namespace 'original' task 'bar'"
  task :bar do
    puts "Namespace 'original' task 'bar'"
  end
end

namespace_group :arguments, :arguments => :bar do
  desc "Namespace 'arguments' task 'foo'"
  task :foo, :bar, :ext do |task, args|
    puts "Namespace 'arguments' task 'foo' argument: '#{args[:bar]}'"
  end
end

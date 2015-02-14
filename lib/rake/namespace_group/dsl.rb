require 'rake/namespace_group/group_task'

module Rake
  module DSL
    private

    alias_method :orig_task, :task

    def group_task(*args, &block)
      Rake::GroupTask.define_task(*args, &block)
    end

    # Create a new rake namespace and use it for evaluating the given
    # block. Returns a NameSpace object that can be used to lookup
    # tasks defined in the namespace. It also creates a parent level
    # task to execute all tasks defined in this namespace.
    #
    # Example:
    #
    #
    #
    #
    #
    def namespace_group(name=nil, options={}, &block)
      ns_name = options[:namespace] || name
      ns = namespace(ns_name) do
        if block_given?
          (class << self; self; end).send :alias_method, :task, :group_task
          yield
          (class << self; self; end).send :alias_method, :task, :orig_task
        end
      end
      scope = ns.scope

      desc options[:desc] || "Execute all tasks in group #{ns_name}"
      task ns_name, (options[:arguments] || []) do |_self, args|
        tasklist = Rake.application.tasks_in_scope(scope)
        tasklist.each do |task|
          if options[:all] or task.is_a?(Rake::GroupTask)
            task.invoke(args)
          end
        end
      end
    end
  end
end

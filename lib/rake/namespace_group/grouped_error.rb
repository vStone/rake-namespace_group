class GroupedError < RuntimeError
  attr_reader :exceptions

  def initialize(message)
    @exceptions = {}
  end

  def add_exception(task, exception)
    @exceptions[task.name.to_s] = { :task => task, :exception => exception }
  end

  def message
    "Failed Tasks: #{@exceptions.keys.inspect}"
  end

  def trace
    backtrace = []
    exceptions.each do |e,v|
      backtrace << v[:exception].backtrace.collect {|x| "[#{e}] #{x}" }
    end
    backtrace.flatten
  end

  def has_exceptions?
    exceptions.size > 0
  end

end

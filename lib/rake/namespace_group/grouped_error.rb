class GroupedError < Exception
  attr_reader :exceptions

  def initialize(message)
    @exceptions = {}
  end

  def add_exception(task, exception)
    @exceptions[task.name.to_s] = { :task => task, :exception => exception }
  end

  def print
    exceptions.each do |name, ex|
      puts "[Task: #{name}]: Exception[#{ex[:exception].class}] #{ex[:exception].message}"
      print ex[:exception].backtrace
    end
  end

  def has_exceptions?
    exceptions.size > 0
  end

end

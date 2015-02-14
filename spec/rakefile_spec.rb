require 'spec_helper'

describe 'Rakefile' do

  context "namespace default with :all => true" do
    it 'defines a top level task ' do
      expect(Rake::Task[:default]).to be_an_instance_of(Rake::Task)
    end

    it 'executes all regular tasks' do
      expect($stdout).to receive(:puts).with("Namespace 'default' task 'foo'")
      expect($stdout).to receive(:puts).with("Namespace 'default' task 'bar'")
      Rake::Task[:default].invoke()
    end
  end

  context "namespace original" do
    it 'defines a top level task' do
      expect(Rake::Task[:original]).to be_an_instance_of(Rake::Task)
    end

    it 'executes only group tasks' do
      expect($stdout).to receive(:puts).with("Namespace 'original' task 'foo'")
      expect($stdout).to receive(:puts).with("Namespace 'original' task 'bar'")
      expect($stdout).to_not receive(:puts).with("Namespace 'original' task 'regular'")
      Rake::Task[:original].invoke()
    end
  end

  context "namespace arguments" do
    it 'should detect the arguments' do
      expect(Rake::Task[:arguments].arg_names).to eq([:bar])
      expect(Rake::Task['arguments:foo'].arg_names).to eq([:bar, :ext])
    end

    it 'should pass the arguments' do
      expect($stdout).to receive(:puts).with("Namespace 'arguments' task 'foo' argument: 'xxfoobarxx'")
      Rake::Task[:arguments].invoke('xxfoobarxx')
    end
  end

  context "namespace failures" do
    it 'should stop at first fail' do
      expect($stdout).to receive(:puts).with("Namespace 'failures' task 'foo'")
      expect { Rake::Task[:failures].invoke }.to raise_error(RuntimeError, "FOO NO PLAY")
    end
  end

  context "namespace aggregate_failures" do
    it 'should stop after all tasks' do
      expect($stdout).to receive(:puts).with("Namespace 'aggregate_failures' task 'foo'")
      expect($stdout).to receive(:puts).with("Namespace 'aggregate_failures' task 'bar'")
      expect { Rake::Task[:aggregate_failure].invoke }.to raise_error(GroupedError)
    end
  end

end

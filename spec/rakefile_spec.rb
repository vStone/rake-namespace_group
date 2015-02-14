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
end

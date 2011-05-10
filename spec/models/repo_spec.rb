require 'spec_helper'

describe Repo do
  before :all do
    class Repo
      public :repo, :run_commands, :parse_output
    end
  end
  
  context 'git_create' do
    it 'should checkout a repo if it exists' do
      x = Repo.new
      git = mock(Git)
      git.should_receive(:checkout).and_return nil
      x.stub!(:repo).and_return git
      x.git_create
    end
    
    it 'should attempt to clone a repo if one doesn\'t exist' do
      x = Repo.new
      x.stub!(:id).and_return 5
      x.stub!(:repo).and_raise ArgumentError
      git = mock(Git, :checkout => nil)
      Git.should_receive(:clone).and_return git
      x.git_create
    end
  end
  
  context 'git_update' do
    it 'should do a git pull' do
      x = Repo.new
      git = mock(Git)
      git.should_receive(:pull).and_return nil
      x.stub!(:repo).and_return git
      
      x.git_update
    end
  end
  
  context 'recalculate' do
    it 'should update, run commands, and parse output' do
      x = Repo.new
      x.should_receive :git_update
      x.should_receive :run_commands
      x.should_receive :parse_output
      x.recalculate
    end
  end
  
  context 'run_commands' do
    it 'should shell out'
    
    it 'should clean the environment'
    
    it 'should collect the output'
    
    it 'should return the string output'
  end
  
  context 'parse_output' do
    pending "not sure yet"
  end
end

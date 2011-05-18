require 'spec_helper'

describe Repo do
  before :all do
    class Repo
      public :repo, :run_commands, :parse_output, :capture
    end
    system('echo test >/dev/null') #give us $?
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
  
  context 'git_cleanup' do
    it 'should do nothing if file does not exist' do
      FileUtils.should_not_receive(:rm_rf).with('foo')
      File.should_receive(:exists?).with('foo').and_return false
      x = Repo.new
      x.stub(:git_path).and_return 'foo'
      x.git_cleanup
    end
    
    it 'should rm -rf if file does exist' do
      FileUtils.should_receive(:rm_rf).with('foo').and_return []
      File.should_receive(:exists?).with('foo').and_return true
      x = Repo.new
      x.stub(:git_path).and_return 'foo'
      x.git_cleanup
    end
  end
  
  context 'recalculate' do
    it 'should update, run commands, and parse output' do
      x = Repo.new
      x.should_receive :git_update
      x.should_receive(:run_commands).and_return [1,2,3]
      x.should_receive(:parse_output).with(1,2,3)
      x.recalculate
    end
  end
  
  context 'run_commands' do
    it 'should shell out setup_command; cucumber_command' do
      x = Repo.new
      x.stub!(:setup_command).and_return 'echo foo'
      x.stub!(:cucumber_comand).and_return "echo bar"
      x.should_receive(:system).with("echo foo;echo bar").and_return ''
      x.run_commands
    end
    
    it 'should clean the environment' do
      ENV['TEST'] = 'foo'
      x = Repo.new
      x.stub!(:setup_command).and_return 'export FOO=1'
      x.stub!(:cucumber_comand).and_return "echo $TEST"
      values = x.run_commands
      values.class.should == Array
      values[1].should == ''
      ENV['TEST'].should == 'foo'
      ENV['FOO'].should be_nil
    end
    
    it 'should collect the output' do
      x = Repo.new
      x.stub!(:setup_command).and_return 'echo foo'
      x.stub!(:cucumber_comand).and_return "echo bar >&2"
      x.run_commands

      values.class.should == Array
      values[1].should == "foo\n"
      values[2].should == "bar\n"
    end
  end
  
  context 'parse_output' do
    pending "not sure yet"
  end
end

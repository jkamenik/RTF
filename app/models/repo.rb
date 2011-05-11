require 'fileutils'

class Repo < ActiveRecord::Base
  def git_create
    g = repo rescue Git.clone(repo_path, git_path)
    g.checkout('master')
  end
  
  def git_update
    r = repo
    r.pull
    Commit.find_or_create r.gcommit('HEAD')
  end
  
  def recalculate
    git_update
    parse_output *run_commands
  end
  
  def git_cleanup
    FileUtils.rm_rf git_path if File.exists? git_path
  end
  
private
  def repo
    # throws ArgumentError if the repo doesn't exist
    Git.open git_path, :log => logger
    # g = Git.clone(URI, :name => 'name', :path => '/tmp/checkout')  
  end
  
  def git_path
    File.join('repositories',id.to_s)
  end
  
  def run_commands
    commands = setup_command.split("\n")
    commands.push cucumber_comand
    
    orig_ENV = ENV.to_hash
    ENV.clear
    capture do
      system(commands.join(';'))
      $?.exitstatus
    end
  ensure
    ENV.clear
    orig_ENV.to_hash.each{ |k, v| ENV[k] = v}
  end
  
  def parse_output(status,output,error)
  end
  
  def capture(&block)
    begin
      out = $stdout
      err = $stderr
      $stdout = StringIO.new
      $stderr = StringIO.new
      status = yield
      output = $stdout.string
      error  = $stderr.string
    ensure
      $stdout = out
      $stderr = err
    end
    
    [status,output,error]
  end
end

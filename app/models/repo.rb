require 'fileutils'
require 'io'
require 'open3'

class Repo < ActiveRecord::Base
  include Io
  
  def git_create
    g = repo rescue Git.clone(repo_path, git_path)
    g.checkout('master')
  end
  
  def git_update
    r = repo
    r.pull
    # Commit.find_or_create r.gcommit('HEAD')
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
      stdin, stdout, stderr, thread  = Open3.popen3(commands.join(';'))
      stdin.close
      $stdout.print stdout.read
      $stderr.print stderr.read
      stdout.close
      stderr.close
      thread.value.exitstatus
    end
  ensure
    ENV.clear
    orig_ENV.to_hash.each{ |k, v| ENV[k] = v}
  end
  
  def parse_output(status,output,error)
  end
end

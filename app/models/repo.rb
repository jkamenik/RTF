class Repo < ActiveRecord::Base
  def git_create
    g = repo rescue Git.clone(repo_path, git_path)
    g.checkout('master')
  end
  
  def git_update
    repo.pull
  end
  
  def recalculate
    git_update
    parse_output run_commands
  end
  
  def git_cleanup
    
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
  end
  
  def parse_output(output)
  end
end

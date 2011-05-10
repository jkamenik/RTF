class CreateRepos < ActiveRecord::Migration
  def self.up
    create_table :repos do |t|
      t.string :name
      t.string :branch, :default => 'master'
      t.text :repo_path
      t.text :setup_command
      t.text :cucumber_comand

      t.timestamps
    end
  end

  def self.down
    drop_table :repos
  end
end

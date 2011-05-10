class CreateCommits < ActiveRecord::Migration
  def self.up
    create_table :commits do |t|
      t.string :commit_id
      t.string :author
      t.text :message
      t.date :commit_date

      t.timestamps
    end
  end

  def self.down
    drop_table :commits
  end
end

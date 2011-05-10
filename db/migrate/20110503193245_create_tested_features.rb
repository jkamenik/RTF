class CreateTestedFeatures < ActiveRecord::Migration
  def self.up
    create_table :tested_features do |t|
      t.integer :commit_id
      t.string :test_type
      t.integer :features_total
      t.integer :features_passing

      t.timestamps
    end
  end

  def self.down
    drop_table :tested_features
  end
end

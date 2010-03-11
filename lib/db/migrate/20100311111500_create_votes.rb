class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|
      t.boolean :vote
      t.integer :candidate_id
      t.string  :candidate_type
      t.integer :voter_id
      t.string  :voter_type
    end
  end
  
  def self.down
    drop_table :votes
  end
end
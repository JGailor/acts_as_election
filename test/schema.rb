ActiveRecord::Schema.define(:version => 0) do
  create_table :votes, :force => true do |t|
    t.boolean :vote
    t.integer :context_id
    t.string  :context_type
    t.integer :voter_id
    t.string :voter_type
  end
  
  create_table :voteables, :force => true do |t|
    t.string :name
  end
  
  create_table :other_voteables, :force => true do |t|
    t.string :name
  end
  
  create_table :users, :force => true do |t|
    t.string :name
  end
end
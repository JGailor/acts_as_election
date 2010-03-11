class Vote < ActiveRecord::Base
  belongs_to :context, :polymorphic => true
  belongs_to :voter, :polymorphic => true
  named_scope :up_votes, :conditions => {:vote => true}
  named_scope :down_votes, :conditions => {:vote => false}
end
require 'test_helper'

class ActsAsElectionTest < ActiveSupport::TestCase
  load_schema
  class Voter < ActiveRecord::Base
   acts_as_voter
  end
  class Voteable < ActiveRecord::Base
   acts_as_candidate
  end  

  test "acts_as_candidate should give the ability to vote on a model" do
    voteable = Voteable.create!(:name => "Voteable 1")
    voteable.vote_for(true)
    assert_equal 1, voteable.votes.size
  end
end

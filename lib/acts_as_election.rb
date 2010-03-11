require 'acts_as_election/vote'

module ActiveRecord
  module Acts
    module Election
      def self.included(base)
        base.extend(ClassMethods)
      end
      
      module ClassMethods
        def acts_as_candidate
          has_many :votes, :as => :candidate
          include ActiveRecord::Acts::Election::InstanceMethods
        end
        
        def acts_as_voter
          has_many :votes, :as => :voter
        end
      end
      
      module InstanceMethods
        def vote_for(up_or_down)
          self.votes << Vote.new(:vote => up_or_down)
        end
      end
    end
  end
end

ActiveRecord::Base.send(:include, ActiveRecord::Acts::Election)
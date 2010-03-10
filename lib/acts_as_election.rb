module ActiveRecord
  module Acts
    module Election
      def self.included(base)
        base.extend(ClassMethods)
      end
      
      module ClassMethods
        def acts_as_candidate
          include ActiveRecord::Acts::VotedOn::InstanceMethods
        end
      end
      
      module InstanceMethods
        def vote_up
          puts "I have been voted up!"
        end
      end
    end
  end
end

ActiveRecord::Base.send(:include, ActiveRecord::Acts::VotedOn)
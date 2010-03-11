%w{ models }.each do |dir|
   path = File.join(File.dirname(__FILE__), 'app', dir)  
   $LOAD_PATH << path 
   ActiveSupport::Dependencies.load_paths << path 
   ActiveSupport::Dependencies.load_once_paths.delete(path) 
end 

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
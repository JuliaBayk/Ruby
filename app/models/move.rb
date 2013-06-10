class Move < ActiveRecord::Base
 belongs_to :note
 attr_accessible :player, :all, :take, :Note_id
end

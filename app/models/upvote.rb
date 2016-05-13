class Upvote < ActiveRecord::Base
  belongs_to :downvotable, polymorphic: true
  belongs_to :filosofer

  validates :filosofer_id, presence: true, numericality: {only_integer: true}
end

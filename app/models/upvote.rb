class Upvote < ActiveRecord::Base
  belongs_to :upvotable, polymorphic: true
  belongs_to :filosofer

  validates :filosofer_id, presence: true,
    numericality: {only_integer: true},
    uniqueness: {scope: :upvotable}
end

class Pondering < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :upvotes, as: :upvotable
  has_many :downvotes, as: :downvotable
  has_many :theories
  belongs_to :filosofer
end

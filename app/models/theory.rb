class Theory < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :upvotes, as: :upvotable
  has_many :downvotes, as: :downvotable
  belongs_to :pondering
  belongs_to :filosofer
end

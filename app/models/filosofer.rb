class Filosofer < ActiveRecord::Base
  has_many :ponderings
  has_many :theories
  has_many :comments
  has_many :upvotes
  has_many :downvotes
end

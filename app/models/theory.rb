class Theory < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :upvotes, as: :upvotable
  has_many :downvotes, as: :downvotable
  belongs_to :pondering
  belongs_to :filosofer

  #validates :filosofer_id, presence: true, numericality: {only_integer: true}
  #validates :pondering_id, presence: true, numericality: {only_integer: true}
  validates :body, presence: true, length: {in: 2..2000}
  #validates :best_theory, presence: true
end

class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :filosofer

  validates :body, present: true, length: {in: 2..500}
  validates :filosofer_id, present: true, numericality: {only_integer: true}
end

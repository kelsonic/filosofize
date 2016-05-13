class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :filosofer

  validates :body, presence: true, length: {in: 2..500}
  # validates :filosofer_id, presence: true, numericality: {only_integer: true}
end

class Filosofer < ActiveRecord::Base
  has_many :ponderings
  has_many :theories
  has_many :comments
  has_many :upvotes
  has_many :downvotes

  validates :first_name, presence: true, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }, length: {in: 2..200}
  validates :last_name, presence: true, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }, length: {in: 2..200}
  validates :username, presence: true, length: {in: 2..200}
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
    message: "enter a real email address" }

  has_secure_password
end

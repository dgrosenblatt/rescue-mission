class Answer < ActiveRecord::Base
  validates :description, presence: true, length: { minimum: 50 }
  validates :user_id, presence: true

  belongs_to :question
  belongs_to :user
end

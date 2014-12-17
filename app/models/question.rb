class Question < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 40, maximum: 255 }
  validates :description, presence: true, length: { minimum: 150 }

  has_many :answers, dependent: :destroy
end

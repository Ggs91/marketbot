class Response < ApplicationRecord
  belongs_to :question
  belongs_to :completion
  has_and_belongs_to_many :answers
end

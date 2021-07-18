class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :completion, optional: true
  has_and_belongs_to_many :responses
end

class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :completion, optional: true
end

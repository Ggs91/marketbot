require 'activerecord-reset-pk-sequence'

Completion.destroy_all
Message.destroy_all
User.destroy_all
Chatroom.destroy_all
Bot.destroy_all
Answer.destroy_all
Question.destroy_all
Questionnaire.destroy_all

Completion.reset_pk_sequence
Message.reset_pk_sequence
User.reset_pk_sequence
Chatroom.reset_pk_sequence
Bot.reset_pk_sequence
Answer.reset_pk_sequence
Question.reset_pk_sequence
Questionnaire.reset_pk_sequence


# Questionnaire 1
questionnaire_1 = Questionnaire.create!(
  presentation: 'We would like to ask you a few questions about your last shopping session.'
)

q1 = questionnaire_1.questions.create!(
  name: 'How many items did you buy?',
  question_type: 0
)

q2 = questionnaire_1.questions.create!(
  name: 'Which items of the list below did you buy?',
  question_type: 1
)

q3 = questionnaire_1.questions.create!(
  name: 'Are you happy with what you bought?',
  question_type: 2
)

q1.answers.create!([
  {name: '0'},
  {name: '1 to 3'},
  {name: '4 or more'}
])

q2.answers.create!([
  {name: 'Shoes'},
  {name: 'Pants'},
  {name: 'Sunglasses'}
])


q3.answers.create!

# Questionnaire 2
questionnaire_2 = Questionnaire.create!(
  presentation: 'We would like to ask you a few questions about your shopping habits.'
)

q4 = questionnaire_2.questions.create!(
  name: 'How often do you go shopping in a  year?',
  question_type: 0
)

q5 = questionnaire_2.questions.create!(
  name: 'Where do you usually go shopping?',
  question_type: 1
)

q6 = questionnaire_2.questions.create!(
  name: 'Do you schedule your shopping sessions?',
  question_type: 2
)

q4.answers.create!([
  {name: 'Less than once a year'},
  {name: '1 to 2 times a year'},
  {name: 'More than 3 times a year'}
])

q5.answers.create!([
  {name: 'On the internet'},
  {name: 'At the mall'},
  {name: 'Anywhere'}
])

q6.answers.create!

puts "#{Questionnaire.all.size} Questionnaires created"
puts "#{Question.all.size} Questions created"
puts "#{Answer.all.size} Answers created"

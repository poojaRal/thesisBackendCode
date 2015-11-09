# Question text for  items
class Question < ActiveRecord::Base
  self.table_name = 'questions'

  # relationship with question answers and questions
  has_many :question_answers
  has_many :answers, through: :question_answers, :uniq => true

  # relationship with items and form types
  has_many :item_types
  has_many :form_types, through: :item_types, :uniq => true

  # relationship with selected answers and form instances
  has_many :selected_answers
  has_many :form_instnances, through: :selected_answers, :uniq => true

  def self.create_new(text, type)
    question = Question.new

    question.text = text
    question.qtype = type

    question.save!
  end
end

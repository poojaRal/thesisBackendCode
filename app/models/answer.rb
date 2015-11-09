# Answer text to be linked to a question
class Answer < ActiveRecord::Base
  self.table_name = 'answers'

  # relationship with question through question answer join table
  has_many :question_answers
  has_many :questions, through: :question_answers, :uniq => true
  
  # relationsip with form instances through selected answers
  has_many :selected_answers
  has_many :form_instances, -> { where uniq: true }, through: :selected_answers

  def self.create_new(text)
    answer = Answer.new

    answer.text = text

    answer.save!
  end
end

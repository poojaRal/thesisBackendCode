# Mapping answer ids to question ids
class QuestionAnswer < ActiveRecord::Base
  self.table_name = 'question_answers'

  # relationships
  belongs_to :question
  belongs_to :answer

  def self.create_new(qid, aid)
    question_answer = QuestionAnswer.new

    question_answer.question_id = qid
    question_answer.answer_id = aid

    question_answer.save!
  end
end

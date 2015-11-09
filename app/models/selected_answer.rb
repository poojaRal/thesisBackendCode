# Instance of an answer for a question on a form instance
class SelectedAnswer < ActiveRecord::Base
  self.table_name = 'selected_answers'

  # Creating a three way join between form instance, question, answer
  belongs_to :form_instance
  belongs_to :question
  belongs_to :answer

  def self.create_new(fid, qid, aid, ansTs, prevTs, nextTs)
    sa = SelectedAnswer.new

    sa.form_instance_id = fid
    sa.question_id = qid
    sa.answer_id = aid
    sa.answer_submission_time = ansTs
    sa.prevBtnTs = prevTs
    sa.nextBtnTs = nextTs

    sa.save!
  end
end

# An item is a specific question within an form
class ItemType < ActiveRecord::Base
  self.table_name = 'item_types'

  # relationship between item and question
  belongs_to :question

  # relationship between item and form
  belongs_to :form_type

  def self.create_new(fid, qid, order)
    item = ItemType.new

    item.form_type_id = fid
    item.question_id = qid
    item.question_order = order

    item.save!
  end
end

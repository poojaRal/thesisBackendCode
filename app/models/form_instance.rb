# Patient instance of an form
class FormInstance < ActiveRecord::Base
  self.table_name = 'form_instances'

  # relationship with selected answers, answers, and questions
  has_many :selected_answers

  # relationship between form instance and forms
  belongs_to :form_type
  belongs_to :patient

  def self.create_new(patient, fid, start, finish, comp)
    fi = FormInstance.new

    fi.patient_id = patient
    fi.form_type_id = fid
    fi.start_time = start
    fi.end_time = finish
    fi.completed = comp

    fi.save!
    return fi
  end
end

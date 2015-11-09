class DashboardController < ApplicationController
  require 'time'
  include FormInstanceHelper
  before_filter :authenticate_user!

  # Action to build objects for the html page and then render it
  def show
    # The purpose of this block is to build two lists of trials, one being the
    # trials that a clinician manages, the other being trials that they are
    # just participating in. It removes duplicates from the watching list, if
    # they are in the managed list.
    managed = current_user.clinical_trials
    excludes = managed.pluck(:id)

    tcids = current_user.trial_clinicians.pluck(:clinical_trial_id)

    if tcids.empty?
      watching = []
    else
      watching = ClinicalTrial.where('id in (?)', tcids)
      if !excludes.empty?
        watching = watching.where('id not in (?)', excludes)
      end
    end

    @managed_list = managed
    @watching_list = watching
  end

  # Action to activate a pin for a trial and to render javascript to the client
  # in orderto use ajax to update page.
  def activate_pin
    trialid = params[:trial]
    @trial = ClinicalTrial.find(trialid)

    patient = DashboardHelper.activate_pin(@trial)

    if patient.nil?
      @pin = 'Pin could not be found'
      @stime = ''
      @etime = ''
    else

      @pin = patient.pin
      @stime = patient.date_started
      @etime = patient.date_completed
    end

    respond_to do |format|
      format.js
    end
  end

  # Action to advance stages for a patient
  # TODO have this use ajax to update page.
  def advance_stage
    puts 'Inside advance stage in dashboard controller'
    patient_id = params[:patient]
    patient = Patient.find(patient_id)

    if patient.nil?
      #
    else
      puts 'calling dashboardHelper function'
      DashboardHelper.advance_stage(patient)
    end
  end

  private

  def patient_params
    params.require(:patient).permit(:PIN)
  end
end

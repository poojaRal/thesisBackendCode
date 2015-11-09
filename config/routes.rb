PainReportPortal::Application.routes.draw do

  devise_for :users, controllers: {registrations: 'admin', sessions: 'login'}

  get 'dashboard/show'

  # activate a pin
  get 'activate_pin', to: 'dashboard#activate_pin', as: :activate

  # advance stage
  get 'advance_stage', to: 'dashboard#advance_stage', as: :advance

  # check clinical trials with patient pin
  get 'check_surveys', to: 'clinical_trial#check_surveys'

  # retrieve survey instance using instanceID
  get 'get_survey', to:'form_instance#get_survey'

  # submit answers to a survey instance
  post 'submit_survey', to:'form_instance#submit_survey'

  devise_scope :user do
    get 'sign_in', to: 'login#new'
    post 'sign_in', to: 'login#create'
    delete 'sign_out', to: 'login#destroy'
    get 'admin/sign_up', to: 'admin#new'
    post 'admin/sign_up', to: 'admin#create'
  end

  authenticated :user do
    devise_scope :user do
      root to: 'dashboard#show', as: 'authenticated_root'
    end
  end

  unauthenticated do
    devise_scope :user do
      root to: 'dashboard#show', as: 'unauthenticated_root'
    end
  end
end

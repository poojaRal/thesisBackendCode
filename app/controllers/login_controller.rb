class LoginController < Devise::SessionsController
  prepend_before_filter :require_no_authentication, only: [:new, :create]
  prepend_before_filter :allow_params_authentication!, only: :create
  prepend_before_filter only: [:create, :destroy] { request.env['devise.skip_timeout'] = true }

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    super
  end

  # GET /resource/edit
  def edit
    super
  end

  def update
    super
  end

  # DELETE /resource
  def destroy
    super
  end

  def show
  end

  protected

  def sign_in_params
    devise_parameter_sanitizer.sanitize(:sign_in)
  end

  def serialize_options(resource)
    methods = resource_class.authentication_keys.dup
    methods = methods.keys if methods.is_a?(Hash)
    methods << :password if resource.respond_to?(:password)
    { methods: methods, only: [:password] }
  end

  def auth_options
    { scope: resource_name, recall: "#{controller_path}#new" }
  end
end

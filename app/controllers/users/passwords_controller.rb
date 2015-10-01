class Users::PasswordsController < Devise::PasswordsController

  layout 'no_menu', only: [:new, :edit, :update, :create]

  # GET /resource/password/new
  # def new
  #  super
  # end

  # POST /resource/password
  # def create
  #   super
  # end

  # GET /resource/password/edit?reset_password_token=abcdef
  def edit

    # verificando se o token para resetar o password é válido
    if (!User.valid_token(params['reset_password_token'], :reset_password_token))
      message = t('.invalid_token')
      message[':url'] = url_for new_user_password_path
      flash[:warning] = message

      redirect_to new_user_session_path
    end

    super
  end

  # PUT /resource/password
  # def update
  #   super
  # end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  def after_sending_reset_password_instructions_path_for resource_name
    flash[:success] = t 'devise.confirmations.change_password_instructions'

    super resource_name
  end
end

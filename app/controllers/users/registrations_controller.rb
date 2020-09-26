# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @user = User.new
  end

  # POST /resource
  def create
    @user = User.new(sign_up_params)
    if @user.valid?
      profile = params[:profile]
      submit = params[:submit]

      if profile.present?
        session["devise_regist_data"] = {user: @user.attributes}
        session["devise_regist_data"][:user]["password"] = params[:user][:password]
        @profile = @user.build_profile
        return render :new_profile
      end

      if submit.present?
        @user.save
        sign_in(:user, @user)
        return redirect_to root_path
      end
    else
      render :new
    end
  end

  def new_profile
    @profile = Profile.new
  end

  def create_profile
    if session["devise_regist_data"].present?
      @user = User.new(session["devise_regist_data"]["user"])
      @profile = Profile.new(profile_params)
      if @profile.valid?
        @user.build_profile(@profile.attributes)
        @user.save
        session["devise_regist_data"].clear
        sign_in(:user, @user)
        return redirect_to root_path
      else
        render :new_profile
      end
    else
      @profile = Profile.new(profile_params)
      if @profile.valid?
        @profile.user_id = current_user.id
        @profile.save
        return redirect_to root_path
      else
        render :new_profile
      end
    end
  end

  def edit
    if current_user.profile.present?
      @profile = Profile.find_by(user_id: current_user.id)
    else
      @profile = Profile.new
    end
  end

  def update
    Profile.find_by(user_id: current_user.id)
    if @profile = Profile.update(profile_params)
      redirect_to root_path and return
    else
      render :edit
    end
  end

  protected
  def profile_params
    params.require(:profile).permit(:postal, :prefecture_id, :city, :house_number, :building, :phone_number)
  end


  # protected
  # def after_sign_up_path_for(resource)
  #   items_index_path
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end

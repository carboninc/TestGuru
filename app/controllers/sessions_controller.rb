class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to tests_path
    else
      flash.now[:alert] = 'Вы Гуру? Пожалуйста, укажите свой email и пароль'
      render :new
    end
  end

  def logout
    reset_session
    redirect_to root_path
  end
end

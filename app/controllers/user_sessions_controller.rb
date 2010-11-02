class UserSessionsController < ApplicationController
 layout 'login'

  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy



  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Bienvenido Usted se ha logueado con Éxito"
      redirect_back_or_default account_url
    else
      render :action => :newted
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = "La sesión ha sido cerrada"
    redirect_back_or_default new_user_session_url
  end



  end



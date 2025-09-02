# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!, unless: :devise_controller?

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate_user!
    redirect_to new_user_session_path unless current_user
  end

  def authorize_user!(resource)
    head :forbidden unless resource.user == current_user
  end

  def set_current_user
    Current.user = current_user
  end
end
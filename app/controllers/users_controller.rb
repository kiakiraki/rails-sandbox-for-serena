# frozen_string_literal: true

# UsersController: CRUD for users in the web UI
class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :authorize_user!, only: %i[edit update destroy]

  def index
    @users = User.includes(:posts)
                 .page(params[:page])
                 .per(10)

    @users = @users.by_name(params[:search]) if params[:search].present?
    @users = @users.adults if params[:adults_only] == 'true'
  end

  def show
    @recent_posts = @user.recent_posts(3)
  end

  def new
    @user = User.new
  end

  def edit
    # Template will be rendered
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: t('users.notice.created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: t('users.notice.updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: t('users.notice.deleted')
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.expect(user: %i[name email age bio])
  end

  def authorize_user!
    super(@user)
  end
end

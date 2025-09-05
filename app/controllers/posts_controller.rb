# frozen_string_literal: true

# PostsController: CRUD for posts in the web UI
class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :set_user, only: %i[index new create]
  before_action :authorize_user!, only: %i[edit update destroy]

  def index
    @posts = if @user
               @user.posts.includes(:comments)
             else
               Post.includes(:user, :comments).published
             end

    @posts = @posts.page(params[:page]).per(10)
  end

  def show
    @comments = @post.comments.approved.includes(:user)
    @new_comment = Comment.new
  end

  def new
    @post = @user.posts.build
  end

  def edit
    # Template will be rendered
  end

  def create
    @post = @user.posts.build(post_params)

    if @post.save
      redirect_to [@user, @post], notice: t('posts.notice.created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: t('posts.notice.updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    user = @post.user
    @post.destroy
    redirect_to user_posts_path(user), notice: t('posts.notice.deleted')
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id]) if params[:user_id]
  end

  def post_params
    params.expect(post: %i[title content status])
  end

  def authorize_user!
    head :forbidden unless @post.can_be_edited_by?(current_user)
  end
end

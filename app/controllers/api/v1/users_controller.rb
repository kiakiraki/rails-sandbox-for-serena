# frozen_string_literal: true

module Api
  module V1
    class UsersController < BaseController
      before_action :set_user, only: [:show]

      def index
        @users = User.includes(:posts)
                     .page(params[:page])
                     .per(params[:per_page] || 20)

        render json: {
          users: @users.map(&method(:user_json)),
          meta: pagination_meta(@users)
        }
      end

      def show
        render json: {
          user: user_json(@user, include_details: true)
        }
      end

      private

      def set_user
        @user = User.find(params[:id])
      end

      def user_json(user, include_details: false)
        base_data = {
          id: user.id,
          name: user.name,
          email: user.email,
          age: user.age,
          created_at: user.created_at,
          updated_at: user.updated_at
        }

        if include_details
          base_data.merge({
            posts_count: user.posts.count,
            recent_posts: user.recent_posts(3).map(&method(:post_json))
          })
        else
          base_data
        end
      end

      def post_json(post)
        {
          id: post.id,
          title: post.title,
          excerpt: post.excerpt,
          status: post.status,
          created_at: post.created_at
        }
      end
    end
  end
end
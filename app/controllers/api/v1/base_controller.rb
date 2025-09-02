# frozen_string_literal: true

module Api
  module V1
    class BaseController < ApplicationController
      skip_before_action :verify_authenticity_token
      before_action :set_default_format

      rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
      rescue_from ActionController::ParameterMissing, with: :parameter_missing

      private

      def set_default_format
        request.format = :json
      end

      def record_not_found(exception)
        render json: {
          error: "Record not found",
          message: exception.message
        }, status: :not_found
      end

      def parameter_missing(exception)
        render json: {
          error: "Parameter missing",
          message: exception.message
        }, status: :bad_request
      end

      def pagination_meta(collection)
        {
          current_page: collection.current_page,
          total_pages: collection.total_pages,
          total_count: collection.total_count,
          per_page: collection.limit_value
        }
      end
    end
  end
end
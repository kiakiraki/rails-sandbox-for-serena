# frozen_string_literal: true

# PagesController: static pages with simple ERB examples
class PagesController < ApplicationController
  def about
    @frameworks = %w[Rails Hanami Sinatra]
  end

  def contact
    @contact_methods = %w[Email Phone Chat]
  end

  def create_contact
    redirect_to contact_path, notice: t('pages.notice.contact_sent')
  end
end

class LinksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    data = params[:url]
    Link.create!(
      original_url: data,
      short_url: generate_short_url
    )
  end

  # def check_url
  #   Link.exists?(params[:url])
  # end

  def generate_short_url
    short_url = SecureRandom.urlsafe_base64[0..6]
    short_url
  end
end

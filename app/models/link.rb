class Link < ApplicationRecord
  before_create :generate_short_url

  validates :original_url, :url => true

  def generate_short_url
    begin
      generate_url = SecureRandom.urlsafe_base64
      if short_url 
        unless short_url_already_exists?
          # require 'pry'; binding.pry
          return false
        else
          self.short_url = short_url
        end
      else
        self.short_url = generate_url[0...6]
      end
    end while self.class.exists?(short_url: short_url)
  end

  def short_url_already_exists?
    Link.find_by(short_url: short_url).nil? ? true : false 
  end
end

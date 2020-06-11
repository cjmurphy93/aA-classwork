# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  long_url   :string           not null
#  short_url  :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'securerandom'

class ShortenedUrl < ApplicationRecord
    validates :short_url, presence: true, uniqueness: true
    validates :long_url, presence: true
    
    def self.random_code
       url = SecureRandom.urlsafe_base64
        until !ShortenedUrl.exists?(short_url: url)
            url = SecureRandom.urlsafe_base64
        end
        url
    end

    def self.create_from_user!(user, long_url)
        ShortenedUrl.create!(
        user_id: user.id,
        long_url: long_url,
        short_url: ShortenedUrl.random_code

        )
    end
end
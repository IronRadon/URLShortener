class ShortenedUrl < ActiveRecord::Base
  attr_accessible :long_url, :short_url, :submitter_id
  validates :long_url, :short_url, :submitter_id, presence: true
  validates :short_url, uniqueness: true

  belongs_to(:submitter,
             :primary_key => :id,
             :foreign_key => :submitter_id,
             :class_name => 'User')

  def self.random_code
    while(true)
      short_url = SecureRandom.urlsafe_base64[0..15]
      break if self.where(:short_url => short_url).empty?
    end
    short_url
  end

  def self.create_for_user_and_long_url!(user, long_url)
    self.create!(
      :short_url => self.random_code,
      :long_url => long_url,
      :submitter_id => user.id
    )
  end
end
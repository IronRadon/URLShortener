class ShortenedURL < ActiveRecord::Base

  validates :long_url, :short_url, :submitter_id, presence: true
  validates :long_url, :short_url, uniqueness: true

end
class User < ActiveRecord::Base
  attr_accessible :email
  validates :email, uniqueness: true, presence: true

  has_many(:submitted_urls,
           :primary_key => :id,
           :foreign_key => :submitter_id,
           :class_name => 'ShortenedUrl')
end
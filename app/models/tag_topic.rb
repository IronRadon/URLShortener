class TagTopic < ActiveRecord::Base
  attr_accessible :name
  validates :name, :presence => true, :uniqueness => true

  has_many(:taggings
           :primary_key => :id,
           :foreign_key => :tag_topic_id,
           :class_name => 'Tagging')

  has_many :shortened_urls, :through => :taggings, :source => :shortened_url
end
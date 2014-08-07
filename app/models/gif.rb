class Gif < ActiveRecord::Base
  acts_as_ordered_taggable

  validates :title,     presence: true
  validates :url,       presence: true, uniqueness: true, url:true
  validates :tag_list,  presence: true
end


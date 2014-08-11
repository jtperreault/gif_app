FactoryGirl.define do
  factory :gif do
    title     "Gif"
    sequence(:url) { |n| "http://www.example.com/gifs/gif_#{n}.gif" }
    tag_list  "Tag1, Tag2, Tag3"
  end
end


FactoryGirl.define do
  factory :gif do
    sequence(:title) { |n| "Gif#{n}" }
    sequence(:url)   { |n| "http://www.example.com/gifs/#{title}.gif" }
    tag_list         "Tag1, Tag2, Tag3"
  end
end

require 'rails_helper'

describe Gif do
  context 'is invalid' do

    it "without a tag" do
      expect(build(:gif, tag_list: nil)).to be_invalid
    end

    it "without a title" do
      expect(build(:gif, title: nil)).to be_invalid
    end

    it "without a valid URL" do
      expect(build(:gif, url: nil)).to be_invalid
      expect(build(:gif, url: 'not_a_valid_url/some/path/example.gif')).to be_invalid
      expect(build(:gif, url: 'notvalid.com/some/path/example.gif')).to be_invalid
    end

    it "if URL exists" do
      create(:gif, url: 'http://www.example.com/images/something.gif')
      expect(build(:gif, url: 'http://www.example.com/images/something.gif')).to be_invalid
    end

  end

  it "returns gifs by tags" do
    gif1 = create(:gif, tag_list: "Tag1, Tag3, Tag6, Tag8")
    gif2 = create(:gif, tag_list: "Tag2, Tag3, Tag7, Tag8")
    expect(Gif.tagged_with("Tag3, Tag8")).to include(gif1, gif2)
  end

end

class SearchController < ApplicationController
  helper FormattedLinkedTags

  def index
    @latest_tags = []

    # This N+1 querying is not ideal, at all.
    # acts_as_taggable_on does not supporting eager loading yet:
    # https://github.com/mbleigh/acts-as-taggable-on/issues/91
    recent_gifs.each do |gif|
      tag = gif.tags.sample
      @latest_tags.push tag unless @latest_tags.include?(tag)
    end
  end

  def search
    @search_params = quotify_search_params
    @gifs = Gif.tagged_with(params['tags'])
  end

  private

  def quotify_search_params
    parse_tag_params.map { |tag| tag = "\"#{tag}\"" }
  end

  def parse_tag_params
    ActsAsTaggableOn::TagListParser.parse(params['tags'])
  end

  def recent_gifs
    Gif.order(updated_at: :desc).limit(5)
  end
end

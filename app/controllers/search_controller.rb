class SearchController < ApplicationController
  def index
  end

  def search
    @search_params = quotify_search_terms
    @gifs = Gif.tagged_with(params['tags'])
  end

  private

  def quotify_search_terms
    ActsAsTaggableOn::TagListParser.parse(params['tags']).map { |tag| tag = "\"#{tag}\"" }
  end
end

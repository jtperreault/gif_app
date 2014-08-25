module FormattedLinkedTags
  def format_tag_list_as_links(tags)
    links = []
    tags.each do |t|
      links.push link_to t.name, search_path(tags: t.name, utf8: '✓')
    end
    links
  end
end

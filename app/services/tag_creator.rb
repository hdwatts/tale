class TagCreator

  def self.create_tags(tag_params, the_tale)
    tag_params.each do |tag|
      new_tag = Tag.find_or_create_by(name: tag)
      the_tale.tags << new_tag
    end
  end
end
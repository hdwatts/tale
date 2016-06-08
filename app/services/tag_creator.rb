class TagCreator

  def self.create_tags(tag_params, tale)
    tag_params.each { |tag| tale.tags << Tag.find_or_create_by(name: tag) }
  end
end
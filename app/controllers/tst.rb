class FormBuilder
  def initialize(object)
    @object = object
  end

  def collection_select(attribute, collection, value_method, text_method)
    options = ''
    collection.each do |item|
      # když value_method = :name
      # item.name <=> item.send(:name) <=> item.send(value_method)
      value = item.send(value_method)
      text = item.send(text_method)
    end
  end
end

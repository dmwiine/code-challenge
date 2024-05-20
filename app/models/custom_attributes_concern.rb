module CustomAttributesConcern
  extend ActiveSupport::Concern

  included do
    has_many :custom_attributes, as: :attributable
  end

  # Method to get custom attribute value
  def get_custom_attribute(attribute_name, object)
    custom_attribute = custom_attributes.find_by(name: attribute_name, attributable_type: object.class.to_s, attributable_id: object.id)
    custom_attribute.value if custom_attribute
  end

  # Method to set custom attribute value
  def set_custom_attribute(attribute_name, value, object)
    custom_attribute = custom_attributes.find_or_initialize_by(name: attribute_name, attributable_type: object.class.to_s, attributable_id: object.id)
    custom_attribute.value = value
    custom_attribute.save
  end

  # Method to delete custom attribute
  def delete_custom_attribute(attribute_name, object)
    custom_attributes.find_by(name: attribute_name, attributable_type: object.class.to_s, attributable_id: object.id)&.destroy
  end
  
end
  

require 'test_helper'

class CustomAttributesConcernTest < ActiveSupport::TestCase
  def setup
    @customer = DummyCustomer.create(name: 'Test Customer')

  end

  def test_concern_inclusion
    assert_includes DummyCustomer.included_modules, CustomAttributesConcern
  end

  def test_association_with_custom_attributes
    association = DummyCustomer.reflect_on_association(:custom_attributes)
    
    assert_equal :has_many, association.macro
    assert_equal :attributable, association.options[:as]
  end

  def test_get_custom_attribute_returns_value
    @customer.set_custom_attribute('email', 'test@example.com')
    assert_equal 'test@example.com', @customer.get_custom_attribute('email')
  end

  def test_get_custom_attribute_returns_nil_for_non_existent_attribute
    assert_nil @customer.get_custom_attribute('phone')
  end

  def test_set_custom_attribute_creates_new_attribute
    @customer.set_custom_attribute('email', 'test@example.com')
    assert_equal 1, @customer.custom_attributes.length
  end

  def test_set_custom_attribute_updates_existing_attribute_value
    @customer.set_custom_attribute('email', 'test@example.com')
    @customer.set_custom_attribute('email', 'updated@example.com')
    assert_equal 'updated@example.com', @customer.custom_attributes.find_by(name: 'email').value
  end

  def test_delete_custom_attribute_removes_attribute
    @customer.set_custom_attribute('email', 'test@example.com')
    @customer.delete_custom_attribute('email')
    assert_equal 0, @customer.custom_attributes.length
  end
end

class DummyCustomer < ActiveRecord::Base
    self.table_name = 'customers'
  
    include CustomAttributesConcern
end


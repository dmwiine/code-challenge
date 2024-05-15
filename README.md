# README

### Here's a detailed description of my solution:

Created a migration to set up the custom attribute table. This table will store the custom attributes for all the models.

Created a CustomAttribute model that represents the custom attributes table.
Established associations between the CustomAttribute model and all the relevant models using polymorphic associations.

Defined a concern that allows the models to easily access and manipulate custom attributes.
Created methods within the concern to `retrieve`, `update`, and `delete` custom attributes.
The implementation allows each partner to specify custom attributes for their models dynamically. Partners can set and retrieve custom attributes using the `get_custom_attribute` and `set_custom_attribute` methods. The custom attributes are stored in the `custom_attributes` table with polymorphic associations.


Wrote tests for the concern to ensure the custom attributes are working as expected. I created a dummy customer to help test the behaviour of an external model accessing the concern.

Utilized SQLite as the db for the solution to ensure that the implementation accommodates that specific requirement.

### To setup the solution:
Run:
* `bundle install`
* `rails db:migrate`
### To run the tests:
* Run `rails test`

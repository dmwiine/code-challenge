class CreateCustomAttributes < ActiveRecord::Migration[7.0]
  def change
    create_table :custom_attributes do |t|
      t.string :name
      t.string :value
      t.integer :attributable_id
      t.string :attributable_type

      t.timestamps
    end
  end
end

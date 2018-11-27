  class CreateInstruments < ActiveRecord::Migration[5.2]
  def change
    create_table :instruments do |t|
      t.string :name
      t.text :description
      t.string :location
      t.float :price
      t.string :category
      t.string :picture
      t.references :user

      t.timestamps
    end
  end
end

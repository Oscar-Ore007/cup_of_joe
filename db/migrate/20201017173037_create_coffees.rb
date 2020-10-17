class CreateCoffees < ActiveRecord::Migration[6.0]
  def change
    create_table :coffees do |t|
      t.string :flavor
      t.string :description

      t.timestamps
    end
  end
end

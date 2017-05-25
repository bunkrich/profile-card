class CreateBumblebees < ActiveRecord::Migration
  def change
    create_table :bumblebees do |t|
      t.string :name
      t.string :job, null: false

      t.timestamps null: false
    end
  end
end

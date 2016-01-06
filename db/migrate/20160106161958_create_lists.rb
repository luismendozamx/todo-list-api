class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :title, default: ""

      t.timestamps null: false
    end
  end
end
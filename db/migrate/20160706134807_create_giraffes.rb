class CreateGiraffes < ActiveRecord::Migration
  def change
    create_table :giraffes do |t|
      t.string :first_name
      t.string :last_name
      t.text :image
      t.string :city
      t.date :dob
      t.text :occupation
      t.text :fav_food
      t.text :hobby
      t.text :bm_contribution
      t.text :fav_bm_memory
      t.text :anything_else
      t.timestamps
    end
  end
end

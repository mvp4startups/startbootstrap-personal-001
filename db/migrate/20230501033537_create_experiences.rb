class CreateExperiences < ActiveRecord::Migration[7.0]
  def change
    create_table :experiences do |t|
      t.integer :start_year
      t.integer :end_year
      t.string :title
      t.string :company
      t.string :city_state
      t.text :description

      t.timestamps
    end
  end
end

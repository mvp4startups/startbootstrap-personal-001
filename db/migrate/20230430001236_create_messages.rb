class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.string :full_name
      t.string :email
      t.string :phone
      t.text :body

      t.timestamps
    end
  end
end

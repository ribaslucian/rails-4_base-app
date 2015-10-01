class CreateSellers < ActiveRecord::Migration
  def change
    create_table :sellers do |t|
      t.string :name, limit: 92
      t.string :corporate, limit: 92
      t.string :cnpj, null: false, unique: true

      t.timestamps null: false
    end
  end
end

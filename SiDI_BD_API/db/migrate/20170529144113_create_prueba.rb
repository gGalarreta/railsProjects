class CreatePrueba < ActiveRecord::Migration[5.0]
  def change
    create_table :prueba do |t|
      t.string :nombre
      t.string :desc

      t.timestamps
    end
  end
end

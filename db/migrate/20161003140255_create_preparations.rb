class CreatePreparations < ActiveRecord::Migration[5.0]
  def change
    create_table :preparations do |t|
      t.references :ingredient, foreign_key: true
      t.references :recipe, foreign_key: true
      t.string :method

      t.timestamps
    end
  end
end

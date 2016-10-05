class CreateCoursesRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :courses_recipes do |t|
      t.references :recipe, foreign_key: true
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end

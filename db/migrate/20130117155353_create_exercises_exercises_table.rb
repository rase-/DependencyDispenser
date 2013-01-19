class CreateExercisesExercisesTable < ActiveRecord::Migration
  def up
    # fix this
    create_table :exercises_exercises, id: false do |t|
      t.references :exercise
      t.references :dependency
    end
  end

  def down
    drop_table :exercises_exercises
  end
end

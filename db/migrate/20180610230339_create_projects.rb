class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string  :title

      t.timestamps
    end

    create_table :todos do |t|
      t.string      :text
      t.boolean     :isCompleted
      t.references  :project, foreign_key: true

      t.timestamps
    end
  end
end

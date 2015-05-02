class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :name
      t.text :summary
      t.string :idea_type
      t.string :color
      t.string :image
      t.string :link
      t.string :github

      t.timestamps null: false
    end
  end
end

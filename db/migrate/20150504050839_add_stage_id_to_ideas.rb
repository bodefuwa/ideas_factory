class AddStageIdToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :stage_id, :integer
  end
end

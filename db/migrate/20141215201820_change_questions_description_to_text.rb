class ChangeQuestionsDescriptionToText < ActiveRecord::Migration
  def up
    change_column :questions, :description, :text
  end

  def down
    change_column :questions, :description, :string
  end
end

class CreateIllustrations < ActiveRecord::Migration[5.2]
  def change
    create_table :illustrations do |t|
      t.string     :title
      t.string     :image
      t.text       :text
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
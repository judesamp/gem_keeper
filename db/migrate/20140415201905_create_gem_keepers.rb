class CreateGemKeepers < ActiveRecord::Migration
  def change
    create_table :gem_keepers do |t|
      t.string :name
      t.string :description
      t.string :url
      t.boolean :user_gem
      t.timestamps
    end
  end
end

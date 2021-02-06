class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :first_time
      t.references :user, foreign_key: true 
      t.timestamps
    end
  end
end

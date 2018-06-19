class CreateAuthentications < ActiveRecord::Migration[5.2]
  def change
    create_table :authentications do |t|
      t.string :token
      t.string :ts
      t.date :date

      t.timestamps
    end
  end
end

class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :imageUrl
      t.string :name
      t.string :university
      t.string :major
      t.string :area
      t.string :startDate
      t.string :job
      t.string :phone
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end

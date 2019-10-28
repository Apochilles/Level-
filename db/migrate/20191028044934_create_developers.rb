class CreateDevelopers < ActiveRecord::Migration[6.0]
  def change
    create_table :developers do |t|
      t.string :developer_name

      t.timestamps
    end
  end
end

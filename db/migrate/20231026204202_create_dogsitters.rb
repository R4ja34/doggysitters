class CreateDogsitters < ActiveRecord::Migration[7.1]
  def change
    create_table :dogsitters do |t|
      t.string :name
      t.belongs_to :city, index: true
      
      t.timestamps
    end
  end
end

class CreateProponents < ActiveRecord::Migration[7.0]
  def change
    create_table :proponents do |t|
      t.string :name
      t.string :cpf
      t.date :date_of_birth

      t.timestamps
    end
  end
end

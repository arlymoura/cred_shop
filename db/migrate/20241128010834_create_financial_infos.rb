class CreateFinancialInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :financial_infos do |t|
      t.decimal :salary
      t.decimal :inss_discount
      t.references :proponent, null: false, foreign_key: true

      t.timestamps
    end
  end
end

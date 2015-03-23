class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.string :papa
      t.string :pontifice
      t.boolean :active, default: false, null: false

      t.timestamps null: false
    end
  end
end

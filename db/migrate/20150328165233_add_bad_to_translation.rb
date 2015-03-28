class AddBadToTranslation < ActiveRecord::Migration
  def change
    add_column :translations, :bad, :boolean, default: false, null: false
    add_index :translations, :bad
  end
end

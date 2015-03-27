class AddAllowedFirstToTranslation < ActiveRecord::Migration
  def change
    add_column :translations, :allowed_first, :boolean, default: true
    add_index :translations, :allowed_first
  end
end

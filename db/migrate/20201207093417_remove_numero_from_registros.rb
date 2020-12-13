class RemoveNumeroFromRegistros < ActiveRecord::Migration[6.0]
  def change
    remove_column :registros, :numero, :integer
  end
end

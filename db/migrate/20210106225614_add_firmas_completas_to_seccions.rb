class AddFirmasCompletasToSeccions < ActiveRecord::Migration[6.0]
  def change
    add_column :seccions, :firmas_completas, :boolean
  end
end

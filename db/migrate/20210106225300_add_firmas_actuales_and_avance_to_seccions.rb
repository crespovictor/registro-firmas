class AddFirmasActualesAndAvanceToSeccions < ActiveRecord::Migration[6.0]
  def change
    add_column :seccions, :firmas_actuales, :integer
    add_column :seccions, :avance, :float
  end
end

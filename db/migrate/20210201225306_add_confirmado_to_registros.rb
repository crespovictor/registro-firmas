class AddConfirmadoToRegistros < ActiveRecord::Migration[6.0]
  def change
    add_column :registros, :confirmado, :string
  end
end

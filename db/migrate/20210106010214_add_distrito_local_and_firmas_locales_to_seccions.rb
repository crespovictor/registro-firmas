class AddDistritoLocalAndFirmasLocalesToSeccions < ActiveRecord::Migration[6.0]
  def change
    add_column :seccions, :distrito_local, :string
    add_column :seccions, :firmas_locales, :integer
  end
end

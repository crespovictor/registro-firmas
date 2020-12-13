class CreateSeccions < ActiveRecord::Migration[6.0]
  def change
    create_table :seccions do |t|
      t.integer :no_seccion
      t.integer :lne
      t.integer :firmas_requeridas
      t.integer :distrito
      t.text :municipio
      t.text :entidad

      t.timestamps
    end
  end
end

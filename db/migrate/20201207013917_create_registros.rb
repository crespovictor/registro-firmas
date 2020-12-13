class CreateRegistros < ActiveRecord::Migration[6.0]
  def change
    create_table :registros do |t|
      t.integer :numero
      t.text :folio_solicitud
      t.text :nombre
      t.text :cargo
      t.text :ambito
      t.text :auxiliar
      t.integer :zona_referencia
      t.integer :id_auxiliar
      t.integer :id_dispositivo
      t.text :folio_registro
      t.datetime :fecha_captacion
      t.datetime :fecha_recepcion
      t.text :status
      t.text :folio_duplicado
      t.text :tipo_inconsistencia
      t.integer :entidad
      t.integer :distrito
      t.integer :municipio
      t.integer :seccion
      t.integer :distrito_local
      t.text :motivo_baja
      t.text :fecha_revision_audiencia
      t.text :codigo_integridad

      t.timestamps
    end
    add_index :registros, :id, unique: true
  end
end

ActiveAdmin.register Registro do

  permit_params :numero, :folio_solicitud, :nombre, :cargo, :ambito, :auxiliar, :zona_referencia, :id_auxiliar, :id_dispositivo, :folio_registro, :fecha_captacion, :fecha_recepcion, :status, :folio_duplicado, :tipo_inconsistencia, :entidad, :distrito, :municipio, :seccion, :distrito_local, :motivo_baja, :fecha_revision_audiencia, :codigo_integridad
  
  active_admin_import validate: true, 
            template_object: ActiveAdminImport::Model.new(
                hint: "Import the CSV file WITHOUT headers",
                csv_headers: ["id","folio_solicitud","nombre","cargo","ambito","auxiliar",
                  "zona_referencia","id_auxiliar","id_dispositivo","folio_registro","fecha_captacion",
                  "fecha_recepcion","status","folio_duplicado","tipo_inconsistencia","entidad","distrito",
                  "municipio","seccion","distrito_local","motivo_baja","fecha_revision_audiencia","confirmado","codigo_integridad"]
            ),
            before_batch_import: ->(importer) {
                Registro.where(id: importer.values_at('id')).delete_all
            },
            after_import: -> (importer){
              Seccion.all.each do |s|
                s.firmas_actuales = Registro.where(seccion: s.no_seccion).where.not(status: ["DUPLICADO MISMO ASPIRANTE","FUERA AMBITO GEOGRAFICO"]).count
                s.avance = ((Registro.where(seccion: s.no_seccion).where.not(status: ["DUPLICADO MISMO ASPIRANTE","FUERA AMBITO GEOGRAFICO"]).count / s.firmas_requeridas.to_f) * 100).round(2)
                s.firmas_completas = ((Registro.where(seccion: s.no_seccion).where.not(status: ["DUPLICADO MISMO ASPIRANTE","FUERA AMBITO GEOGRAFICO"]).count / s.firmas_requeridas.to_f) * 100).round(2) >= 100
                s.save!
              end}

  actions :all, except: :destroy

  scope :all, default: true
  scope :padron_electoral do |registros|
    registros.where(:status => "PADRON ELECTORAL")
  end
  scope :lista_nominal do |registros|
    registros.where(:status => "LISTA NOMINAL (PRELIMINARMENTE)")
  end
  scope :inconsistencia do |registros|
    registros.where(:status => "CON INCONSISTENCIA")
  end
  scope :mesa_de_control do |registros|
    registros.where(:status => "EN MESA DE CONTROL (CLARIFICACION)")
  end
  scope :en_procesamiento do |registros|
    registros.where(:status => "EN PROCESAMIENTO")
  end
  scope :fuera_ambito_geografico do |registros|
    registros.where(:status => "FUERA AMBITO GEOGRAFICO")
  end


  index do

    selectable_column
    column :auxiliar
    column :id_auxiliar
    column :id_dispositivo
    column :fecha_captacion
    column :fecha_recepcion
    column :status
    column :seccion
    column :distrito_local
    column :distrito
    actions
  end

  filter :auxiliar, as: :select
  filter :seccion
  filter :distrito_local, as: :select
  filter :fecha_captacion
  filter :seccion, as: :select



end
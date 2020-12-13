#ActiveAdmin.register Registro do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :numero, :folio_solicitud, :nombre, :cargo, :ambito, :auxiliar, :zona_referencia, :id_auxiliar, :id_dispositivo, :folio_registro, :fecha_captacion, :fecha_recepcion, :status, :folio_duplicado, :tipo_inconsistencia, :entidad, :distrito, :municipio, :seccion, :distrito_local, :motivo_baja, :fecha_revision_audiencia, :codigo_integridad
  #
  # or
  #
  # permit_params do
  #   permitted = [:numero, :folio_solicitud, :nombre, :cargo, :ambito, :auxiliar, :zona_referencia, :id_auxiliar, :id_dispositivo, :folio_registro, :fecha_captacion, :fecha_recepcion, :status, :folio_duplicado, :tipo_inconsistencia, :entidad, :distrito, :municipio, :seccion, :distrito_local, :motivo_baja, :fecha_revision_audiencia, :codigo_integridad]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
#end
ActiveAdmin.register Registro do

  #active_admin_import

  permit_params :numero, :folio_solicitud, :nombre, :cargo, :ambito, :auxiliar, :zona_referencia, :id_auxiliar, :id_dispositivo, :folio_registro, :fecha_captacion, :fecha_recepcion, :status, :folio_duplicado, :tipo_inconsistencia, :entidad, :distrito, :municipio, :seccion, :distrito_local, :motivo_baja, :fecha_revision_audiencia, :codigo_integridad
  
  active_admin_import validate: true, 
            template_object: ActiveAdminImport::Model.new(
                hint: "Import the CSV file WITHOUT headers",
                csv_headers: ["id","folio_solicitud","nombre","cargo","ambito","auxiliar",
                  "zona_referencia","id_auxiliar","id_dispositivo","folio_registro","fecha_captacion",
                  "fecha_recepcion","status","folio_duplicado","tipo_inconsistencia","entidad","distrito",
                  "municipio","seccion","distrito_local","motivo_baja","fecha_revision_audiencia","codigo_integridad"]
            ),
            before_batch_import: ->(importer) {
                Registro.where(id: importer.values_at('id')).delete_all
            }
  #actions :all, except: [:destroy]
  form do |f|
    f.inputs do
      f.input :seccion
      f.input :ambito
    end
    actions
  end

  scope :all, default: true
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

  #action_item :only => :index do
  #  link_to 'Upload CSV', :action => 'upload_csv'
  #end
#
#  #collection_action :upload_csv do
#  #  render "admin/csv/upload_csv"
#  #end
#
#  #collection_action :import_csv, :method => :post do
#  #  CsvDb.convert_save("registro", params[:dump][:file])
#  #  redirect_to :action => :index, :notice => "CSV imported successfully!"
  #end


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
  end

  filter :auxiliar, as: :select
  filter :seccion
  filter :distrito_local, as: :select
  filter :fecha_captacion
  filter :seccion, as: :select



end
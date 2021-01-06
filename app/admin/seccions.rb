ActiveAdmin.register Seccion do
  permit_params :no_seccion, :lne, :firmas_requeridas, :distrito, :municipio, :entidad, :firmas_locales, :distrito_local, :firmas_completas, :firmas_actuales
  active_admin_import validate: true,             
    before_batch_import: ->(importer) {
                Seccion.where(id: importer.values_at('id')).delete_all
            }
  actions :all, except: :destroy


  config.sort_order = 'no_seccion_asc'
  filter :no_seccion, as: :select
  filter :distrito_local, as: :select
  filter :firmas_completas, as: :select, collection: [['Yes', 'true'], ['No', 'false']]
  filter :lne
  filter :firmas_requeridas

  index do
    column :no_seccion 
    column "LNE", :lne
    column :firmas_requeridas
    column :firmas_actuales
    column :avance
    column :firmas_completas
    column :distrito_local
    column :firmas_locales
    column :entidad
    actions
    
  end

end

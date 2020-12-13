ActiveAdmin.register Seccion do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :no_seccion, :lne, :firmas_requeridas, :distrito, :municipio, :entidad
  #
  # or
  #
  # permit_params do
  #   permitted = [:no_seccion, :lne, :firmas_requeridas, :distrito, :municipio, :entidad]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  active_admin_import
  actions :all, except: :destroy

  config.sort_order = 'no_seccion_asc'
  filter :no_seccion, as: :select
  filter :lne
  filter :firmas_requeridas

  index do
    column :no_seccion 
    column "LNE", :lne
    column :firmas_requeridas
    column "Firnas actuales" do |s| 
      Registro.where(seccion: s.no_seccion).where(status: "LISTA NOMINAL (PRELIMINARMENTE)").count
    end
    column "Avance (%)" do |s| 
      ((Registro.where(seccion: s.no_seccion).where(status: "LISTA NOMINAL (PRELIMINARMENTE)").count / s.firmas_requeridas.to_f) * 100).round(2)
    end
    column :municipio
    column :entidad
    column :distrito
    
  end

end

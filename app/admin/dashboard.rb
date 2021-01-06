ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do


    panel "Firmas por sección (En lista nominal o padrón electoral)" do
        # line_chart   Content.pluck("download").uniq.map { |c| { title: c, data: Content.where(download: c).group_by_day(:updated_at, format: "%B %d, %Y").count }  }, discrete: true
        # column_chart Content.group_by_hour_of_day(:updated_at, format: "%l %P").order(:download).count, {library: {title:'Downloads for all providers'}}
        column_chart Registro.where.not(seccion: nil).where(status: "LISTA NOMINAL (PRELIMINARMENTE)").or(Registro.where.not(seccion: nil).where(status: "PADRON ELECTORAL")).group(:seccion).count
        # bar_chart Registro.count(:seccion)
        ##
        # line_chart result.each(:as => :hash) { |item|
        #   {name: item.title, data: item.sum_download.count}
        # }
    end

    panel "Firmas por status" do
        bar_chart Registro.where.not(status: nil).group(:status).count
    end

    panel "Firmas por auxiliar" do
        column_chart Registro.where.not(auxiliar: nil).group(:auxiliar).count
    end
    

     #Here is an example of a simple dashboard with columns and panels.



    table_for Seccion.all do
        column "No. Seccion", :no_seccion
        column "Firmas requeridas", :firmas_requeridas
        column "Firnas actuales", :firmas_actuales
        column "Avance (%)", :avance
        column "Firmas Completas?", :firmas_completas

    end
  end # content

end

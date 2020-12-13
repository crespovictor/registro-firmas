class RegistrosController < InheritedResources::Base

  private

    def registro_params
      params.require(:registro).permit(:id, :folio_solicitud, :nombre, :cargo, :ambito, :auxiliar, :zona_referencia, :id_auxiliar, :id_dispositivo, :folio_registro, :fecha_captacion, :fecha_recepcion, :status, :folio_duplicado, :tipo_inconsistencia, :entidad, :distrito, :municipio, :no_seccion, :distrito_local, :motivo_baja, :fecha_revision_audiencia, :codigo_integridad)
    end

    def index
    	@registros = Registro.all
    end

end

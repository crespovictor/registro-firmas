require 'test_helper'

class RegistrosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @registro = registros(:one)
  end

  test "should get index" do
    get registros_url
    assert_response :success
  end

  test "should get new" do
    get new_registro_url
    assert_response :success
  end

  test "should create registro" do
    assert_difference('Registro.count') do
      post registros_url, params: { registro: { ambito: @registro.ambito, auxiliar: @registro.auxiliar, cargo: @registro.cargo, codigo_integridad: @registro.codigo_integridad, distrito: @registro.distrito, distrito_local: @registro.distrito_local, entidad: @registro.entidad, fecha_captacion: @registro.fecha_captacion, fecha_recepcion: @registro.fecha_recepcion, fecha_revision_audiencia: @registro.fecha_revision_audiencia, folio_duplicado: @registro.folio_duplicado, folio_registro: @registro.folio_registro, folio_solicitud: @registro.folio_solicitud, id: @registro.id, id_auxiliar: @registro.id_auxiliar, id_dispositivo: @registro.id_dispositivo, motivo_baja: @registro.motivo_baja, municipio: @registro.municipio, nombre: @registro.nombre, seccion: @registro.seccion, status: @registro.status, tipo_inconsistencia: @registro.tipo_inconsistencia, zona_referencia: @registro.zona_referencia } }
    end

    assert_redirected_to registro_url(Registro.last)
  end

  test "should show registro" do
    get registro_url(@registro)
    assert_response :success
  end

  test "should get edit" do
    get edit_registro_url(@registro)
    assert_response :success
  end

  test "should update registro" do
    patch registro_url(@registro), params: { registro: { ambito: @registro.ambito, auxiliar: @registro.auxiliar, cargo: @registro.cargo, codigo_integridad: @registro.codigo_integridad, distrito: @registro.distrito, distrito_local: @registro.distrito_local, entidad: @registro.entidad, fecha_captacion: @registro.fecha_captacion, fecha_recepcion: @registro.fecha_recepcion, fecha_revision_audiencia: @registro.fecha_revision_audiencia, folio_duplicado: @registro.folio_duplicado, folio_registro: @registro.folio_registro, folio_solicitud: @registro.folio_solicitud, id: @registro.id, id_auxiliar: @registro.id_auxiliar, id_dispositivo: @registro.id_dispositivo, motivo_baja: @registro.motivo_baja, municipio: @registro.municipio, nombre: @registro.nombre, seccion: @registro.seccion, status: @registro.status, tipo_inconsistencia: @registro.tipo_inconsistencia, zona_referencia: @registro.zona_referencia } }
    assert_redirected_to registro_url(@registro)
  end

  test "should destroy registro" do
    assert_difference('Registro.count', -1) do
      delete registro_url(@registro)
    end

    assert_redirected_to registros_url
  end
end

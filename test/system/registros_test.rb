require "application_system_test_case"

class RegistrosTest < ApplicationSystemTestCase
  setup do
    @registro = registros(:one)
  end

  test "visiting the index" do
    visit registros_url
    assert_selector "h1", text: "Registros"
  end

  test "creating a Registro" do
    visit registros_url
    click_on "New Registro"

    fill_in "Ambito", with: @registro.ambito
    fill_in "Auxiliar", with: @registro.auxiliar
    fill_in "Cargo", with: @registro.cargo
    fill_in "Codigo integridad", with: @registro.codigo_integridad
    fill_in "Distrito", with: @registro.distrito
    fill_in "Distrito local", with: @registro.distrito_local
    fill_in "Entidad", with: @registro.entidad
    fill_in "Fecha captacion", with: @registro.fecha_captacion
    fill_in "Fecha recepcion", with: @registro.fecha_recepcion
    fill_in "Fecha revision audiencia", with: @registro.fecha_revision_audiencia
    fill_in "Folio duplicado", with: @registro.folio_duplicado
    fill_in "Folio registro", with: @registro.folio_registro
    fill_in "Folio solicitud", with: @registro.folio_solicitud
    fill_in "Id", with: @registro.id
    fill_in "Id auxiliar", with: @registro.id_auxiliar
    fill_in "Id dispositivo", with: @registro.id_dispositivo
    fill_in "Motivo baja", with: @registro.motivo_baja
    fill_in "Municipio", with: @registro.municipio
    fill_in "Nombre", with: @registro.nombre
    fill_in "Seccion", with: @registro.seccion
    fill_in "Status", with: @registro.status
    fill_in "Tipo inconsistencia", with: @registro.tipo_inconsistencia
    fill_in "Zona referencia", with: @registro.zona_referencia
    click_on "Create Registro"

    assert_text "Registro was successfully created"
    click_on "Back"
  end

  test "updating a Registro" do
    visit registros_url
    click_on "Edit", match: :first

    fill_in "Ambito", with: @registro.ambito
    fill_in "Auxiliar", with: @registro.auxiliar
    fill_in "Cargo", with: @registro.cargo
    fill_in "Codigo integridad", with: @registro.codigo_integridad
    fill_in "Distrito", with: @registro.distrito
    fill_in "Distrito local", with: @registro.distrito_local
    fill_in "Entidad", with: @registro.entidad
    fill_in "Fecha captacion", with: @registro.fecha_captacion
    fill_in "Fecha recepcion", with: @registro.fecha_recepcion
    fill_in "Fecha revision audiencia", with: @registro.fecha_revision_audiencia
    fill_in "Folio duplicado", with: @registro.folio_duplicado
    fill_in "Folio registro", with: @registro.folio_registro
    fill_in "Folio solicitud", with: @registro.folio_solicitud
    fill_in "Id", with: @registro.id
    fill_in "Id auxiliar", with: @registro.id_auxiliar
    fill_in "Id dispositivo", with: @registro.id_dispositivo
    fill_in "Motivo baja", with: @registro.motivo_baja
    fill_in "Municipio", with: @registro.municipio
    fill_in "Nombre", with: @registro.nombre
    fill_in "Seccion", with: @registro.seccion
    fill_in "Status", with: @registro.status
    fill_in "Tipo inconsistencia", with: @registro.tipo_inconsistencia
    fill_in "Zona referencia", with: @registro.zona_referencia
    click_on "Update Registro"

    assert_text "Registro was successfully updated"
    click_on "Back"
  end

  test "destroying a Registro" do
    visit registros_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Registro was successfully destroyed"
  end
end

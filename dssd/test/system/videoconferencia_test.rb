require "application_system_test_case"

class VideoconferenciaTest < ApplicationSystemTestCase
  setup do
    @videoconferencium = videoconferencia(:one)
  end

  test "visiting the index" do
    visit videoconferencia_url
    assert_selector "h1", text: "Videoconferencia"
  end

  test "creating a Videoconferencium" do
    visit videoconferencia_url
    click_on "New Videoconferencium"

    fill_in "Estado", with: @videoconferencium.estado
    fill_in "Fecha", with: @videoconferencium.fecha
    fill_in "Hora", with: @videoconferencium.hora
    fill_in "Motivo", with: @videoconferencium.motivo
    fill_in "Nro causa", with: @videoconferencium.nro_causa
    fill_in "Solicitante", with: @videoconferencium.solicitante
    fill_in "Tipo", with: @videoconferencium.tipo
    fill_in "Unidad", with: @videoconferencium.unidad
    click_on "Create Videoconferencium"

    assert_text "Videoconferencium was successfully created"
    click_on "Back"
  end

  test "updating a Videoconferencium" do
    visit videoconferencia_url
    click_on "Edit", match: :first

    fill_in "Estado", with: @videoconferencium.estado
    fill_in "Fecha", with: @videoconferencium.fecha
    fill_in "Hora", with: @videoconferencium.hora
    fill_in "Motivo", with: @videoconferencium.motivo
    fill_in "Nro causa", with: @videoconferencium.nro_causa
    fill_in "Solicitante", with: @videoconferencium.solicitante
    fill_in "Tipo", with: @videoconferencium.tipo
    fill_in "Unidad", with: @videoconferencium.unidad
    click_on "Update Videoconferencium"

    assert_text "Videoconferencium was successfully updated"
    click_on "Back"
  end

  test "destroying a Videoconferencium" do
    visit videoconferencia_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Videoconferencium was successfully destroyed"
  end
end

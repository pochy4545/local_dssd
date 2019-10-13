require "application_system_test_case"

class RegistroVideoconferenciaTest < ApplicationSystemTestCase
  setup do
    @registro_videoconferencium = registro_videoconferencia(:one)
  end

  test "visiting the index" do
    visit registro_videoconferencia_url
    assert_selector "h1", text: "Registro Videoconferencia"
  end

  test "creating a Registro videoconferencium" do
    visit registro_videoconferencia_url
    click_on "New Registro Videoconferencium"

    fill_in "Descripcion", with: @registro_videoconferencium.descripcion
    fill_in "Estado", with: @registro_videoconferencium.estado
    fill_in "Fecha", with: @registro_videoconferencium.fecha
    fill_in "Hora", with: @registro_videoconferencium.hora
    fill_in "Videoconferencia", with: @registro_videoconferencium.videoconferencia
    click_on "Create Registro videoconferencium"

    assert_text "Registro videoconferencium was successfully created"
    click_on "Back"
  end

  test "updating a Registro videoconferencium" do
    visit registro_videoconferencia_url
    click_on "Edit", match: :first

    fill_in "Descripcion", with: @registro_videoconferencium.descripcion
    fill_in "Estado", with: @registro_videoconferencium.estado
    fill_in "Fecha", with: @registro_videoconferencium.fecha
    fill_in "Hora", with: @registro_videoconferencium.hora
    fill_in "Videoconferencia", with: @registro_videoconferencium.videoconferencia
    click_on "Update Registro videoconferencium"

    assert_text "Registro videoconferencium was successfully updated"
    click_on "Back"
  end

  test "destroying a Registro videoconferencium" do
    visit registro_videoconferencia_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Registro videoconferencium was successfully destroyed"
  end
end

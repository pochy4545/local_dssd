require "application_system_test_case"

class ParticipanteVideoconferenciaTest < ApplicationSystemTestCase
  setup do
    @participante_videoconferencium = participante_videoconferencia(:one)
  end

  test "visiting the index" do
    visit participante_videoconferencia_url
    assert_selector "h1", text: "Participante Videoconferencia"
  end

  test "creating a Participante videoconferencium" do
    visit participante_videoconferencia_url
    click_on "New Participante Videoconferencium"

    fill_in "Apellido", with: @participante_videoconferencium.apellido
    fill_in "Email", with: @participante_videoconferencium.email
    fill_in "Nombres", with: @participante_videoconferencium.nombres
    fill_in "Tipo participante", with: @participante_videoconferencium.tipo_participante
    click_on "Create Participante videoconferencium"

    assert_text "Participante videoconferencium was successfully created"
    click_on "Back"
  end

  test "updating a Participante videoconferencium" do
    visit participante_videoconferencia_url
    click_on "Edit", match: :first

    fill_in "Apellido", with: @participante_videoconferencium.apellido
    fill_in "Email", with: @participante_videoconferencium.email
    fill_in "Nombres", with: @participante_videoconferencium.nombres
    fill_in "Tipo participante", with: @participante_videoconferencium.tipo_participante
    click_on "Update Participante videoconferencium"

    assert_text "Participante videoconferencium was successfully updated"
    click_on "Back"
  end

  test "destroying a Participante videoconferencium" do
    visit participante_videoconferencia_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Participante videoconferencium was successfully destroyed"
  end
end

require "application_system_test_case"

class TipoParticipantesTest < ApplicationSystemTestCase
  setup do
    @tipo_participante = tipo_participantes(:one)
  end

  test "visiting the index" do
    visit tipo_participantes_url
    assert_selector "h1", text: "Tipo Participantes"
  end

  test "creating a Tipo participante" do
    visit tipo_participantes_url
    click_on "New Tipo Participante"

    fill_in "Tipo", with: @tipo_participante.tipo
    click_on "Create Tipo participante"

    assert_text "Tipo participante was successfully created"
    click_on "Back"
  end

  test "updating a Tipo participante" do
    visit tipo_participantes_url
    click_on "Edit", match: :first

    fill_in "Tipo", with: @tipo_participante.tipo
    click_on "Update Tipo participante"

    assert_text "Tipo participante was successfully updated"
    click_on "Back"
  end

  test "destroying a Tipo participante" do
    visit tipo_participantes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tipo participante was successfully destroyed"
  end
end

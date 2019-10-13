require "application_system_test_case"

class TipoVideoconferenciaTest < ApplicationSystemTestCase
  setup do
    @tipo_videoconferencium = tipo_videoconferencia(:one)
  end

  test "visiting the index" do
    visit tipo_videoconferencia_url
    assert_selector "h1", text: "Tipo Videoconferencia"
  end

  test "creating a Tipo videoconferencium" do
    visit tipo_videoconferencia_url
    click_on "New Tipo Videoconferencium"

    fill_in "Tipo", with: @tipo_videoconferencium.tipo
    click_on "Create Tipo videoconferencium"

    assert_text "Tipo videoconferencium was successfully created"
    click_on "Back"
  end

  test "updating a Tipo videoconferencium" do
    visit tipo_videoconferencia_url
    click_on "Edit", match: :first

    fill_in "Tipo", with: @tipo_videoconferencium.tipo
    click_on "Update Tipo videoconferencium"

    assert_text "Tipo videoconferencium was successfully updated"
    click_on "Back"
  end

  test "destroying a Tipo videoconferencium" do
    visit tipo_videoconferencia_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tipo videoconferencium was successfully destroyed"
  end
end

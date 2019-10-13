require "application_system_test_case"

class EstadoVideoconferenciaTest < ApplicationSystemTestCase
  setup do
    @estado_videoconferencium = estado_videoconferencia(:one)
  end

  test "visiting the index" do
    visit estado_videoconferencia_url
    assert_selector "h1", text: "Estado Videoconferencia"
  end

  test "creating a Estado videoconferencium" do
    visit estado_videoconferencia_url
    click_on "New Estado Videoconferencium"

    fill_in "Estado", with: @estado_videoconferencium.estado
    click_on "Create Estado videoconferencium"

    assert_text "Estado videoconferencium was successfully created"
    click_on "Back"
  end

  test "updating a Estado videoconferencium" do
    visit estado_videoconferencia_url
    click_on "Edit", match: :first

    fill_in "Estado", with: @estado_videoconferencium.estado
    click_on "Update Estado videoconferencium"

    assert_text "Estado videoconferencium was successfully updated"
    click_on "Back"
  end

  test "destroying a Estado videoconferencium" do
    visit estado_videoconferencia_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Estado videoconferencium was successfully destroyed"
  end
end

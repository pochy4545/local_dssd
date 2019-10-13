require "application_system_test_case"

class InternoUnidadsTest < ApplicationSystemTestCase
  setup do
    @interno_unidad = interno_unidads(:one)
  end

  test "visiting the index" do
    visit interno_unidads_url
    assert_selector "h1", text: "Interno Unidads"
  end

  test "creating a Interno unidad" do
    visit interno_unidads_url
    click_on "New Interno Unidad"

    fill_in "Apellido", with: @interno_unidad.apellido
    fill_in "Email representante", with: @interno_unidad.email_representante
    fill_in "Nombre", with: @interno_unidad.nombre
    fill_in "Unidad", with: @interno_unidad.unidad
    click_on "Create Interno unidad"

    assert_text "Interno unidad was successfully created"
    click_on "Back"
  end

  test "updating a Interno unidad" do
    visit interno_unidads_url
    click_on "Edit", match: :first

    fill_in "Apellido", with: @interno_unidad.apellido
    fill_in "Email representante", with: @interno_unidad.email_representante
    fill_in "Nombre", with: @interno_unidad.nombre
    fill_in "Unidad", with: @interno_unidad.unidad
    click_on "Update Interno unidad"

    assert_text "Interno unidad was successfully updated"
    click_on "Back"
  end

  test "destroying a Interno unidad" do
    visit interno_unidads_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Interno unidad was successfully destroyed"
  end
end

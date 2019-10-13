require 'test_helper'

class InternoUnidadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @interno_unidad = interno_unidads(:one)
  end

  test "should get index" do
    get interno_unidads_url
    assert_response :success
  end

  test "should get new" do
    get new_interno_unidad_url
    assert_response :success
  end

  test "should create interno_unidad" do
    assert_difference('InternoUnidad.count') do
      post interno_unidads_url, params: { interno_unidad: { apellido: @interno_unidad.apellido, email_representante: @interno_unidad.email_representante, nombre: @interno_unidad.nombre, unidad: @interno_unidad.unidad } }
    end

    assert_redirected_to interno_unidad_url(InternoUnidad.last)
  end

  test "should show interno_unidad" do
    get interno_unidad_url(@interno_unidad)
    assert_response :success
  end

  test "should get edit" do
    get edit_interno_unidad_url(@interno_unidad)
    assert_response :success
  end

  test "should update interno_unidad" do
    patch interno_unidad_url(@interno_unidad), params: { interno_unidad: { apellido: @interno_unidad.apellido, email_representante: @interno_unidad.email_representante, nombre: @interno_unidad.nombre, unidad: @interno_unidad.unidad } }
    assert_redirected_to interno_unidad_url(@interno_unidad)
  end

  test "should destroy interno_unidad" do
    assert_difference('InternoUnidad.count', -1) do
      delete interno_unidad_url(@interno_unidad)
    end

    assert_redirected_to interno_unidads_url
  end
end

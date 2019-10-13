require 'test_helper'

class RegistroVideoconferenciaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @registro_videoconferencium = registro_videoconferencia(:one)
  end

  test "should get index" do
    get registro_videoconferencia_url
    assert_response :success
  end

  test "should get new" do
    get new_registro_videoconferencium_url
    assert_response :success
  end

  test "should create registro_videoconferencium" do
    assert_difference('RegistroVideoconferencium.count') do
      post registro_videoconferencia_url, params: { registro_videoconferencium: { descripcion: @registro_videoconferencium.descripcion, estado: @registro_videoconferencium.estado, fecha: @registro_videoconferencium.fecha, hora: @registro_videoconferencium.hora, videoconferencia: @registro_videoconferencium.videoconferencia } }
    end

    assert_redirected_to registro_videoconferencium_url(RegistroVideoconferencium.last)
  end

  test "should show registro_videoconferencium" do
    get registro_videoconferencium_url(@registro_videoconferencium)
    assert_response :success
  end

  test "should get edit" do
    get edit_registro_videoconferencium_url(@registro_videoconferencium)
    assert_response :success
  end

  test "should update registro_videoconferencium" do
    patch registro_videoconferencium_url(@registro_videoconferencium), params: { registro_videoconferencium: { descripcion: @registro_videoconferencium.descripcion, estado: @registro_videoconferencium.estado, fecha: @registro_videoconferencium.fecha, hora: @registro_videoconferencium.hora, videoconferencia: @registro_videoconferencium.videoconferencia } }
    assert_redirected_to registro_videoconferencium_url(@registro_videoconferencium)
  end

  test "should destroy registro_videoconferencium" do
    assert_difference('RegistroVideoconferencium.count', -1) do
      delete registro_videoconferencium_url(@registro_videoconferencium)
    end

    assert_redirected_to registro_videoconferencia_url
  end
end

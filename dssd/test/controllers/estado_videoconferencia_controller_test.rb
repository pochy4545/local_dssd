require 'test_helper'

class EstadoVideoconferenciaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @estado_videoconferencium = estado_videoconferencia(:one)
  end

  test "should get index" do
    get estado_videoconferencia_url
    assert_response :success
  end

  test "should get new" do
    get new_estado_videoconferencium_url
    assert_response :success
  end

  test "should create estado_videoconferencium" do
    assert_difference('EstadoVideoconferencium.count') do
      post estado_videoconferencia_url, params: { estado_videoconferencium: { estado: @estado_videoconferencium.estado } }
    end

    assert_redirected_to estado_videoconferencium_url(EstadoVideoconferencium.last)
  end

  test "should show estado_videoconferencium" do
    get estado_videoconferencium_url(@estado_videoconferencium)
    assert_response :success
  end

  test "should get edit" do
    get edit_estado_videoconferencium_url(@estado_videoconferencium)
    assert_response :success
  end

  test "should update estado_videoconferencium" do
    patch estado_videoconferencium_url(@estado_videoconferencium), params: { estado_videoconferencium: { estado: @estado_videoconferencium.estado } }
    assert_redirected_to estado_videoconferencium_url(@estado_videoconferencium)
  end

  test "should destroy estado_videoconferencium" do
    assert_difference('EstadoVideoconferencium.count', -1) do
      delete estado_videoconferencium_url(@estado_videoconferencium)
    end

    assert_redirected_to estado_videoconferencia_url
  end
end

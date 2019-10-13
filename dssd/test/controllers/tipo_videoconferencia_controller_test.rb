require 'test_helper'

class TipoVideoconferenciaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_videoconferencium = tipo_videoconferencia(:one)
  end

  test "should get index" do
    get tipo_videoconferencia_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_videoconferencium_url
    assert_response :success
  end

  test "should create tipo_videoconferencium" do
    assert_difference('TipoVideoconferencium.count') do
      post tipo_videoconferencia_url, params: { tipo_videoconferencium: { tipo: @tipo_videoconferencium.tipo } }
    end

    assert_redirected_to tipo_videoconferencium_url(TipoVideoconferencium.last)
  end

  test "should show tipo_videoconferencium" do
    get tipo_videoconferencium_url(@tipo_videoconferencium)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_videoconferencium_url(@tipo_videoconferencium)
    assert_response :success
  end

  test "should update tipo_videoconferencium" do
    patch tipo_videoconferencium_url(@tipo_videoconferencium), params: { tipo_videoconferencium: { tipo: @tipo_videoconferencium.tipo } }
    assert_redirected_to tipo_videoconferencium_url(@tipo_videoconferencium)
  end

  test "should destroy tipo_videoconferencium" do
    assert_difference('TipoVideoconferencium.count', -1) do
      delete tipo_videoconferencium_url(@tipo_videoconferencium)
    end

    assert_redirected_to tipo_videoconferencia_url
  end
end

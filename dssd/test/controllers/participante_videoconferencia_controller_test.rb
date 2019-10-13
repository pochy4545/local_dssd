require 'test_helper'

class ParticipanteVideoconferenciaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @participante_videoconferencium = participante_videoconferencia(:one)
  end

  test "should get index" do
    get participante_videoconferencia_url
    assert_response :success
  end

  test "should get new" do
    get new_participante_videoconferencium_url
    assert_response :success
  end

  test "should create participante_videoconferencium" do
    assert_difference('ParticipanteVideoconferencium.count') do
      post participante_videoconferencia_url, params: { participante_videoconferencium: { apellido: @participante_videoconferencium.apellido, email: @participante_videoconferencium.email, nombres: @participante_videoconferencium.nombres, tipo_participante: @participante_videoconferencium.tipo_participante } }
    end

    assert_redirected_to participante_videoconferencium_url(ParticipanteVideoconferencium.last)
  end

  test "should show participante_videoconferencium" do
    get participante_videoconferencium_url(@participante_videoconferencium)
    assert_response :success
  end

  test "should get edit" do
    get edit_participante_videoconferencium_url(@participante_videoconferencium)
    assert_response :success
  end

  test "should update participante_videoconferencium" do
    patch participante_videoconferencium_url(@participante_videoconferencium), params: { participante_videoconferencium: { apellido: @participante_videoconferencium.apellido, email: @participante_videoconferencium.email, nombres: @participante_videoconferencium.nombres, tipo_participante: @participante_videoconferencium.tipo_participante } }
    assert_redirected_to participante_videoconferencium_url(@participante_videoconferencium)
  end

  test "should destroy participante_videoconferencium" do
    assert_difference('ParticipanteVideoconferencium.count', -1) do
      delete participante_videoconferencium_url(@participante_videoconferencium)
    end

    assert_redirected_to participante_videoconferencia_url
  end
end

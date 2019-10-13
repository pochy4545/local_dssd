require 'test_helper'

class TipoParticipantesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_participante = tipo_participantes(:one)
  end

  test "should get index" do
    get tipo_participantes_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_participante_url
    assert_response :success
  end

  test "should create tipo_participante" do
    assert_difference('TipoParticipante.count') do
      post tipo_participantes_url, params: { tipo_participante: { tipo: @tipo_participante.tipo } }
    end

    assert_redirected_to tipo_participante_url(TipoParticipante.last)
  end

  test "should show tipo_participante" do
    get tipo_participante_url(@tipo_participante)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_participante_url(@tipo_participante)
    assert_response :success
  end

  test "should update tipo_participante" do
    patch tipo_participante_url(@tipo_participante), params: { tipo_participante: { tipo: @tipo_participante.tipo } }
    assert_redirected_to tipo_participante_url(@tipo_participante)
  end

  test "should destroy tipo_participante" do
    assert_difference('TipoParticipante.count', -1) do
      delete tipo_participante_url(@tipo_participante)
    end

    assert_redirected_to tipo_participantes_url
  end
end

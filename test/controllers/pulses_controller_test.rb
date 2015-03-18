require 'test_helper'

class PulsesControllerTest < ActionController::TestCase
  setup do
    @pulse = pulses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pulses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pulse" do
    assert_difference('Pulse.count') do
      post :create, pulse: { pulse_rate: @pulse.pulse_rate, pulse_time: @pulse.pulse_time }
    end

    assert_redirected_to pulse_path(assigns(:pulse))
  end

  test "should show pulse" do
    get :show, id: @pulse
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pulse
    assert_response :success
  end

  test "should update pulse" do
    patch :update, id: @pulse, pulse: { pulse_rate: @pulse.pulse_rate, pulse_time: @pulse.pulse_time }
    assert_redirected_to pulse_path(assigns(:pulse))
  end

  test "should destroy pulse" do
    assert_difference('Pulse.count', -1) do
      delete :destroy, id: @pulse
    end

    assert_redirected_to pulses_path
  end
end

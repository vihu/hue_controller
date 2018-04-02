defmodule HueControllerTest do
  use ExUnit.Case
  doctest HueController

  test "set night mode" do
    assert HueController.night() == :ok
  end

  test "set day mode" do
    assert HueController.day() == :ok
  end

  test "set relax mode" do
    assert HueController.relax() == :ok
  end

  test "turn all lights off" do
    assert HueController.off() == :ok
  end
end

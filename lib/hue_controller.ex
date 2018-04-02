defmodule HueController do
  @moduledoc """
  Highly customized Hue settings.
  """

  @hue_ip System.get_env("HUE_IP")
  @hue_username System.get_env("HUE_USERNAME")
  @hue_bridge Huex.connect(@hue_ip, @hue_username)

  @doc """
  Set night mode.

  ## Examples
         iex> HueController.night
         :ok

  """
  def night do
    @hue_bridge
    |> Huex.lights
    |> Map.keys
    |> Enum.map(fn(light) -> Huex.set_brightness(@hue_bridge, light, 0.20) end)
    :ok
  end

  @doc """
  Set day mode.

  ## Examples

        iex> HueController.day
        :ok

  """
  def day do
    lights = @hue_bridge |> Huex.lights |> Map.keys
    lights |> Enum.map(fn(light) -> Huex.set_brightness(@hue_bridge, light, 0.99) end)
    lights |> Enum.map(fn(light) -> Huex.set_color(@hue_bridge, light, {10000, 255, 255}) end)
    :ok
  end

  @doc """
  Set relax mode.

  ## Examples

        iex> HueController.relax
        :ok

  """
  def relax do
    lights = @hue_bridge |> Huex.lights |> Map.keys
    lights |> Enum.map(fn(light) -> Huex.set_brightness(@hue_bridge, light, 0.40) end)
    :ok
  end

  @doc """
  Turn off all lights

  ## Examples

       iex> HueController.off
       :ok

  """
  def off do
    lights = @hue_bridge |> Huex.lights |> Map.keys
    lights |> Enum.map(fn(light) -> Huex.turn_off(@hue_bridge, light) end)
    :ok
  end
end

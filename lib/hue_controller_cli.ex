defmodule HueController.CLI do
  def main(args) do
    args |> parse_args |> process_args
  end

  def parse_args(args) do
    {params, _, _} =  OptionParser.parse(args, switches: [help: :boolean])
    params
  end

  defp process_args([help: true]) do
    print_help_message()
  end
  defp process_args([day: true]) do
    HueController.day
  end
  defp process_args([night: true]) do
    HueController.night
  end
  defp process_args([relax: true]) do
    HueController.relax
  end
  defp process_args([off: true]) do
    HueController.off
  end

  defp process_args(_) do
    IO.puts("HueController - pre-defined hue scenes!")
    print_help_message()
    receive_command()
  end

  @commands %{
    "day" => "Set day mode",
    "night" => "Set night mode",
    "relax" => "Set relax mode",
    "off" => "Turn all lights off"
  }

  defp receive_command do
    IO.gets("\n> ")
    |> String.trim
    |> String.downcase
    |> execute_command
  end

  defp execute_command("day") do
    IO.puts "\nSetting day mode"
    HueController.day
  end
  defp execute_command("night") do
    IO.puts "\nSetting night mode"
    HueController.night
  end
  defp execute_command("relax") do
    IO.puts "\nSetting relax mode"
    HueController.relax
  end
  defp execute_command("off") do
    IO.puts "\nTurning all lights off"
    HueController.off
  end

  defp execute_command(_unknown) do
    IO.puts("\nInvalid command. I don't know what to do.")
    print_help_message()

    receive_command()
  end

  defp print_help_message do
    IO.puts("\nThe simulator supports following commands:\n")
    @commands
    |> Enum.map(fn({command, description}) -> IO.puts("  #{command} - #{description}") end)
  end
end


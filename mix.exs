defmodule HueController.MixProject do
  use Mix.Project

  def project do
    [
      app: :hue_controller,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      escript: escript(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp escript do
    [main_module: HueController.CLI]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:huex, "~> 0.7"},
      {:ex_doc, "~> 0.16", only: :dev, runtime: false}
    ]
  end
end

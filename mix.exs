defmodule TermConst.MixProject do
  use Mix.Project

  def project do
    [
      app: :term_const,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    []
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 1.7", runtime: false, only: [:dev, :test]},
      {:dialyxir, "~> 1.0", only: [:dev], runtime: false}
    ]
  end

  defp aliases do
    [
      analyze: [
        "credo --strict --only=warnings,todo,fixme,consistency,readability",
        "dialyzer --ignore-exit-status"
      ]
    ]
  end
end

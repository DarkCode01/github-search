defmodule GithubSearch.MixProject do
  use Mix.Project

  def project do
    [
      app: :github_search,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      escript: [main_module: GithubSearch.CLI],  # [Entry Point]: Configuration to make a file executable on shell.
      deps: deps(),
      test_coverage: [tool: ExCoveralls]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:poison, "~> 4.0"},
      {:scribe, "~> 0.10.0"},
      {:httpoison, "~> 1.6"},
      {:excoveralls, "~> 0.12.3", only: [:test]},
      {:credo, "~> 1.3", only: [:dev, :test], runtime: false}
    ]
  end
end

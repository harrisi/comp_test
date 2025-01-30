defmodule CompUser.MixProject do
  use Mix.Project

  def project do
    [
      app: :comp_user,
      version: "0.2.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      compilers: [:foo_two, :foo | Mix.compilers()],
      listeners: [CompListener],
      aliases: aliases()
    ]
  end

  defp aliases do
    [
      compile: ["check.file", "compile"]
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
      {:comp, in_umbrella: true},
      {:comp_two, in_umbrella: true},
      {:comp_listener, in_umbrella: true}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
      # {:sibling_app_in_umbrella, in_umbrella: true}
    ]
  end
end


defmodule NIEx.Mixfile do
  use Mix.Project

  def project do
    [app: :niex,
     version: "0.0.1",
     elixir: ">= 1.0.0",
     deps: deps,
     package: package,
     description: description]
  end

  def application do
    []
  end

  defp deps do
    [{:poison, ">= 1.2.0"}]
  end

  defp description do
  """
  TODO
  """
  end

  defp package do
    [contributors: ["Alexander Sviridov"],
     licenses: ["The MIT License"],
     links: %{"Github" => "https://github.com/sviridov/niex"}]
  end
end

defmodule GraphOfThrones do
  @moduledoc """
  Documentation for GraphOfThrones.
  """

  @spec solve(binary()) :: boolean()
  def solve(input) do
    g = Graph.new(type: :undirected)

    input
    |> String.split("\n")
    |> Enum.drop(1)
    |> Enum.map(&parse/1)
    |> Enum.reduce(g, &insert/2)
    |> GraphExt.balanced?()
  end

  defp parse(line) do
    [_, a, _, relation, b] = Regex.run(~r/(.*)( (\+\+|--) )(.*)/, line)

    relation = case relation do
      "++" -> 1
      "--" -> -1
    end

    [a, relation, b]
  end

  defp insert([a, relation, b], g) do
    g
    |> Graph.add_vertices([a, b])
    |> Graph.add_edge(a, b, weight: relation)
  end
end

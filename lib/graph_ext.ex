defmodule GraphExt do
  @moduledoc """
  Documentation for GraphExt.

  Extends the functionality for libGraph
  """

  @spec balanced?(Graph.t()) :: boolean()
  def balanced?(g) do
    Graph.vertices(g)
    |> Combination.combine(3)
    |> IO.inspect()
    |> Enum.reduce(true, fn list, acc -> balanced_verts(g, list) && acc end)
  end

  defp balanced_verts(g, l) do
    l
    |> Combination.combine(2)
    |> Enum.reduce([pos: 0, neg: 0], fn [v1, v2], [pos: pos, neg: neg] ->
      %Graph.Edge{weight: w} = Graph.edge(g, v2, v1)

      case w do
        1 -> [pos: pos+1, neg: neg]
        -1 -> [pos: pos, neg: neg+1]
      end
    end)
    |> IO.inspect
    |> balanced_tuple()
  end

  defp balanced_tuple([pos: 3, neg: 0]) do
    true
  end

  defp balanced_tuple([pos: 1, neg: 2]) do
    true
  end

  defp balanced_tuple(_) do
    false
  end
end

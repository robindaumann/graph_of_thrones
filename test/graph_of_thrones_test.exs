defmodule GraphOfThronesTest do
  use ExUnit.Case
  doctest GraphOfThrones

  test "graph" do
    input = "6 15
Superman ++ Green Lantern
Superman ++ Wonder Woman
Superman -- Sinestro
Superman -- Cheetah
Superman -- Lex Luthor
Green Lantern ++ Wonder Woman
Green Lantern -- Sinestro
Green Lantern -- Cheetah
Green Lantern -- Lex Luthor
Wonder Woman -- Sinestro
Wonder Woman -- Cheetah
Wonder Woman -- Lex Luthor
Sinestro ++ Cheetah
Sinestro ++ Lex Luthor
Cheetah ++ Lex Luthor"

    assert GraphOfThrones.solve(input)
  end
end

defmodule TermConstTest do
  use ExUnit.Case

  defmodule DumpModule do
    require TermConst

    TermConst.const(:atom_const, do: :test_atom)
    TermConst.const(:express_const, do: 1 + 1)
    TermConst.const(:map_const, do: %{test: 42, test42: :test42})
  end

  test "atom const" do
    assert DumpModule.atom_const() == :test_atom
    assert DumpModule.express_const() == 2
    assert DumpModule.map_const() == %{test: 42, test42: :test42}
  end
end

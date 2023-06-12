defmodule TermConst do
  @moduledoc """
  Documentation for `TermConst`.
  """

  defmacro __using__(_opts) do
    require __MODULE__

    quote do
      import unquote(__MODULE__), only: [const: 2, constp: 2]
    end
  end

  defmacro const(quoted_name, do: quoted_value) do
    name = quoted_name
    caller_moduler = __CALLER__.module

    quote do
      :persistent_term.put({unquote(caller_moduler), unquote(name)}, unquote(quoted_value))

      def unquote(name)() do
        :persistent_term.get({unquote(caller_moduler), unquote(name)})
      end
    end
  end

  defmacro constp(quoted_name, do: quoted_value) do
    name = quoted_name
    caller_moduler = __CALLER__.module

    quote do
      :persistent_term.put({unquote(caller_moduler), unquote(name)}, unquote(quoted_value))

      defp unquote(name)() do
        :persistent_term.get({unquote(caller_moduler), unquote(name)})
      end
    end
  end
end

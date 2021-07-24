defmodule VitaTransfer do
  @moduledoc """
  Documentation for `VitaTransfer`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> VitaTransfer.hello()
      :world

  """
  def main(args \\ []) do
    args
    |> _parse_args()
    |> _validate_from_to()
    |> IO.inspect()
  end

  defp _parse_args(args) do
    {parsed, _remaining, _invalid} =
      OptionParser.parse(args,
        strict: [from: :boolean, to: :boolean, port: :integer, ip: :string, game: :string],
        aliases: [f: :from, t: :to, p: :port, i: :ip, g: :game]
      )

    with_defaults = Keyword.merge([ip: "192.168.2.245", port: 1337], parsed)
    Map.new(with_defaults)
  end

  defp _validate_from_to(%{from: true, to: true}), do: raise("Cannot have both from and to")
  defp _validate_from_to(%{to: true} = args), do: args
  defp _validate_from_to(%{from: true} = args), do: args
  defp _validate_from_to(_args), do: raise("Must have a direction of transfer")
end

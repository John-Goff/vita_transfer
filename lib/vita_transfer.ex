defmodule VitaTransfer do
  @moduledoc """
  Documentation for `VitaTransfer`.
  """
  alias VitaTransfer.FTP

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
    |> FTP.transfer_save()
  end

  defp _parse_args(args) do
    options = [
      from: :boolean,
      to: :boolean,
      port: :integer,
      ip: :string,
      game: :string,
      save_directory: :string
    ]

    {parsed, _remaining, _invalid} =
      OptionParser.parse(args,
        strict: options,
        aliases: [f: :from, t: :to, p: :port, i: :ip, g: :game, s: :save_directory]
      )

    [ip: "192.168.2.245", port: 1337, save_directory: "ux0:/data/retroarch/savefiles"]
    |> Keyword.merge(parsed)
    |> Map.new()
  end

  defp _validate_from_to(%{from: true, to: true}), do: raise("Cannot have both from and to")
  defp _validate_from_to(%{to: true} = args), do: args
  defp _validate_from_to(%{from: true} = args), do: args
  defp _validate_from_to(_args), do: raise("Must have a direction of transfer")
end

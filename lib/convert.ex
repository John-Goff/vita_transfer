defmodule VitaTransfer.Convert do
  # .srm to .sav
  def convert_save(%{to: true, game: game_name}) do
    base_name = Path.rootname(game_name)
    IO.puts("Converting #{base_name}.srm to #{base_name}.sav")
    System.cmd("srm-to-sav.py", ["-i", "#{base_name}.srm", "-o", "#{base_name}.sav"])
  end

  # .sav to .srm
  def convert_save(%{from: true, game: game_name}) do
    base_name = Path.rootname(game_name)
    IO.puts("Converting #{base_name}.sav to #{base_name}.srm")
    File.cp!("#{base_name}.sav", "#{base_name}.srm")
  end
end

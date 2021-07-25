defmodule VitaTransfer.Convert do
  # .srm to .sav
  def convert_save(%{to: true, game: game_name}) do
    base_name = Path.rootname(game_name)
    System.cmd("srm-to-sav.py", ["-i", "#{base_name}.srm", "-o", "#{base_name}.sav"])
  end

  # .sav to .srm
  def convert_save(%{from: true, game: game_name}) do
    base_name = Path.rootname(game_name)
    File.cp!("#{base_name}.sav", "#{base_name}.srm")
  end
end

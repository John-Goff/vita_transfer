defmodule VitaTransfer.Convert do
  # .srm to .sav
  def convert_save(%{to: true}) do
  end

  # .sav to .srm
  def convert_save(%{from: true}) do
  end
end

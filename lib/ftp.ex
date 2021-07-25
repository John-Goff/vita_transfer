defmodule VitaTransfer.FTP do
  def transfer_save(%{from: true} = options) do
    pid = _connect(options)
    :ftp.recv(pid, _file_with_sav(options))
  end

  def transfer_save(%{to: true} = options) do
    pid = _connect(options)
    :ftp.send(pid, _file_with_sav(options))
  end

  def _connect(options) do
    IO.puts("Connecting to #{options.ip}:#{options.port}")
    {:ok, pid} = :ftp.open(String.to_charlist(options.ip), port: options.port)
    IO.puts("Connection established, changing directory")
    :ok = :ftp.cd(pid, String.to_charlist(options.save_directory))
    pid
  end

  def _file_with_sav(%{game: game_name}) do
    base_name = Path.rootname(game_name)
    String.to_charlist(base_name) ++ '.sav'
  end
end

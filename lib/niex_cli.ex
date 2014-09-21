
defmodule NIEx.CLI do
  def main(args) do
    args |> parse |> process
  end

  defp parse(args) do
    args |> OptionParser.parse(switches: switches, aliases: aliases)
  end

  defp switches do
    [help: :boolean,
     without_websockets: :boolean,
     websockets_port: :integer]
  end

  defp aliases do
    [h: :help,
     without_ws: :without_websockets,
     ws_port: :websockets_port]
  end

  defp process({parsed, _argv, _errors}) do
    parsed |> Enum.map(&process_option/1) |> inspect |> IO.puts
  end

  defp process_option({:help, true}) do
    help
  end

  defp process_option({:without_websockets, true}) do
    {:without_websockets, true}
  end

  defp process_option({:websockets_port, port}) do
    {:websockets_port, port}
  end

  defp process_option(_) do
    help
  end

  defp help do
    IO.puts """
    Usage: niex [options]

    Options:
    -ws-port <port>           WebSockets server port. Default is 59248
    --websockets-port=<port>

    -without-ws               Run NIEx without WebSockets server
    --without-websockets

    -h, --help                Help message
    """
    System.halt(0)
  end
end

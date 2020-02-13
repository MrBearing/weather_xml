defmodule WeatherXML.CLI do
  @moduledoc false

  def run(argv) do
    argv
    |> parse_args
    |> process
  end

  @doc """
  `argv` に-h や--helpが入ってたら　:helpアトムを返す
  """
  def parse_args(argv) do
    parse = OptionParser.parse(argv,switches: [help: :boolean], alias: [h: :help])
    case  parse  do
      {[help: true], _ , _}
      -> :help
      {_ , ["list"], _ }
      -> :list
      {_ , [point_code], _ }
      ->point_code
    end
  end

  def process(:list) do
    IO.puts"""
    Not implemented
    """
    System.halt(0)
  end

  def process(:help) do
    IO.puts """
    usage: weather_xml <PointCode>
    """
    System.halt(0)
  end

  def process({point_code}) do
    WetherXML.Web.fetch(point_code)
    |> decode_response
#      |> filter({"weather","tempature_string","wind_string"})
#      |> print_table_for_column
  end

  def decode_response({:ok, body}), do: body

  def decode_response({:error, some})do
    {_, message} = List.keyfind(some, "message",0)
    IO.puts "Error fetching weather : #{message}}"
    System.halt(2)
  end

  def convert_to_list_of_maps(list) do
    list
    |> Enum.map(&Enum.into(&1, Map.new))
  end

  def sort_into_ascending_order(list_of_issues) do
    Enum.sort list_of_issues,
              fn i1 , i2 -> i1["created_at"] <= i2["created_at"] end
  end
end

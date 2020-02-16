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

  def process(point_code) do
    tag_names = ["weather","temperature_string"]
    WeatherXML.Web.fetch(point_code)
    |> Map.get(:body)
    |> filter(tag_names)
    |> print_table(tag_names)
  end

  def decode_response({:ok, body}), do: body
  def decode_response({:error, some})do
    {_, message} = List.keyfind(some, "message",0)
    IO.puts "Error fetching weather : #{message}}"
    System.halt(2)
  end

  def filter(xml,tag_name_list) do
    for t <- tag_name_list do
      filter_with_tag_name(xml,t)
    end
  end

  def filter_with_tag_name(xml,tag_name) do
    String.split(xml,["<#{tag_name}>","</#{tag_name}>"])
    |> Enum.take(2)
    |> tl
    |> hd
  end

  def print_table(string_list,tag_names) do
    WeatherXML.TableFormatter.print_table(string_list,tag_names)
  end

end
defmodule WeatherXML.TableFormatter do
  @moduledoc false

  def print_table(string_list,tag_names) do
    with data = [tag_names,string_list],
        width_list = max_width(data),
        format = make_format(width_list)
      do
      separator(width_list) |> IO.puts
      puts_in_columns(data, format)
      separator(width_list) |> IO.puts
    end
  end

  def make_format(column_width) do
    Enum.map_join(column_width, "|" , fn width -> "~-#{width}s" end ) <> "~n"
  end
  def max_width(columns) do
    for column <- columns, do: column |> Enum.map(&String.length/1) |> Enum.max
  end

  def separator(column_with) do
    Enum.map_join(column_with,"+",fn width -> List.duplicate("-",width) end)
  end
  def puts_in_columns(columns_data , format) do
    columns_data
    |> List.zip
    |> Enum.map(&Tuple.to_list/1)
    |> Enum.each(&puts_one_line_in_columns(&1, format))
  end
  def puts_one_line_in_columns(data, format) do
    :io.format(format,data)
  end

end

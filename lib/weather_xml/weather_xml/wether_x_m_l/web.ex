defmodule WeatherXML.Web do
  @moduledoc false
  require Logger

  def fetch(point_code) do
    Logger.info "Fetch weather XML of #{point_code}}"
    wetherURL(point_code)
    |> HTTPoison.get
  end

  @weather_url Application.get_env(:weather_xml, :weather_url)
  def wetherURL(point_code) do
    "#{@weather_url}/xml/current_obs/#{point_code}.xml"
  end
end

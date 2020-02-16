# WeatherXml

[アメリカ海洋気象庁のサイト](https://w1.weather.gov/xml/current_obs/)からxmlを取得しパース成形するプログラムです。

Programing Elixirの13章の課題プログラムです。

# 動作方法

usage: KTMB

## windows　での実行方法

escript issues elixir-lang elixir 3

## 自分メモ 
mixのプロジェクト全体を再コンパイル
```
iex -S mix
```

テストの実行
```
mix test
```
　
コメントで書いたExampleのテスト
```shell
mix test test/doc_test.exs
```

ドキュメントの生成
```shell
mix docs
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `weather_xml` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:weather_xml, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/weather_xml](https://hexdocs.pm/weather_xml).

## design memo

XMLを取得した際の例 

URL: https://w1.weather.gov/xml/current_obs/KTMB.xml

```xml
<?xml version="1.0" encoding="ISO-8859-1"?> 
<?xml-stylesheet href="latest_ob.xsl" type="text/xsl"?>
<current_observation version="1.0"
	 xmlns:xsd="http://www.w3.org/2001/XMLSchema"
	 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	 xsi:noNamespaceSchemaLocation="http://www.weather.gov/view/current_observation.xsd">
	<credit>NOAA's National Weather Service</credit>
	<credit_URL>http://weather.gov/</credit_URL>
	<image>
		<url>http://weather.gov/images/xml_logo.gif</url>
		<title>NOAA's National Weather Service</title>
		<link>http://weather.gov</link>
	</image>
	<suggested_pickup>15 minutes after the hour</suggested_pickup>
	<suggested_pickup_period>60</suggested_pickup_period>
	<location>Miami, Kendall-Tamiami Executive Airport, FL</location>
	<station_id>KTMB</station_id>
	<latitude>25.64194</latitude>
	<longitude>-80.43472</longitude>
	<observation_time>Last Updated on Feb 10 2020, 11:53 pm EST</observation_time>
        <observation_time_rfc822>Mon, 10 Feb 2020 23:53:00 -0500</observation_time_rfc822>
	<weather>Fair</weather>ie
	<temperature_string>74.0 F (23.3 C)</temperature_string>
	<temp_f>74.0</temp_f>
	<temp_c>23.3</temp_c>
	<relative_humidity>88</relative_humidity>
	<wind_string>East at 12.7 MPH (11 KT)</wind_string>
	<wind_dir>East</wind_dir>
	<wind_degrees>110</wind_degrees>
	<wind_mph>12.7</wind_mph>
	<wind_kt>11</wind_kt>
	<pressure_string>1021.4 mb</pressure_string>
	<pressure_mb>1021.4</pressure_mb>
	<pressure_in>30.16</pressure_in>
	<dewpoint_string>70.0 F (21.1 C)</dewpoint_string>
	<dewpoint_f>70.0</dewpoint_f>
	<dewpoint_c>21.1</dewpoint_c>
	<visibility_mi>10.00</visibility_mi>
 	<icon_url_base>http://forecast.weather.gov/images/wtf/small/</icon_url_base>
	<two_day_history_url>http://www.weather.gov/data/obhistory/KTMB.html</two_day_history_url>
	<icon_url_name>nskc.png</icon_url_name>
	<ob_url>http://www.weather.gov/data/METAR/KTMB.1.txt</ob_url>
	<disclaimer_url>http://weather.gov/disclaimer.html</disclaimer_url>
	<copyright_url>http://weather.gov/disclaimer.html</copyright_url>
	<privacy_policy_url>http://weather.gov/notice.html</privacy_policy_url>
</current_observation>
```
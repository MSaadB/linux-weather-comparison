# linux-weather-comparison
Historical Weather Forecast Comparison to Actuals

A bash script that will run every day at noon to scrap historical weather data from a specified city and list it with the current weather.

A POC weather report log file contains a growing history of the daily weather data that will be scraped.

The weather report will be downloaded from wttr.in

*Shell commands are used to extract only the data needed (the signal)
*Everything else is filtered out (the noise)
*The filters are combined into a pipeline (the use of pipes to chain filters together)

Credits:
IBM,
Jeff Grossman,
Rav Ahuja

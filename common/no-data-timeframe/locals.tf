locals {
  # mapping between timeframe unit and multiplicator to convert in minutes
  map_unit = {
    m = 2
    h = 120
    d = 2880
  }

  # no data timeframe value calculation in minutes
  no_data_timeframe = "${replace(var.timeframe, "/last_(\\d+)\\w/", "$1") * lookup(local.map_unit, replace(var.timeframe, "/last_\\d+(\\w)/", "$1"))}"
}

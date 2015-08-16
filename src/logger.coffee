colors = require('colors/safe')

Logger = (level) ->
  if this not instanceof Logger then return new Logger(level)

  @level = level or 0
  @types =
    debug:
      level: 4
      color: colors.magenta
    info:
      level: 3
      color: colors.blue
    warn:
      level: 2
      color: colors.yellow
    error:
      level: 1
      color: colors.red

  @bindLogTypes()

Logger.prototype.bindLogTypes = ->
  Object.keys(@types).forEach (type) =>
    @[type] = (message) =>
      if @level >= @types[type].level
        console.log(@types[type].color("{#{type}} ") + message)

module.exports = Logger
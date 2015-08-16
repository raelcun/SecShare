EventEmitter = require('events').EventEmitter

FakeStorage = ->
  @data = {}
  return

FakeStorage::get = (key, cb) ->
  if not @data[key]? then return cb(new Error('not found'))
  cb(null, @data[key])

FakeStorage::put = (key, val, cb) ->
  @data[key] = val
  cb(null, @data[val])

FakeStorage::del = (kev, cb) ->
  delete @data[key]
  cb(null)

FakeStorage::createReadStream = ->
  return new EventEmitter()

module.exports = FakeStorage
require('source-map-support').install()

kad = require('kad')
logger = require('./logger')
FakeStorage = require('./fakeStorage')
_ = require('lodash')
functions = require('./functions')
crypto = require('./crypto')

keys = crypto.generateKeyPair()

encrypted = crypto.encrypt('super secret data', keys.public)
console.log 'encrypted', encrypted

decrypted = crypto.decrypt(encrypted, keys.private)
console.log 'decrypted', decrypted


# keys = functions.createSessionKeyPair()

# console.log 'private', keys.private
# pub = ursa.createPublicKey(keys.public, 'base64')
# priv = ursa.createPrivateKey(keys.private, '', 'base64')

# encrypted = pub.encrypt('test data', 'utf8', 'base64')
# console.log('encrypted', encrypted)

# decrypted = priv.decrypt(encrypted, 'base64', 'utf8')
# console.log('decrypted', decrypted)



# nodeOpts = []
# for i in [0..3]
#   nodeOpts.push {
#     address: '127.0.0.1'
#     port: 3100 + i
#     storage: new FakeStorage()
#     transport: kad.transports.TCP
#     nodeID: kad.utils.createID("node #{i}")
#     logLevel: 3
#   }

# nodes = nodeOpts.map (options) -> return kad(options)

# joinNodesPromise = _.slice(nodes, 1).map (node, i) ->
#   return new Promise (resolve, reject) ->
#     node.connect(nodeOpts[i]['address'], nodeOpts[i]['port'], resolve)

# Promise
#   .all(joinNodesPromise)
#   .then ->
#     console.log 'all nodes joined'
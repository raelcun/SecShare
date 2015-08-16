ursa = require('ursa')

module.exports =
  generateKeyPair: ->
    key = ursa.generatePrivateKey(2048)
    return { public: key.toPublicPem('base64'), private: key.toPrivatePem('base64') }

  encrypt: (data, publicKey) ->
    return ursa.createPublicKey(publicKey, 'base64').encrypt(data, 'utf8', 'base64')

  decrypt: (data, privateKey) ->
    return ursa.createPrivateKey(privateKey, '', 'base64').decrypt(data, 'base64', 'utf8')
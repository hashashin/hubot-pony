Helper = require('hubot-test-helper')
expect = require('chai').expect
helper = new Helper('./../src/pony.coffee')

class MockResponse extends Helper.Response
  random: (items) ->
    "Going for a ride: https://www.youtube.com/watch?v=JSUBuVdkskA"


describe 'pony', ->
  room = null

  beforeEach ->
    room = helper.createRoom({'response': MockResponse})

  afterEach ->
    room.destroy()

  context 'user says "pony"', ->
    beforeEach ->
      room.user.say 'alice', 'pony'

    it 'should respond with a video', ->
      expect(room.messages[1]).to.eql ['hubot', 'Going for a ride: https://www.youtube.com/watch?v=JSUBuVdkskA']

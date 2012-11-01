require 'dino'

board = Dino::Board.new(Dino::TxRx.new)
led = Dino::Components::Led.new(pin: 13, board: board)
switch = :off
led.send(switch)


SCHEDULER.every '5s' do
  switch =
    if switch == :off
      :on
    else
      :off
    end

  led.send(switch)

  send_event('led', { text: "LED is #{switch}" })
end

# frozen_string_literal: true

class Base

  def initialize(packet)
    @packet = packet
    @was_removed ||= false
  end

  def analyze
    raise NotImplementedError
  end

  def removed_packet
    return @packet if @was_removed
    @was_removed = true
    @packet.slice!(0..13)
    @packet
  end
end

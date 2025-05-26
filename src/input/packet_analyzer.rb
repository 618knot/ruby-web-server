# frozen_string_literal: true

require_relative "protocol_analyzers/ether"

class PacketAnalyzer

  def initialize(packet)
    @packet = packet
  end

  def analyze
    ether = ProtocolAnalyzers::Ether.new(@packet)
    ether.analyze

    @packet = ether.removed_packet
  end
end

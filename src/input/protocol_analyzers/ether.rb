# frozen_string_literal: true

require_relative 'base'

module ProtocolAnalyzers
  class Ether < Base
    attr_reader :dst_mac, :src_mac, :type

    def analyze
      @dst_mac = @packet.slice(0..5)
      @src_mac = @packet.slice(6..11)
      @type = EtherTypes::STR_HASH[hex_type(@packet.slice(12..13))] || "Unknown"

      @packet.slice!(0..13)
    end

    private

    def hex_type(type)
      hex_type = type.map { |byte| byte.to_s(16).rjust(2, "0") }
      hex_type.join.to_i(16)
    end

    module EtherTypes
      # @note net/ethernet.h
      PUP = 0x0200.freeze # Xerox PUP
      IP = 0x0800.freeze # IPv4
      ARP = 0x0806.freeze # Address resolution
      REVARP = 0x8035.freeze # Reverse ARP
      IPv6 = 0x86dd.freeze # IPv6

      STR_HASH = {
        PUP => "Xerox PUP",
        IP => "IPv4",
        ARP => "Address resolution",
        REVARP => "Reverse ARP",
        IPv6 => "IPv6",
    }.freeze
    end
  end
end

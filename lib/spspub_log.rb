#!/usr/bin/env ruby

# file: spspub_log.rb

require 'sps-pub'


class SPSPubLog < SPSPub
  
  def initialize(host: 'sps', address: host, port: '59000', topic: 'log')
    super(host: host, address: host, port: port)
    @topic = topic
    sleep 0.05
  end

  def debug(raw_msg)
    pub_msg raw_msg
  end

  def info(raw_msg)
    pub_msg raw_msg, :info
  end

  private

  def pub_msg(s, label=:debug)
    msg, topic = s.split(/ *: */,2).reverse
    fqm = [@topic, topic, label.to_s].compact.join('/') + ': ' + msg
    notice(fqm)
  end

end

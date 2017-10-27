#!/usr/bin/env ruby

# file: spspub_log.rb

require 'sps-pub'


class SPSPubLog < SPSPub
  
  def initialize(host: 'sps', address: host, port: '59000', topic: 'log', 
                 charlimit: 140)
    super(host: host, address: host, port: port)
    @topic, @charlimit = topic, charlimit
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
    
    fullmsg, topic = s.split(/ *: */,2).reverse
    msg = fullmsg.length <= @charlimit ? fullmsg : fullmsg[0..@charlimit - 3] + '...'
    fqm = [@topic, topic, label.to_s].compact.join('/') + ': ' + msg
    
    notice(fqm)
  end

end

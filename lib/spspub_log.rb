#!/usr/bin/env ruby

# file: spspub_log.rb

require 'sps-pub'


class SPSPubLog
  

  
  module Severity
    # Low-level information, mostly for developers.
    DEBUG = 0
    # Generic (useful) information about system operation.
    INFO = 1
    # A warning.
    WARN = 2
    # A handleable error condition.
    ERROR = 3
    # An unhandleable error that results in a program crash.
    FATAL = 4
    # An unknown message that should always be logged.
    UNKNOWN = 5
  end
  
  DEBUG   = Severity::DEBUG
  INFO    = Severity::INFO
  WARN    = Severity::WARN
  ERROR   = Severity::ERROR
  FATAL   = Severity::FATAL
  UNKNOWN = Severity::UNKNOWN  
  
  attr_accessor :level
  
  
  def initialize(host: 'sps', address: host, port: '59000', topic: 'log', 
                 charlimit: 280, level: Severity::DEBUG, subtopic: '')
        
    @sps = SPSPub.new(host: host, address: host, port: port)
    
    @level = set_level level
    
    @topic, @charlimit, @subtopic = topic, charlimit, subtopic
    sleep 0.05
  end

  def debug(raw_msg)
    return if @level > Severity::DEBUG  
    pub_msg raw_msg
  end
  
  def error(raw_msg)
    return if @level > Severity::ERROR  
    pub_msg raw_msg, :error
  end

  def fatal(raw_msg)
    return if @level > Severity::FATAL  
    pub_msg raw_msg, :fatal
  end  

  def info(raw_msg)
    return if @level > Severity::INFO  
    pub_msg raw_msg, :info
  end
  
  def level()
    @level
  end
  
  def level=(val)
    @level = set_level val
  end  
  
  def unknown(raw_msg)
    pub_msg raw_msg, :unknown
  end  

  private

  def pub_msg(s, label=:debug)
    
    fullmsg, topic = s.split(/ *: */,2).reverse
    msg = fullmsg.length <= @charlimit ? fullmsg : \
        fullmsg[0..@charlimit - 3] + '...'
    fqm = [@topic, label.to_s, topic || @subtopic].compact.join('/') + ': ' \
        + msg
    
    @sps.notice(fqm)
  end
  
  def set_level(level)
    
    if level.is_a? Symbol then
      %i(debug info warn error fatal unknown).zip(0..5).to_h[level]
    else
      level
    end    
    
  end

end

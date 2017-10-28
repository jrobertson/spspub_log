# Introducing the spspub_log gem

    require 'spspub_log'

    sps = SPSPubLog.new host: '192.168.4.170'
    sps.info 'ready'
    sps.info 'example1: ready'

    sps.debug 'RobotArm/elbow_move/error: supplied 2 arguments, expecting 1 argument'


Output (observed from an SPS subscriber to topic #):

Messages displayed in reverse chronological order:

<pre>
MESSAGE: log/RobotArm/elbow_move/error/debug: supplied 2 arguments, expecting 1 argument
MESSAGE: log/example1/info: ready
MESSAGE: log/info: ready
</pre>

## Resources 

* spspub_log https://rubygems.org/gems/spspub_log

spspublog sps pub log gem debug info

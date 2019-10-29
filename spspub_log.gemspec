Gem::Specification.new do |s|
  s.name = 'spspub_log'
  s.version = '0.2.0'
  s.summary = 'Publishes log messages instead of logging ' + 
      'them to file. #debug #debugging #trace'
  s.authors = ['James Robertson']
  s.files = Dir['lib/spspub_log.rb']
  s.add_runtime_dependency('sps-pub', '~> 0.5', '>=0.5.5')
  s.signing_key = '../privatekeys/spspub_log.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@jamesrobertson.eu'
  s.homepage = 'https://github.com/jrobertson/spspub_log'
end

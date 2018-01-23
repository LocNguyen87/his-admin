require 'parse/stack'

# Set your specific Parse keys in your ENV. For all connection options, see
# https://github.com/modernistik/parse-stack#connection-setup
Parse.setup app_id: 'his-server',
        master_key: 'v0ncala1',
        server_url: 'http://his-server.herokuapp.com/api'
        # optional
        #    logging: false,
        #      cache: Moneta.new(:File, dir: 'tmp/cache'),
        #    expires: 1 # cache ttl 1 second

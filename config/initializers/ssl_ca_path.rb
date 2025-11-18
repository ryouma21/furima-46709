ca_file = '/etc/ssl/certs/ca-certificates.crt'
ca_dir  = '/etc/ssl/certs'

ENV['SSL_CERT_FILE'] ||= ca_file
ENV['SSL_CERT_DIR']  ||= ca_dir

require 'openssl'

OpenSSL::SSL::SSLContext::DEFAULT_PARAMS[:ca_file] = ca_file
OpenSSL::SSL::SSLContext::DEFAULT_PARAMS[:ca_path] = ca_dir
OpenSSL::SSL::SSLContext::DEFAULT_PARAMS[:verify_mode] = OpenSSL::SSL::VERIFY_PEER

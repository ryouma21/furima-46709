ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../Gemfile", __dir__)

require "bundler/setup" # Set up gems listed in the Gemfile.
require "bootsnap/setup" # Speed up boot time by caching expensive operations.

require 'cgi'
begin
  CGI.accept_charset = 'UTF-8'
rescue NameError
  # Ruby 3.2 の未定義クラス変数ケースに備え、強制初期化
  CGI.send(:class_variable_set, :@@accept_charset, 'UTF-8')
end
RAILS_GEM_VERSION = '2.3.8' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  
  config.time_zone = 'UTC'
  config.i18n.default_locale = :es
  config.action_controller.session_store = :active_record_store
  #config.gem 'googlecharts'
end
#require "will_paginate"
#require "gchart"
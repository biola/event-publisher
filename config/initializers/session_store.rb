# Be sure to restart your server when you modify this file.

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information

# TODO: Having problems with Mongoid session store. Using cookies for now
# require 'rack-cas/session_store/rails/mongoid'
# EventPublisher::Application.config.session_store :rack_cas_mongoid_store

Rails.application.config.session_store :cookie_store, key: '_event-publisher_session'

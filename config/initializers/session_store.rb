# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_FlexiStock_session',
  :secret      => 'a9fdf420acc786ae3e39017f9d4715bb4ea0f54b1ddd07fb25c5f4af3272c457a28286bf94e6f3410c18f2f8245b8a34c14449bc4750d87faacc3bf9ea5103ee'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

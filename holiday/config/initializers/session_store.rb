# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_holiday_session',
  :secret      => '9466a12509c96c548ef0cb38ddd8d500186b9680dc7db846422deb94d6f428c7e25d44ddc005c0647b070dfd9ccdd0fde95395301d62b4a5a3e549bb7720d687'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :clock, ClockWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "FkIX9/LyfjQR2Mx0AWn+5yI3yxq0o6smEWw9cydEO7oWxyjfnGFJF59nQbq+rP85",
  server: false

# In test we don't send emails.
config :clock, Clock.Mailer,
  adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

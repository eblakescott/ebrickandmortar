Rails.configuration.stripe = {
  :publishable_key => ENV['pk_test_xnq5nucYpEcGXsJsm9FaVkfs Roll Key'],
  :secret_key      => ENV['SECRET_KEY=sk_bar rails s']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]


if Rails.env.production?
    Rails.configuration.stripe = {
      publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
      secret_key: ENV['STRIPE_SECRET_KEY']
    }
  else
    Rails.configuration.stripe = {
      publishable_key: 'pk_test_ZvSUEMBoGjOpl2vzcHOLUJQX00HtonpmR2',
      secret_key: 'sk_test_vQWVEYZRuCIwqtMI4ctiBSjg00j8zV0zb0'
    }
  end
  
  Stripe.api_key = Rails.configuration.stripe[:secret_key]
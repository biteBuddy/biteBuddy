require('dotenv').config();
const stripe = require('stripe')(process.env.STRIPE_API_KEY);
const makePayment = async (req, res) => {
  // Use an existing Customer ID if this is a returning customer.

  const paymentIntent = await stripe.paymentIntents.create({
    amount: 1099,
    currency: 'usd',
    automatic_payment_methods: {
      enabled: true,
    },
  });

  res.json({
    paymentIntent: paymentIntent.client_secret,
    publishableKey:
      'pk_test_51MSI9dAkl1eBY46uH19GDjulKm1oXQpLQO7CkPd5Qk9JBHtqOoVWpwaCg5t4e1XEeUIlbRCI5ha4K0bUAOyw5TRN00WWl2by6U',
  });
};

module.exports = { makePayment };

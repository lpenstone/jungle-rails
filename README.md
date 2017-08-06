# Jungle

A mini e-commerce application built with Rails 4.2.

## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Run `bin/rake db:reset` to create, load and seed database
4. Create .env file based on .env.example
5. Sign up for a Stripe account
6. Put Stripe (test) keys into appropriate .env vars
  - Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.
7. Run `bin/rails s -b 0.0.0.0` to start the server
8. Visit http://localhost:3000/ in your browser
9. Visit http://localhost:3000/letter_opener/ to view the e-mail simulation.

## Dependencies

* Rails 4.2
* PostgreSQL 9.x
* Stripe

## Screenshots
### Homepage:
!["Homepage"](https://github.com/lpenstone/jungle-rails/blob/master/screenshots/jungle-homepage.png?raw=true)
### Product details
- Read reviews
- Log in to leave a review
- Delete your posted reviews
!["Product details"](https://github.com/lpenstone/jungle-rails/blob/master/screenshots/jungle-product-details.png?raw=true)
### View cart
- Edit quantites
- Remove items
- View total cost of the order
!["View cart"](https://github.com/lpenstone/jungle-rails/blob/master/screenshots/jungle-cart.png?raw=true)
### Review order after payment
!["Review orders after payment"](https://github.com/lpenstone/jungle-rails/blob/master/screenshots/jungle-order-review.png?raw=true)
### View the sent order emails
!["View the sent order emails"](https://github.com/lpenstone/jungle-rails/blob/master/screenshots/jungle-email.png?raw=true)
### Admin permission: editing products
!["Admin permission: editing products"](https://github.com/lpenstone/jungle-rails/blob/master/screenshots/jungle-products.png?raw=true)
### Admin permission: editing categories
!["Admin permission: editing categories"](https://github.com/lpenstone/jungle-rails/blob/master/screenshots/jungle-categories.png?raw=true)









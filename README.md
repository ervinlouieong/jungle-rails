# Jungle

Jungle is built with Ruby on Rails and uses Stripe for credit cards. Project was to fix and add features in a mini e-commerce app that allows users to login and buy items from the site.

This project more so a simulation of the real world where you inherit an existing code base in a language / framework that you are not comfortable with.

## Features added and bugs fixed

* Feature: Sold Out Badge
* Feature: Admin Categories
* Feature: User Authentication
* Enhancement: Order Details Page
* Feature: Email Receipt
* Bug: Missing Admin Security
* Bug: Checking Out with Empty Cart
* Feature: Product Rating

## Screenshots

!["Screenshot of the home page"](https://github.com/ervinlouieong/jungle-rails/blob/master/docs/home_page.png)
!["Screenshot of the admin authentication"](https://github.com/ervinlouieong/jungle-rails/blob/master/docs/admin_authentication.png)
!["Screenshot of a specific order page"](https://github.com/ervinlouieong/jungle-rails/blob/master/docs/specific_order_page.png)
!["Screenshot of the cart page with no item"](https://github.com/ervinlouieong/jungle-rails/blob/master/docs/cart_page_with_no_item.png)
!["Screenshot of a product page with review"](https://github.com/ervinlouieong/jungle-rails/blob/master/docs/product_page_with_reviews.png)

## Setup

1. Fork and clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db.
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server
10. Go to <http://localhost:3000/> in your browser.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

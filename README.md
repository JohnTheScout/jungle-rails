# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of learning Rails by example.

This project started as an inherited code base. I added sold out labels, user accounts, order reciepts and email reciepts, admin authentication with HTTP basic auth, product rating features, and a proper CDN for images.

You can view the site at https://whispering-lake-55007.herokuapp.com/

## Screenshots

![main_page](/screenshots/main.png)
![categories](/screenshots/category.png)
![categories](/screenshots/category2.png)
![product_description](/screenshots/product-description.png)
![review_logged_out](/screenshots/review-logged-out.png)
![review_logged_in](/screenshots/review-logged-in.png)

Register page validates and displays an error when something isn't right
![register](/screenshots/register-w-error.png)
![login](/screenshots/login.png)
![cart-empty](/screenshots/cart-empty.png)
![cart-full](/screenshots/cart-full.png)
![order](/screenshots/order.png)
![order](/screenshots/order2.png)

Emails sent in html...
![email-html](/screenshots/email_html.png)
![email-html](/screenshots/email_html2.png)

and in plain text
![email-text](/screenshots/email_text.png)

All admin pages is protected by http basic authentication
![admin-dashboard](/screenshots/admin-dashboard.png)
![admin-products](/screenshots/admin-products.png)
![admin-categories](/screenshots/admin-categories.png)

## Running this site

1. Clone this repo to your machine
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

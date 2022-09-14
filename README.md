# Planty

This is an mvp webstore, written in ruby on rails and hosted on Heroku.
This app allows users to buy and sell plant cuttings from people in there community.

> Live demo [_here_](http://planty-le-wagon.herokuapp.com/). <!-- If you have the project hosted somewhere, include the link here. -->

## Table of Contents

- [General Info](#general-information)
- [Technologies Used](#technologies-used)
- [Features](#features)
- [Setup](#setup)
- [Project Status](#project-status)
- [Room for Improvement](#room-for-improvement)
- [Acknowledgements](#acknowledgements)
- [Contact](#contact)
<!-- * [License](#license) -->

## General Information

- This is an mvp webstore, written in ruby on rails and hosted on Heroku.
- This app allows users to list plants to sell and allows buys to find sellers in there area selling a wide range of plant clippings.
- This project was completed as part of the Le Wagon fullstack developer bootcamp and served as an opportunity to develop my skills in:

* ruby on rails
* javascript
* scss
* javascript libraries
* git version control
* user authentication
* REST APIs
* production deployment
* implementation of image hosting services

## Technologies Used

- Rails 6.1.5.1 - Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates)
- Ruby 3.0.3
- yarn 1.22.17
- SCSS
- [_typed_js_](https://mattboldt.com/demos/typed-js/)
- Cloudinary image hosting
- [_devise_](https://github.com/plataformatec/devise/)
- [_Mapbox api_](https://www.mapbox.com/)
- [_Stripe Api_](https://stripe.com/)
- jQuery
- bootstrap 5
- font-awesome 6
- PostgreSQL 12

## Features

- Create/edit plant listings
- Find plant cuttings for sale in your area using Mapbox API
- Purchase multiple plant cuttings from various sellers
- Checkout and pay with credit card via Stripe API
- Review your purchases
- View all your plants bought, sold and listed on your dashboard

## Setup

You will need Ruby 3.0.3 and Rails 6.1.5.1. Both can be installed via rbenv
You will also need a Cloudinary account (free is sufficient)
Download/Fork/Clone the repo and cd into the repo root directory in your terminal

To check that you have the correct ruby version run:
`ruby --version`

Run: `touch .env` followed by `echo '.env*' >> .gitignore`
and add your cloudinary api to the .env file `CLOUDINARY_URL=cloudinary://2985**************D-***********************8`
Add your mapbox api key to .env file `MAPBOX_API_KEY=pk.eyJ1IjoicGR1b****************yZvNpTR_kk1kKqQ`
Add your stripe keys to the .env file `STRIPE_PUBLISHABLE_KEY=***********************` and `STRIPE_SECRET_KEY=******************`

Then run:
`bundle install`
to install the required gems

Run:
`yarn install`
to install the js packages

Run:
`rails db:create`
`rails db:migrate`
`rails db:seed`
to set up your database

Run:
`rails s`
to start a local rails server

## Project Status

Project is: _in progress_

## Room for Improvement

To do:

- Adding user favourites
- Add Ajax to search
- Add user authentication
- Fix bugs related to managing stock quantity
- Add notifications

## Acknowledgements

- This project was a created as part of the Le Wagon Bootcamp with the help of Le Wagon Teaching Assistants

## Contact

Created by [_Cerulean-Ash_](https://cerulean-ash.github.io/portfolioV2/), [_k0sa7a_](https://github.com/k0sa7a), [_dora13l_](https://github.com/dora13l) and [_piresgabriel_](https://github.com/piresgabriel) - Feel free to contact us!

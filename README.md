== Elf0News

This is an HackerNews news aggregator.

== Setup

The application uses Gmail SMTP to send emails.
You need to setup your gmail credentials into your environment if you want to send emails.

You can do it this way:

    $ export GMAIL_USER="your_gmail_username@gmail.com"
    $ export GMAIL_PASS="your_gmail_password"

As usual, after cloning the app, run `bundle install`. Usage of a RVM gemset is highly recommended.

== Usage

* Use the "Lookup from HackerNews" link to load the current homepage news from the HN API
* enter your email and click "Send top links" to receive the top links in your inbox
* if you want to delete all links and start from scratch use the "Destroy all" link

== Technical notes

* application tests are available in the `spec/` folder. Run them with `bundle exec rspec spec`
* I used the [VCR](https://github.com/myronmarston/vcr) gem to cache requests to the HN API in my test environment.
* Emails are currently being sent only in plain-text format, however they could be easily written in HTML using the [Roadie](https://github.com/Mange/roadie) gem
* I used the [Email Veracity](https://github.com/heycarsten/email-veracity) gem to validate email addresses
* I used the [Faraday](https://github.com/technoweenie/faraday) gem to handle HTTP requests and mock them in some of my spec files
* I used the [Nifty Generators](https://github.com/ryanb/nifty-generators) by Ryan Bates to have a decent layout... well, almost :)


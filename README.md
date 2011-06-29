Validatious -- A collection of delicious Rails validators
=========================================================

## DESCRIPTION

No matter what app you are working on, Rails never seems to include all the
validations you need, and you end having to repeat yourself over and over by
writing regex validations and/or custom validators.

Validatious solves this problem by packaging up all these often used, but
missing Rails validators, into one single RubyGem.


## INSTALLATION

The best way to install Validatious is with RubyGems:

    $ [sudo] gem install validatious

If you're installing from source, you can use [Bundler][bundler] to pick up all the
gems:

    $ bundle install # ([more info](http://gembundler.com/bundle_install.html))

[bundler]: http://gembundler.com/


## USAGE

All the validators in Validatious are designed to work with Rails 3 and up, and
take advantage of ActiveModel::Validator. This means that they are all used in the
usual Rails way:

    validates :url, :url => true
    
The old Rails 2 style validations are also supported:

    validates_url_format_of :url
    
    
## Validations

Validatious currently provides the following validators:


### URL

This validates the format of a URL, ensuring that the attribute conforms to the
correct format of a URL.

    validates :url, :url => true  

or

    validates_url_format_of :url
    
    
### Email

This validates the format of an email address, ensuring that the attribute conforms
to the correct format of an email address.

    validates :email, :email => true  

or

    validates_email_format_of :email


## CONTRIBUTE

If you'd like to hack on Validatious, start by forking my repo on GitHub:

http://github.com/joelmoss/validatious

To get all of the dependencies, install the gem first. The best way to get
your changes merged back into core is as follows:

1. Clone down your fork
1. Create a thoughtfully named topic branch to contain your change
1. Hack away
1. Add tests and make sure everything still passes by running `rake`
1. If you are adding new functionality, document it in the README
1. Do not change the version number, I will do that on my end
1. If necessary, rebase your commits into logical chunks, without errors
1. Push the branch up to GitHub
1. Send a pull request to the joelmoss/validatious project.
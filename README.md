# Datepicker508

TODO: Description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'datepicker_508'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install datepicker_508
    
### Library Includes

In application.js:

```
//= require datepicker
//= require jquery.mask
```

In application.scss:

```
 *= require datepicker
```

## Usage


### CSS Setup
TODO: CSS Setup

### JS Setup
TODO: JS Setup
```
function onLoadDatePickers() {
  // This function contains setup parameters for site wide datepickers.
  // Datepicker text field ID name and button title should be added below. The button title must be unique for 508 requirements.
  var datePickers = [
    { name: '#application_submitted_on_lt', title: 'Your Title Here' },
    { name: '#birthdate', title: 'Select Birth Date' }
  ];

  for ( var datePicker = 0; datePicker < datePickers.length; datePicker++ ) {
    $(datePickers[datePicker]['name']).mask("99-99-9999").datepicker({
      weekDayFormat: 'narrow',
      inputFormat: 'MM-DD-YYYY',
      outputFormat: 'MM-dd-yyyy',
      buttonTitle: datePickers[datePicker]['title']
    });
  };

  clearNilDatePickers();
}

function clearNilDatePickers() {
  if ( $.inArray( $('input#passport_expires_on_lt').val(), [ '----', '--' ] ) > - 1 ) $('input#passport_expires_on_lt').val('');
  if ( $.inArray( $('input#birthdate').val(), [ '----', '--' ] ) > - 1 ) $('input#birthdate').val('');
}


```


## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/datepicker_508. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


Datepicker508
====
[gem]: https://rubygems.org/gems/datepicker_508


Description
-----------
Datepicker_508 is a 508 compliant (accessible for the visually impaired) datepicker. It leverages the AB-Datepicker library by Jacques Archimède. Included is input masking based off jquery.mask.js by Igor Escobar.

Installation
------------

Add this line to your application's Gemfile:

```ruby
gem 'datepicker_508'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install datepicker_508
    
If you are using turbolinks and including asset trees, no more installation setup is required. I will be adding a generator as an option to automatically include manifest file libraries.

In application.js:

```
//= require datepicker
//= require jquery.mask
```

In application.scss:

```
 *= require datepicker
```

Usage
-----

Basic usage with included mask:

```
var datePickers = [
  { name: '#datepickerOne', title: 'Example datepicker 1' },
  { name: '#datepickerTwo', title: 'Example datepicker 2' }
];

for ( var datePicker = 0; datePicker < datePickers.length; datePicker++ ) {
  $(datePickers[datePicker]['name']).mask("99-99-9999").datepicker({
    weekDayFormat: 'narrow',
    inputFormat: 'MM-DD-YYYY',
    outputFormat: 'MM-dd-yyyy',
    buttonTitle: datePickers[datePicker]['title']
  });
};
```

Contributing
------------

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/datepicker_508.

License
-------

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


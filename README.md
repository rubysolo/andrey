# Andrey

Generate pseudopronounceable random words based on bigram frequency
distributions

## Installation

It's a gem, sooo...

## Usage

From the command line:

    andrey generate
    # => genespha

From your code:

    Andrey::Word.generate(5)
    # => 'gatiz'

Want to customize the Markov model to make the words sound different?  (Y U NO
LIKE ENGLISH?)  Make a new language file, and generate the probability map via:

    andrey analyze /path/to/klingon-opera.txt

## Why 'Andrey'?

For [Andrey Markov](http://en.wikipedia.org/wiki/Andrey_Markov).  And also
because And-rey is "rand()" in pig-latin.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

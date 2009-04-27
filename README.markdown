# eye

Determine whether you've seen an object before.

    require 'eye'
    eye = Eye.new
    eye.see value
    if eye.seen? value
      # ...
    end

## Installation

Ensure GitHub is added as a Gem source:

    sudo gem sources -a http://gems.github.com

Then:

    sudo gem install runpaint-eye

## Description

Eye is a simple class to abstract the task of keeping track of values you've
encountered previously.

Traditionally we would use a Hash for this task, for example:

    eye = Hash.new(0)
    eye[value] += 1
    if eye.key? value
      # ...
    end

This works, but is imperfect:

* It's a clunky idiom because you're forced to be concerned with Hash keys and
incrementing values purely for their side effects. Precisely how you keep
track of seen values should merely be an implementation detail.
* If you want to change the data structure, you have to change all of the
`eye[value] += `/`eye.key? value` references to whatever your new data
structure requires. This is annoying and introduces the possibility of errors.
* It requires you to keep the data structure in memory, which means your
program's memory usage will increase with the size of the data set. If you
switch to a disk-based solution you'll need to decide on a new approach, then
change all the logic mentioned previously.
* It offers no easy way of constraining the size of the data structure,
specifying how values should be compared for seenness, or, indeed, having any
control over the process.

Eye is an in-progress attempt at solving these problems by providing a general
abstract interface, and allowing you to switch data structures / options by
changing one line of code.

### Types of Eye

By default Eye uses a Hash to manage the collection of seen items. It also
supports Arrays and [Bloom Filters](http://en.wikipedia.org/wiki/Bloom_filter).

    Eye.new(:type => :array) # Use an Array
    Eye.new(:type => :bloom_filter) # Use a Bloom Filter

#### Bloom Filter

The Bloom Filter type requires the _bloomfilter_ Gem to be installed. Its
size can be adjusted by passing a Fixnum as the second argument of the
constructor. Please don't use this type unless you understand the data
structure's tradeoffs; otherwise you could get confused. ;-)

## Copyright

Copyright (c) 2009 _Run Paint Run Run_ under the GPL v3. See LICENSE for details.

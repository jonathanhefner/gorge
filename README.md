# gorge

Convenient access to Ruby's Digest module via extensions to Ruby core
objects.  *gorge* also provides an idiomatic `Digest::CRC32` wrapper
over the CRC32 functionality provided by Ruby's built-in Zlib module.


## API

- [Digest](http://www.rubydoc.info/gems/gorge/Digest/Instance)
  - [#io](http://www.rubydoc.info/gems/gorge/Digest%2FInstance:io)
- [Digest::CRC32](http://www.rubydoc.info/gems/gorge/Digest/CRC32)
- [Pathname](http://www.rubydoc.info/gems/gorge/Pathname)
  - [#file_crc32](http://www.rubydoc.info/gems/gorge/Pathname:file_crc32)
  - [#file_md5](http://www.rubydoc.info/gems/gorge/Pathname:file_md5)
  - [#file_sha1](http://www.rubydoc.info/gems/gorge/Pathname:file_sha1)
  - [#file_sha256](http://www.rubydoc.info/gems/gorge/Pathname:file_sha256)
- [String](http://www.rubydoc.info/gems/gorge/String)
  - [#crc32](http://www.rubydoc.info/gems/gorge/String:crc32)
  - [#md5](http://www.rubydoc.info/gems/gorge/String:md5)
  - [#sha1](http://www.rubydoc.info/gems/gorge/String:sha1)
  - [#sha256](http://www.rubydoc.info/gems/gorge/String:sha256)


## Installation

Install from [Ruby Gems](https://rubygems.org/gems/gorge):

```bash
$ gem install gorge
```

Then require in your Ruby script:

```ruby
require "gorge"
```


## Contributing

Run `rake test` to run the tests.  You can also run `rake irb` for an
interactive prompt that pre-loads the project code.


## License

[MIT License](https://opensource.org/licenses/MIT)

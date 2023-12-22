# Sugar for Crystal

Some syntactic (and maybe API) sugar for Crystal programs.

- [Installation](#installation)
- [Usage](#usage)
  - [Lazy variables](#lazy-variables)
- [Contributing](#contributing)
- [License](#license)
- [Contributors](#contributors)

## Installation

1. Add the dependency to your project's `shard.yml`:

   ```yaml
   dependencies:
     sugar:
       github: nogginly/sugar.cr
   ```

2. Run `shards install`

## Usage

### Lazy variables

```cr
require 'sugar'

include Sugar

class Num(T)
  def initialize(@value : T); end

  lazy square : T { @value.abs2 }

  lazy twice : T do
    @value * 2
  end
end
```

## Contributing

Bug reports and sugestions are welcome, please raise an issue if you find a problem or have a question. Otherwise, for now, this project is closed for pull requests. I appreciate your understanding.

This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://www.contributor-covenant.org/version/1/4/code-of-conduct/).

## License

Licensed under the Apache License, Version 2.0. See [LICENSE](/LICENSE) for details.

## Contributors

- [nogginly](https://github.com/nogginly) - creator and maintainer

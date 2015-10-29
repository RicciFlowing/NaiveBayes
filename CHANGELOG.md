# Change Log
All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]

## [0.4.1] - 2015-10-29
### Added
- Changelog :-)

### Changed
- Updated the description in the gemspec.
- Updated the Readme

### Removed
- Removed the need to call to_a manually, when using non-array exmaples in active NaiveText:build (like ActiveRecord:Relations).

## [0.4.0] - 2015-10-18
### Added
- Support of Active Record models as examples
- Support for new arguments list for NaiveText.build: NaiveText.build uses a keyword argument (catgeories) to accept an categories array of the followin format: [{category: 'name_of_category', examples: array_of_examples}]


[Unreleased]: https://github.com/RicciFlowing/NaiveText/compare/v0.4.0...HEAD
[0.4.0]: https://github.com/olivierlacan/keep-a-changelog/compare/v0.1.0...v0.4.0

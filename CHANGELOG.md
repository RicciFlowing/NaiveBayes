# Change Log
All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).

## [0.6.0]- 2015-11-30
### Added
- Added optional language_model, that make it possible to compare words based on the word stem. (Like 'testing', 'tests', 'tested' all matched with the stem 'test')

## [0.5.1] - 2015-11-21
### Added
- Added optional default category. This category will be returned from NaiveText.build if the algorithm can't find a match with the existing text examples. Default value is NullCategory.

## [0.5.0] - 2015-11-06
### Added
- Added optional weighting to categories

##[0.4.2] - 2015-11-02
### Changed
-Fixed a typo in the interface of TextClassifier propabilities --> probabilities. Deprecated the old version.

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
[0.5.0]: https://github.com/RicciFlowing/NaiveText/compare/v0.1.0...v0.5.0
[0.4.0]: https://github.com/RicciFlowing/NaiveText/compare/v0.1.0...v0.4.0

# JLDishwasher App

## Requirements
* Xcode 7.3.1

## Project Setup
* Setting min SDK to 9.0 for the sake of the exercise.
* Using Carthage as a dependency management tool. I prefer it for building dependencies only once. In real world scenario it may be better to check in sources of dependencies, but I don't for the sake of the exercise.
* Using Argo library for JSON parsing and mapping values to structs. It results in an elegant solutions with immutable objects.

## Assumptions
* All properties of structs being mapped from API are optional and if some value is missing the struct is still valid and will be displayed to a user.
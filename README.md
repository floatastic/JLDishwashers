# JLDishwasher App

## Requirements
* Xcode 7.3.1

## Project Setup
* Setting min SDK to 9.0 for the sake of the exercise.
* Using Carthage as a dependency management tool. I prefer it for building dependencies only once. In real world scenario it may be better to check in sources of dependencies, but I don't for the sake of the exercise.
* Instead of default XCTest framework using Quick for BDD style tests. Structure of BDD tests is much cleaner. Together with Nimble for easy and beautiful expectation matching.
* Using OHHttpStubs to easily imitate network traffic in unit tests.
* Using Argo library for JSON parsing and mapping values to structs. It results in an elegant solutions with immutable objects.
* Using Alamofire for networking, which is not really neccesary, but it gives a copule of features for free, i.e. changind urls strings and GET params array into NSURL objects, parsing response to JSON dictionaries. NSURLSession could be also a good choice if depepndencies should be avoided.
* Using SDWebImage instead of writing image cache manually.

## Assumptions
* All properties of structs being mapped from API are optional and if some value is missing the struct is still valid and will be displayed to a user.
* If search results response status code is 2xx but content is not a JSON array of products it's a case of empty search results, not an error. 
* If all prices are in GBP I just interpolate strings and don't mind creating number formatter.

## MVP functionality left
* Loading and error view in the grid controller
* Default image placeholder in the grid view
* Errors deserve more attention. I don't create specific error objects to pass reasons for failure in service
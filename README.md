# PastryKit
Swift code used for communicating with [The Pastry Box Project API](https://the-pastry-box-project.net/api-and-content-preservation "The Pastry Box Project API")

A note about organization:
+ **PastryKit** - Contains the only two Swift files you'll need to get stuff from The Pastry Box; _PastryKit_ and _Pastry_
+ **PastryTest** - An application (really, really, ugly) that will let you execute PastryKit methods
+ **PastryTestTests** - Unit tests for PastryKit. There are only a few.

Example of use, get all Pastries by Baker Mike Monteiro:

  private func showPastryBaker() {
      var pastryKit = PastryKit();
      pastryKit.thoughtsByBaker("mike-monteiro", completionHandler:{(pasteries, error) in
          if (nil != error) { println(error) }
          if (nil != pasteries) { println(pasteries) }
      });
  }

Rob Fahrni - April 4, 2015 - Visalia, CA

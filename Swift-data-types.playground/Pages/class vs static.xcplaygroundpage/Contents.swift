import Foundation


class Car {
    static let countryOfProduction = "Japan"
    static var topSpeed: Float {
        return 100.0
    }
}

/* This overriding a static function will lead to compilation error
 //Static properties, methods, functions, cannot be overriden
 class SuperFastCar: Car {
     override static let countryOfProduction = "Italy"
     override static var topSpeed: Float {
         return 250.0
     }
 }*/


///To overcome this isse we use class

class Carr {
    class var countryOfProduction: String { "Japan" }
    class var topSpeed: Float { 100.0 }
}

print(Car.countryOfProduction)
print(Car.topSpeed)

class SuperFastCar: Carr {
    override class var countryOfProduction: String { "Italy" }
    override class var topSpeed: Float { 250.0 }
}

print(SuperFastCar.countryOfProduction)
print(SuperFastCar.topSpeed)

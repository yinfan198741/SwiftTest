//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//: Playground - noun: a place where people can play

import UIKit


enum type {
    case Family
    case Thrill
    case Water
    case Kids
    case Scary
    case Relaxing
}

struct Ride{
    let name:String
    let types:[type]
    let waitTime:Float
    
}

let parkRides = [
    Ride(name: "Raging Rapids", types: [.Family, .Thrill, .Water], waitTime: 45.0),
    Ride(name: "Crazy Funhouse", types: [.Family], waitTime: 10.0),
    Ride(name: "Spinning Tea Cups", types: [.Kids], waitTime: 15.0),
    Ride(name: "Spooky Hollow", types: [.Scary], waitTime: 30.0),
    Ride(name: "Thunder Coaster", types: [.Family, .Thrill], waitTime: 60.0),
    Ride(name: "Grand Carousel", types: [.Family, .Kids], waitTime: 15.0),
    Ride(name: "Bumper Boats", types: [.Family, .Water], waitTime: 25.0),
    Ride(name: "Mountain Railroad", types: [.Family, .Relaxing], waitTime: 0.0)
]

//let parkRides[0] = Ride(name: "Functional Programming", types: [.Thrill], waitTime: 5.0)



func sortedNames(rides: [Ride]) -> [String] {
    var sortedRides = rides
    var i, j : Int
    var key: Ride
    print("start")
    print(sortedRides.count)
    let count = sortedRides.count
    
    for i in 0..< count {
         key = sortedRides[i]
//        for j in (-1..<i).enumerated().reversed() {
//        if key.name.localizedCompare(sortedRides[j].name)== .orderedAscending {
//            sortedRides.removeAtIndex(j + 1)
//            sortedRides.insert(key, atIndex: j)
//            }
//        }
        
        for j in (-1..<i).enumerated().reversed() {
            if key.name.localizedCompare(sortedRides[j].name) == .orderedAscending {
                print(key.name)
                sortedRides.remove(at: j + 1)
                sortedRides.insert(key, at: j)
            }
        }
    }
    
    // 1
//    for (var i = 0; i < sortedRides.count; i++) {
//        key = sortedRides[i]
//
//        // 2
//        for (var j = i; j > -1; j--) {
//            if key.name.localizedCompare(sortedRides[j].name) == .orderedAscending {
//                sortedRides.removeAtIndex(j + 1)
//                sortedRides.insert(key, atIndex: j)
//            }
//        }
//    }
    
    // 3
    var sortedNames = [String]()
    for ride in sortedRides {
        sortedNames.append(ride.name)
    }
    
    print(sortedRides)
    print("over")
    return sortedNames
}

sortedNames(rides: parkRides)



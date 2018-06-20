//
//  PattenMatch.swift
//  SwiftTest
//
//  Created by 尹凡 on 5/25/18.
//  Copyright © 2018 尹凡. All rights reserved.
//

import Foundation




func map() -> Int? {
    return .some(1)
 }

func flatMap() -> Int? {
    return 1
}

func aaa() -> Int? {
//    return 1
    return .some(1)
    return nil
}

enum Direction {
    case North, South, East, West
}

extension Direction : CustomStringConvertible {
    public var description: String {
        switch self {
        case .North: return "N"
        case .South: return "S"
        case .East: return "E"
        case .West: return "W"
        }
    }
}

enum Media {
    case Book(title: String, author: String, year: Int)
    case Movie(title: String, director: String, year: Int)
    case WebSite(urlString: String)
}

extension Media {
    var title: String {
        switch self {
        case .Book(let _title,_,_) where _title == "Book":
            return "Book where"
        case .Movie(let t,_,_):
            return t
        case .WebSite(_):
            return "site"
        case .Book(let _t,_,_):
            return _t
        }
    }
}


let mediaList: [Media] = [
    .Book(title: "Harry Potter and the Philosopher's Stone", author: "J.K. Rowling", year: 1997),
    .Movie(title: "Harry Potter and the Philosopher's Stone", director: "Chris Columbus", year: 2001),
    .Book(title: "Harry Potter and the Chamber of Secrets", author: "J.K. Rowling", year: 1999),
    .Movie(title: "Harry Potter and the Chamber of Secrets", director: "Chris Columbus", year: 2002),
    .Book(title: "Harry Potter and the Prisoner of Azkaban", author: "J.K. Rowling", year: 1999),
    .Movie(title: "Harry Potter and the Prisoner of Azkaban", director: "Alfonso Cuarón", year: 2004),
    .Movie(title: "J.K. Rowling: A Year in the Life", director: "James Runcie", year: 2007),
    .WebSite(urlString: "https://en.wikipedia.org/wiki/List_of_Harry_Potter-related_topics")
]


func someArray() -> [Int]? {
    return [1, 2, 3, 4, 5, 6]
}

func example() {
    guard let array = someArray(),
    
        let numberThree = Optional(array[2]), numberThree == 4,
        let count = Optional(array.count), count > 5
        else { return }
    print(numberThree)
}


func pattenTest()  {
    
    example()
    let m = Media.Book(title: "Book", author: "JK", year: 2000)
    print(m.title)
    let mo = Media.Movie(title: "book2", director: "CC", year: 1900)
    print(mo.title)
    
    
    switch m {
    case let .Book(info) where info.year == 2000:
       print("swift case")
       print(info.year)
    default:
        print(m)
    }
    
    
    if case let Media.Book(book) = m  {
        print(book.author)
    }
    
    if case let Media.Book(_title, _ ,_ ) = m , _title == "Book" {
        print("mutiple",_title)
    }
    
    
    print("for case let begin======")
    for case let Media.Book(info) in mediaList where info.year == 1997 {
        print(info)
    }
    print("for case let end=======")
    
}



//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let calendar = Calendar.current
let daysSinceFirstDay = abs(calendar.firstWeekday - calendar.component(.weekday, from: Date()))

let firstDay = calendar.date(from: calendar.dateComponents([.year, .month, .day], from: calendar.date(byAdding: .day, value: -daysSinceFirstDay, to: Date())!))

calendar.weekdaySymbols

calendar.component(.weekday, from: Date())

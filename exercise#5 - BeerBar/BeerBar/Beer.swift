//
//  Beer.swift
//  BeerBar
//
//  Created by Andrey Gumen on 19.06.2022.
//
//Проект «Пивной бар». Вы должны создать:
// Класс Beer - у него будут свойства:
// 1) Имя
// 2) Цена
// 3) Cтрана
// 4) Oстаток объема.
//Реализовать продажу пива через менеджер-синглтон.
//Реализовать проверку выручки в конце дня.
//* Реализовать функционал:
//1) начало новой смены - обнуление выручки
//2) проверка остатков.
//
//Графический интерфейс - любой! Главное чтобы работало.



import Foundation
import CoreVideo

final class Beer {
    var name: String = "Unknown"
    /// price in cents for lt
    var price: Double = 0
    var producingСountry: String = "Unknown"
    /// in liters
    var incomingVolume: Double = 0
    var availableVolume: Double = 0
    
    init(name: String, price: Double, country: String, volume: Double) {
        self.name = name
        self.price = price
        self.producingСountry = country
        self.incomingVolume = volume
        self.availableVolume = volume
    }
}

final class BeerManager {
    static let instance: BeerManager = BeerManager()
    private init() {}
    
    // avaiable beer
    var reserve: [Beer] = []
    var revenue: Double = 0
    
    func sell(_ beer: Beer, volume: Double = 0.3) {
        if beer.availableVolume < volume {
            print("error: the requested amount of \(beer.name) is missing")
        } else {
            beer.availableVolume -= volume
            revenue += beer.price * volume
        }
    }
    
    func checkRevenue() -> Bool {
        var r: Double = 0
        reserve.forEach { beer in
            r += (beer.incomingVolume - beer.availableVolume) * beer.price
        }
        return (r - revenue) < 0.01
    }
    
    func newShift() {
        reserve.forEach { beer in
            beer.incomingVolume = beer.availableVolume
        }
        revenue = 0
    }
    
    func checkAvailablVolumes() {
        // ???
        // надо посмотреть в бочки и сравнить оставшееся пиво с данными
    }
}

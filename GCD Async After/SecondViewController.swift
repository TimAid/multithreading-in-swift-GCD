//
//  SecondViewController.swift
//  GCD Async After
//
//  Created by Aid on 26.06.2022.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let queue = DispatchQueue.global(qos: .utility)
//        queue.async {
//            DispatchQueue.concurrentPerform(iterations: 200_000) {  // метод который выполняет задачу не только в main потоке а также подключает другие // работает паралельно
//                print("\($0) times")
//                print(Thread.current)
//            }
//        }
        
        // Thread.isMainThread -  находимся ли мы в главной очереди 
        myInactiveQueue()
        
    }
    
    // управляемая очеред
    func myInactiveQueue() {
        let inactiveQueue = DispatchQueue(label: "The Swift Dev", attributes: [.concurrent, .initiallyInactive]) // создаем очередь
        inactiveQueue.async {
            print("done")
        }
        print("Not yet started")
        inactiveQueue.activate() // стартуем
        print("Activated")
        inactiveQueue.suspend() // остановись пауза
        print("Pause")
        inactiveQueue.resume() // продолжи
        
    }



}

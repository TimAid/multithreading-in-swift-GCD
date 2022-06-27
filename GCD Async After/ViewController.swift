//
//  ViewController.swift
//  GCD Async After
//
//  Created by Aid on 26.06.2022.
//

import UIKit

class ViewController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet weak var pressbutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        afterBlock(seconds: 4, queue: .global()) {
//            for item in 0...20000 {
//                print(item)
//                print(Thread.current) // в какой очереди мы находимся или в каком потоке мы находимся
//
//            }
//        }
        
        afterBlock(seconds: 2) {
            print("hello")
            print(Thread.current)
        }
    }
    
    func showAlert() {
        let alert = UIAlertController(title: nil, message: "hello", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "no", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }

    func afterBlock(seconds: Int, queue: DispatchQueue = DispatchQueue.global(), complition: @escaping ()-> ()) {
        queue.asyncAfter(deadline: .now() + .seconds(seconds)) {
            complition()
        }
    }

}


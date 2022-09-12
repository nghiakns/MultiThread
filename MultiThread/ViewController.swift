//
//  ViewController.swift
//  MultiThread
//
//  Created by Kim Nghĩa on 12/09/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        SerialSync()
//        SerialAsync()
        ConcurrentSync()
//        ConcurrentAsync()
    }

    
    // Serial + Sync: Order
    func SerialSync(){
        let queue  = DispatchQueue(label: "queue")
        
        queue.sync {
            print("task 1 started")
            for i in 1...5 {
                print("\(i) [TASK1]  time 5 is \(i * 5)")
                sleep(1)
            }
            print("task 1 finished")
            sleep(1)
        }
        queue.sync {
            print("task 2 started")
            for i in 1...3 {
                print("\(i) [TASK2]  time 5 is \(i * 5)")
                sleep(1)
            }
            print("task 2 finished")
        }
    }
    
    // Serial + Async: Order
    func SerialAsync(){
        let queue  = DispatchQueue(label: "queue")
        
        queue.async {
            print("task 1 started")
            for i in 1...5 {
                print("\(i) [TASK1]  time 5 is \(i * 5)")
                sleep(1)
            }
            print("task 1 finished")
            sleep(1)
        }
        queue.async {
            print("task 2 started")
            for i in 1...3 {
                print("\(i) [TASK2]  time 5 is \(i * 5)")
                sleep(1)
            }
            print("task 2 finished")
        }
    }
    
    // Concurrent + Sync: Order
    func ConcurrentSync(){
        let queue  = DispatchQueue(label: "queue",attributes: .concurrent)
        
        queue.sync {
            print("task 1 started")
            for i in 1...5 {
                print("\(i) [TASK1]  time 5 is \(i * 5)")
                sleep(1)
            }
            print("task 1 finished")
            sleep(1)
        }
        queue.sync {
            print("task 2 started")
            for i in 1...3 {
                print("\(i) [TASK2]  time 5 is \(i * 5)")
                sleep(1)
            }
            print("task 2 finished")
        }
    }
    
    // Concurrent + Async: Unorder
    func ConcurrentAsync(){
        let queue  = DispatchQueue(label: "queue",attributes: .concurrent)
        
        queue.async {
            print("task 1 started")
            for i in 1...5 {
                print("\(i) [TASK1]  time 5 is \(i * 5)")
                sleep(1)
            }
            print("task 1 finished")
            sleep(1)
        }
        queue.async {
            print("task 2 started")
            for i in 1...3 {
                print("\(i) [TASK2]  time 5 is \(i * 5)")
                sleep(1)
            }
            print("task 2 finished")
        }
    }
}


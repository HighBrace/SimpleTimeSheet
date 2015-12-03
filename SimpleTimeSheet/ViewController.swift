//
//  ViewController.swift
//  SimpleTimeSheet
//
//  Created by Jonas Sääv on 2015-11-28.
//  Copyright © 2015 JS HighBrace. All rights reserved.
///

import UIKit
import ReactiveCocoa

class ViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var obss = Observer<String, NoError>()
        
        var producer = SignalProducer<String, NoError> { observer, disposable in
            obss = observer
            observer.sendNext("Jonas Sääv")
        }
        
        var _mutableStringProp = MutableProperty<String?>("Inget")
        
        var mutableStringProp = AnyProperty(_mutableStringProp)
        
        var prop = AnyProperty<String>(initialValue: "Nothing", producer: producer)
        
        obss.sendNext("Marie Tilja")
        
        prop.producer.on(next: { print($0) }).start()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


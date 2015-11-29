//
//  QuickTest.swift
//  SimpleTimeSheet
//
//  Created by Jonas Sääv on 2015-11-29.
//  Copyright © 2015 JS HighBrace. All rights reserved.
//

import Quick
import Nimble

class QuickTestSpec: QuickSpec {
    override func spec() {
        
        context("Test stupid thing") {
            it("Does nothing") {
                expect(true).to(equal(true))
            }
        }
    }
}

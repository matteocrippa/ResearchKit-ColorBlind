//
//  QuestionTests.swift
//  ColorBlind
//
//  Created by Matteo Crippa on 30/03/2016.
//  Copyright © 2016 boostco.de. All rights reserved.
//

import Quick
import Nimble
@testable import ColorBlind

class QuestionTest: QuickSpec {

    let q = Question(image: UIImage(), answers: [Answer()])
    
    override func spec() {
        describe("Question model") {
            it("has an image") {
                expect(self.q.image).to(beAKindOf(UIImage))
            }
            it("has several answers"){
                expect(self.q.answers.count).to(equal(1))
            }
        }
    }
}

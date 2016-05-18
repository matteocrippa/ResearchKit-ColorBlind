//
//  AnswerTests.swift
//  ColorBlind
//
//  Created by Matteo Crippa on 30/03/2016.
//  Copyright © 2016 boostco.de. All rights reserved.
//

import Quick
import Nimble
@testable import ColorBlind

class AnswerTest: QuickSpec {

    let answer = Answer(text: "text", value: 0)

    override func spec() {
        describe("Answer model") {
            context("text") {
                it("has a text") {
                    expect(self.a.text).to(equal("text"))
                }
            }
            context("value") {
                it("has a value") {
                    expect(self.a.value).to(equal(0))
                }
                it("should support negatives") {
                    let aNeg = Answer(text: "neg", value: -1)
                    expect(aNeg.value).to(equal(-1))
                }
            }
        }
    }
}

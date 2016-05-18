//
//  ViewControllerTests.swift
//  ColorBlind
//
//  Created by Matteo Crippa on 30/03/2016.
//  Copyright © 2016 boostco.de. All rights reserved.
//

import Quick
import Nimble
@testable import ColorBlind

class ViewControllerTests: QuickSpec {
    let questions: [Question] = [
        Question(
            image: UIImage(named:"duck"),
            answers: [
                Answer(text: "A cat", value: 0),
                Answer(text: "A duck", value: 1)
            ]
        )
    ]

    var viewController: ViewController!

    override func spec() {

//        beforeEach() {
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            // swiftlint:disable force_cast
//            self.viewController = storyboard.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
//        }
//
//        describe("Colorblind") {
//            it("can generate step") {
//                _ = self.viewController.view
//                let step = self.viewController.generateSteps(self.questions)
//                expect(step.count).to(equal(1))
//            }
//        }
    }
}

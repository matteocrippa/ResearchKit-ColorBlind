//
//  ViewController.swift
//  appname
//
//  Created by Matteo Crippa on 12/03/2016.
//  Copyright © 2016 boostco.de. All rights reserved.
//

import UIKit
import Walker
import ResearchKit

class ViewController: UIViewController {

    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var labelResponse: UILabel!

    @IBAction func startSurvey(sender: AnyObject) {
        let tvc = ORKTaskViewController(task: surveyTask, taskRunUUID:  nil)
        tvc.delegate = self
        presentViewController(tvc, animated: true, completion: {
            self.imageLogo.image = UIImage(named: "logo-gray")
        })
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        imageLogo.image = UIImage(named: "logo-gray")

        if (NSUserDefaults.standardUserDefaults().objectForKey("blindTotal") != nil) {
            let response = NSUserDefaults.standardUserDefaults().integerForKey("blindTotal")
            if response ==  3 {
                imageLogo.flip(0.5, vertical: true) {
                    self.imageLogo.image = UIImage(named: "logo")
                }
                labelResponse.text = "👍 You seems not to be color blind"
            } else {
                labelResponse.text = "⚠️ Check your color blindness with your optician"
            }
        } else {
            labelResponse.text = "🕓 Please, take the survey!"
        }

    }
}

extension UIImageView {
    public func flip(duration: NSTimeInterval = 0.5, vertical: Bool = true, completion: (() -> ())? = nil) {
        let initialZ = layer.zPosition
        let x: CGFloat = vertical ? 0 : 1
        let y: CGFloat = vertical ? 1 : 0

        layer.zPosition = 400

        var perspective = CATransform3DIdentity
        perspective.m34 = -0.4 / layer.frame.size.width

        let original = CATransform3DRotate(perspective, 0, x, y, 0)
        let rotated = CATransform3DRotate(perspective, CGFloat(M_PI), x, y, 0)

        animate(self, duration: duration) {
            $0.transform3D =
                CATransform3DEqualToTransform(self.layer.transform, original)
                || CATransform3DIsIdentity(self.layer.transform)
                ? rotated : original
            }.finally {
                self.layer.transform = CATransform3DIdentity
                self.layer.zPosition = initialZ

                completion?()
        }
    }
}

extension ViewController: ORKTaskViewControllerDelegate {
    func taskViewController(taskViewController: ORKTaskViewController, didFinishWithReason reason: ORKTaskViewControllerFinishReason, error: NSError?) {

        var total = 0

        let taskResult = taskViewController.result // this should be a ORKTaskResult
        // swiftlint:disable force_cast
        let results = taskResult.results as! [ORKStepResult]//[ORKStepResult]

        for thisStepResult in results { // [ORKStepResults]
            // swiftlint:disable force_cast
            let stepResults = thisStepResult.results as! [ORKQuestionResult]
            for item in stepResults {
                if let answer = item as? ORKChoiceQuestionResult { // cast it to the right subclass
                    //print("\(answer.answer!)")

                    let arr = answer.answer as! [Int]
                    let value = arr[0]

                    total += value
                }
            }
        }

        //print(total)
        NSUserDefaults.standardUserDefaults().setInteger(total, forKey: "blindTotal")
        NSUserDefaults.standardUserDefaults().synchronize()

        taskViewController.dismissViewControllerAnimated(true, completion: nil)
    }
}

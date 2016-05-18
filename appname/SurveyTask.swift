//
//  SurveyTask.swift
//  ColorBlind
//
//  Created by Matteo Crippa on 30/03/2016.
//  Copyright © 2016 boostco.de. All rights reserved.
//

import ResearchKit

public var surveyTask: ORKOrderedTask {
    let questions: [Question] = [
        Question(
            image: UIImage(named:"duck"),
            answers: [
                Answer(text: "A cat", value: 0),
                Answer(text: "A duck", value: 1),
                Answer(text: "Nothing", value: 0)
            ]
        ),
        Question(
            image: UIImage(named:"dog"),
            answers: [
                Answer(text: "An airplane", value: 0),
                Answer(text: "Nothing", value: 0),
                Answer(text: "A dog", value: 1)
            ]
        ),
        Question(
            image: UIImage(named:"butterfly"),
            answers: [
                Answer(text: "A goat", value: 0),
                Answer(text: "A butterfly", value: 1),
                Answer(text: "Nothing", value: 0)
            ]
        )/*,
        Question(
            image: UIImage(named:"tree"),
            answers: [
                Answer(text: "A tree", value: 1),
                Answer(text: "A flower", value: 0),
                Answer(text: "Nothing", value: 0)
            ]
        ),
        Question(
            image: UIImage(named:"car"),
            answers: [
                Answer(text: "A bicycle", value: 0),
                Answer(text: "Nothing", value: 0),
                Answer(text: "A car", value: 1)
            ]
        )*/
    ]
    func generateSteps(questions: [Question]) -> [ORKStep] {

        var steps = [ORKStep]()
        var index = 0

        for q in questions {

            let stepImage = ORKInstructionStep(identifier: "stepImage\(index)")
            stepImage.text = "Please look at this image for 10 seconds"
            stepImage.image = q.image

            steps += [stepImage]

            var answers = [ORKTextChoice]()

            for a in q.answers {
                answers.append(ORKTextChoice(text: a.text, value: a.value))
            }

            let colorBlindAnswerFormat = ORKTextChoiceAnswerFormat(
                style: .SingleChoice,
                textChoices: answers
            )

            let colorBlindStep = ORKQuestionStep(
                identifier: "stepQuestion\(index)",
                title: "What do you recognize?",
                text: "",
                answer: colorBlindAnswerFormat
            )

            colorBlindStep.optional = false

            steps += [colorBlindStep]

            index += 1

        }

        return steps
    }

    let steps = generateSteps(questions)

    return ORKOrderedTask(identifier: "Survey", steps: steps)
}

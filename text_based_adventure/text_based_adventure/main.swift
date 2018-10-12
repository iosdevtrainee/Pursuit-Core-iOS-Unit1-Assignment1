//
//  main.swift
//  text_based_adventure
//
//  Created by J on 10/10/18.
//  Copyright © 2018 J. All rights reserved.
//

import Foundation

//// String? - optional
//if let response = readLine() {
//    switch Int(response.trimmingCharacters(in: .whitespacesAndNewlines)) {
//    case 1:
//        print("Playing Rock, Paper, Scissors")
//    case 2:
//        print("Playing Escape the room")
//    case 3:
//        print("Playing Jeopardy")
//    default:
//        print("Please select either 1, 2, or 3 to play a game.")
//    }
//}


//var test = false
//print("select a, b, or c")
//var x = readLine()
//while test == false {
//    switch x {
//    case "a":
//        print("a")
//        test = true
//    case "b":
//        print("b")
//        test = true
//    case "c":
//        print("c")
//    default:
//        print("select another response:")
//        x = readLine()
//    }
//}
print("Please enter a name:")
let name = readLine()!
var playerOne = (name:name == "" ? "Player 1": name, wins:0)
print("Hi \(playerOne.name) get ready to have fun at our arcade! \n")
print("Which Game would you like to play: \n\n(Rock, Paper, Scissor) - 1,\n(Tic Tac Toe) - 2")
print("Enter your option:", terminator:"")
var endArcade = false
while (endArcade != true){
    if let option = Int(readLine()!) {
        if (1...3).contains(option){
            if option == 1 {
                var computer = (name: "Computer", wins: 0, choices: ["rock","paper","scissors"])
//                print("Please enter a name:")
//                let name = readLine()!
//                var playerOne = (name:name == "" ? "Player 1": name, wins:0)
//                print("Hi \(playerOne.name) get ready to have fun at our arcade!")
                // Best of five games
                
                var continueArcade = true
                while continueArcade {
                    print("How many games would you like to play?")
                    if var maxGames = Int(readLine()!){
                        let rock = "✊"
                        let paper = "✋"
                        let scissors = "✌️"
                        let numberOfGamesToWin = (maxGames / 2) + 1
                        var continueGame = true
                        var numTies = 0
                        var toggle = true
                        if maxGames > 0 {
                        for game in 1...maxGames{
                            while (numberOfGamesToWin != computer.wins || numberOfGamesToWin != playerOne.wins) && (continueGame == true){
                                let gameOver : Bool  = true
                                let computerChoice = Int.random(in: 1...2) // change to zero to two
                                let computerChose = computer.choices[computerChoice]
                                switch gameOver {
                                case playerOne.wins == numberOfGamesToWin || (playerOne.wins > computer.wins && game == maxGames):
                                    print("Game Over: \(playerOne.name) Wins!!!!!")
                                    continueGame = false
                                case computer.wins == numberOfGamesToWin || (computer.wins > playerOne.wins && game == maxGames):
                                    print("Game Over: \(computer.name) Wins!!!!!")
                                    continueGame = false
                                case numTies == maxGames || (computer.wins + playerOne.wins) == maxGames:
                                    print("Game Over: No one wins sorry try again.")
                                    continueGame = false
                                default:
                                    print("Enter either (Rock), (Paper), (Scissors)")
                                    let response = readLine()!
                                    let formatted = response.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
                                    let isRockPaperOrScissors = formatted == "rock" || formatted == "scissors" || formatted == "paper"
                                    if isRockPaperOrScissors {
                                        print("Rock!")
                                                            sleep(1)
                                        print("Paper!")
                                                            sleep(1)
                                        print("Scissors!")
                                                            sleep(1)
                                        print("Say Shoot!")
                                    }
                                    switch formatted {
                                    case "rock":
                                        if computerChose == formatted {
                                            print("TIE: \(rock) can't beat \(rock)")
                                            numTies += 1
                                        } else if computerChose == "scissors" {
                                            print("\(playerOne.name) WINS: \(rock) beats \(scissors)")
                                            playerOne.wins += 1
                                        } else {
                                            print("\(computer.name) WINS: \(rock) beats \(scissors)")
                                            computer.wins += 1
                                        }
                                    case "scissors":
                                        if computerChose == formatted {
                                            print("TIE: \(scissors) can't beat \(scissors)")
                                            numTies += 1
                                        } else if computerChose == "rock" {
                                            print("\(computer.name) WINS: \(rock) beats \(scissors)")
                                            computer.wins += 1
                                        } else {
                                            print("\(playerOne.name) WINS: \(rock) beats \(scissors)")
                                            playerOne.wins += 1
                                        }
                                    case "paper":
                                        if computerChose == formatted {
                                            print("TIE: \(paper) can't beat \(paper)")
                                            numTies += 1
                                        } else if computerChose == "rock" {
                                            print("\(playerOne.name) WINS: \(paper) beats \(rock)")
                                            playerOne.wins += 1
                                        } else {
                                            print("\(computer.name) WINS: \(scissors) beats \(paper)")
                                            computer.wins += 1
                                        }
                                    default:
                                        print("Please try again!", terminator: " ")
                                    }
                                }
                            }
                        }
                            
                        
                        }
                    }else {
                        print("Please enter a whole number")
                        sleep(2)
                }
                    continueArcade = false
                }
            } else if option == 2 {
                // tic tac toe
                let xOrO = ["❌","⭕️"]
                print("If you would like to be ❌ select 1 otherwise you'll be ⭕️?")
                let playerIcon = Int(readLine()!) == 1 ? xOrO[0] : xOrO[1]
                let computerIcon = playerIcon == "❌" ? "⭕️" : "❌"
                var continueTicTaceToe = true
                var ticTacToeMatrix = [["⬛️","⬛️","⬛️"],["⬛️","⬛️","⬛️"],["⬛️","⬛️","⬛️"]]
                var selectedPositions = [Int]()
                while continueTicTaceToe {
                    print("1 is equal to the first column and first row.\n2 is equal to the second column and first row... etc.\n\n")
                    for x in ticTacToeMatrix {
                        for y in x {
                            print(y, terminator:"")
                        }
                        print("")
                    }
                    print("Please select a unique value from 1 to 9")
                    //                continueTicTaceToe = false
                    if let playerChoice = Int(readLine()!){
                        if (1...9).contains(playerChoice) && !selectedPositions.contains(playerChoice){
                            switch playerChoice {
                            case 1:
                                ticTacToeMatrix[0][0] = playerIcon
                                selectedPositions.append(1)
                            case 2:
                                ticTacToeMatrix[0][1] = playerIcon
                                selectedPositions.append(2)
                            case 3:
                                ticTacToeMatrix[0][2] = playerIcon
                                selectedPositions.append(3)
                            case 4:
                                ticTacToeMatrix[1][0] = playerIcon
                                selectedPositions.append(4)
                            case 5:
                                ticTacToeMatrix[1][1] = playerIcon
                                selectedPositions.append(5)
                            case 6:
                                ticTacToeMatrix[1][2] = playerIcon
                                selectedPositions.append(6)
                            case 7:
                                ticTacToeMatrix[2][0] = playerIcon
                                selectedPositions.append(7)
                            case 8:
                                ticTacToeMatrix[2][1] = playerIcon
                                selectedPositions.append(8)
                            case 9:
                                ticTacToeMatrix[2][2] = playerIcon
                                selectedPositions.append(9)
                            default:
                                continue
                            }
                            var hasWon = false
                            var countXs = 0
                            var countOs = 0
                            outerloop: for x in ticTacToeMatrix{
                                innerloop: for y in x {
                                    countXs += y == "❌" ? 1 : 0
                                    countOs += y == "⭕️" ? 1 : 0
                                    if countXs == 3 {
                                        playerIcon == "❌" ? print("Player 1 Wins!") : print("Computer Wins! 7")
                                        hasWon = true
                                        break outerloop
                                    }
                                    if countOs == 3 {
                                        playerIcon == "⭕️" ? print("Player 1 Wins!") : print("Computer Wins! 6")
                                        hasWon = true
                                        break outerloop
                                    }

                                    
                                }
                                
                            }
                            var firstDiagonal = ticTacToeMatrix[0][0] == ticTacToeMatrix[1][1] && ticTacToeMatrix[1][1] == ticTacToeMatrix[2][2] && ticTacToeMatrix[1][1] != "⬛️"
                            var secondDiagonal = ticTacToeMatrix[0][2] == ticTacToeMatrix[1][1] && ticTacToeMatrix[1][1] == ticTacToeMatrix[2][0] && ticTacToeMatrix[1][1] != "⬛️"
                            if firstDiagonal == true || secondDiagonal == true {
                                ticTacToeMatrix[1][1] == playerIcon ? print("Player 1 Wins! (Diagonal)") : print("Computer Wins! 4")
                                hasWon = true
                            }
                            
                            
                            var toggleComputer = true
                            var computerChoice: Int = 0
                            while toggleComputer {
                                computerChoice = Int.random(in: (1...9))
                                toggleComputer = selectedPositions.contains(computerChoice) ? true : false
                            }
                            switch computerChoice {
                            case 1:
                                ticTacToeMatrix[0][0] = computerIcon
                                selectedPositions.append(1)
                            case 2:
                                ticTacToeMatrix[0][1] = computerIcon
                                selectedPositions.append(2)
                            case 3:
                                ticTacToeMatrix[0][2] = computerIcon
                                selectedPositions.append(3)
                            case 4:
                                ticTacToeMatrix[1][0] = computerIcon
                                selectedPositions.append(4)
                            case 5:
                                ticTacToeMatrix[1][1] = computerIcon
                                selectedPositions.append(5)
                            case 6:
                                ticTacToeMatrix[1][2] = computerIcon
                                selectedPositions.append(6)
                            case 7:
                                ticTacToeMatrix[2][0] = computerIcon
                                selectedPositions.append(7)
                            case 8:
                                ticTacToeMatrix[2][1] = computerIcon
                                selectedPositions.append(8)
                            case 9:
                                ticTacToeMatrix[2][2] = computerIcon
                                selectedPositions.append(9)
                            default:
                                continue
                            }
                            
                            outerloop: for x in ticTacToeMatrix{
                                innerloop: for y in x {
                                    countXs += y == "❌" ? 1 : 0
                                    countOs += y == "⭕️" ? 1 : 0
                                    if countXs == 3 {
                                        playerIcon == "❌" ? print("Player 1 Wins!") : print("Computer Wins! 1")
                                        hasWon = true
                                        break outerloop
                                    }
                                    if countOs == 3 {
                                        playerIcon == "⭕️" ? print("Player 1 Wins!") : print("Computer Wins! 2")
                                        hasWon = true
                                        break outerloop
                                    }
                                    colsForLoop : for col in 0...2 {
                                        if ticTacToeMatrix[0][col] == ticTacToeMatrix[1][col] && ticTacToeMatrix[1][col] == ticTacToeMatrix[2][col] && ticTacToeMatrix[0][col] != "⬛️" {
                                            if playerIcon == "⭕️" && playerIcon == ticTacToeMatrix[0][col] {
                                                print("Player 1 Wins!")
                                                hasWon = true
                                            } else if playerIcon == "❌" && playerIcon == ticTacToeMatrix[0][col] {
                                                print("Player 1 Wins!")
                                                hasWon = true
                                            }
                                        } else {
                                            print("Computer Wins!")
                                            hasWon = true
                                        }
//                                        hasWon == true ? break : continue
                                    }
                                    
                                }
                                
                            }
                            firstDiagonal = ticTacToeMatrix[0][0] == ticTacToeMatrix[1][1] && ticTacToeMatrix[1][1] == ticTacToeMatrix[2][2] && ticTacToeMatrix[1][1] != "⬛️"
                            secondDiagonal = ticTacToeMatrix[0][2] == ticTacToeMatrix[1][1] && ticTacToeMatrix[1][1] == ticTacToeMatrix[2][0] && ticTacToeMatrix[1][1] != "⬛️"
                            if firstDiagonal == true || secondDiagonal == true {
                                ticTacToeMatrix[1][1] == playerIcon ? print("Player 1 Wins!") : print("Computer Wins! 3")
                                hasWon = true
                        }
                        
                    }
                    
                } else {
                    print("Please select a unique number from 1 to 9 that has not been selected!")
            }
                    //                    else{
//                    print("Please enter a valid unique number from 1 to 9.")
//                }
            
        }
    } //else if {
    
    // }
    
} else {
    print("Option must be from 1 to 3")
}
//    endArcade = true
}
else {
    print("Please enter an option of either 1, 2, or 3")
}
endArcade = true
}

// Example switch can have multiple false conditions and only one truth just needs a default
//var two = 2
//var gameOver : Bool  = true
//switch gameOver {
//case (two != 2):
//    print("Not equal two")
//case 21 / two == 12:
//    print("Nope!")
//case two == 1:
//    print("Nope not equal one")
//case two == 4 / 2:
//    print("YUP!!!!")
//default:
//    print("Can't get here")
//}


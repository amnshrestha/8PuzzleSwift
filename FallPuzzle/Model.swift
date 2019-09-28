//
//  Model.swift
//  FallPuzzle
//
//  Created by Aman Shrestha on 9/27/19.
//  Copyright © 2019 Aman Shrestha. All rights reserved.
//

import Foundation

class Puzzle{
    
    
    var puzzleBoxes = Array(repeating: Array(repeating: 0, count: 3), count: 3)
    
    var checking = Array(repeating: -1, count:9)
    
    func initializeArray(){
        
        var counter = 0
        
        self.checking = makeList(9)
        
        //self.checking = [1,2,3,4,5,6,7,9,8]
        
        for i in 0...puzzleBoxes.count-1{
            for j in 0...puzzleBoxes[0].count-1{
                puzzleBoxes[i][j] = checking[counter]
                counter = counter + 1
            }
        }
        
    }
    
    func makeList(_ n: Int) -> [Int] {
        var toReturn = [Int](repeating: -1, count: n)
        var numbersAdded = 0
        
        while(numbersAdded < n){
            var number = Int.random(in: 1 ... n)
            while(toReturn.contains(number)){
                number = Int.random(in: 1 ... n)
            }
            toReturn[numbersAdded] = number
            numbersAdded = numbersAdded + 1
        }
        
        return toReturn
    }
    
    func ifWon()->Bool{
        var counter = 1
        for i in 0...puzzleBoxes.count-1{
            for j in 0...puzzleBoxes[0].count-1{
                if(puzzleBoxes[i][j] != counter){return false}
                counter = counter + 1
            }
        }
        return true
        
    }
    
    
    
    func checkIfMovementPossible(tag: Int)->Bool{
        
        var row = -1
        var column = -1
        
       
        
        for i in 0...puzzleBoxes.count-1{
            for j in 0...puzzleBoxes[0].count-1{
                if(puzzleBoxes[i][j] == tag){
                    row = i
                    column = j
                    break
                }
            }
        }
        if(row == -1 || column == -1){return false}
        if(row == 0){
            if(column == 0){
                if(puzzleBoxes[row+1][column] == 9){
                    self.puzzleBoxes = swapNumbersInArray(row1: row, column1: column, row2: row+1, column2: column)
                    return true
                }
                if(puzzleBoxes[row][column+1] == 9){
                    self.puzzleBoxes = swapNumbersInArray(row1: row, column1: column, row2: row, column2: column+1)
                    return true
                }
            }
            if(column == 1){
                if(puzzleBoxes[row+1][column] == 9){
                    self.puzzleBoxes = swapNumbersInArray(row1: row, column1: column, row2: row+1, column2: column)
                    return true
                }
                if(puzzleBoxes[row][column+1] == 9){
                    self.puzzleBoxes = swapNumbersInArray(row1: row, column1: column, row2: row, column2: column+1)
                    return true
                }
                if(puzzleBoxes[row][column-1] == 9){
                    self.puzzleBoxes = swapNumbersInArray(row1: row, column1: column, row2: row, column2: column-1)
                    return true
                }
            }
            if(column == 2){
                if(puzzleBoxes[row+1][column] == 9){
                    self.puzzleBoxes = swapNumbersInArray(row1: row, column1: column, row2: row+1, column2: column)
                    return true
                }
                if(puzzleBoxes[row][column-1] == 9){
                    self.puzzleBoxes = swapNumbersInArray(row1: row, column1: column, row2: row, column2: column-1)
                    return true
                }
            }
        }
        else if(row == 1){
            if(column == 0){
                if(puzzleBoxes[row+1][column] == 9){
                    self.puzzleBoxes = swapNumbersInArray(row1: row, column1: column, row2: row+1, column2: column)
                    return true
                }
                if(puzzleBoxes[row][column+1] == 9){
                    self.puzzleBoxes = swapNumbersInArray(row1: row, column1: column, row2: row, column2: column+1)
                    return true
                }
                if(puzzleBoxes[row-1][column] == 9){
                    self.puzzleBoxes = swapNumbersInArray(row1: row, column1: column, row2: row-1, column2: column)
                    return true
                }
            }
            if(column == 1){
                if(puzzleBoxes[row+1][column] == 9){
                    self.puzzleBoxes = swapNumbersInArray(row1: row, column1: column, row2: row+1, column2: column)
                    return true
                }
                if(puzzleBoxes[row][column+1] == 9){
                    self.puzzleBoxes = swapNumbersInArray(row1: row, column1: column, row2: row, column2: column+1)
                    return true
                }
                if(puzzleBoxes[row][column-1] == 9){
                    self.puzzleBoxes = swapNumbersInArray(row1: row, column1: column, row2: row, column2: column-1)
                    return true
                }
                if(puzzleBoxes[row-1][column] == 9){
                    self.puzzleBoxes = swapNumbersInArray(row1: row, column1: column, row2: row-1, column2: column)
                    return true
                }
            }
            if(column == 2){
                if(puzzleBoxes[row+1][column] == 9){
                    self.puzzleBoxes = swapNumbersInArray(row1: row, column1: column, row2: row+1, column2: column)
                  
                    
                    return true
                }
                if(puzzleBoxes[row][column-1] == 9){
                    self.puzzleBoxes = swapNumbersInArray(row1: row, column1: column, row2: row, column2: column-1)
                    return true
                }
                if(puzzleBoxes[row-1][column] == 9){
                    self.puzzleBoxes = swapNumbersInArray(row1: row, column1: column, row2: row-1, column2: column)
                    return true
                }
            }
        }
        else if(row == 2){
            if(column == 0){
                if(puzzleBoxes[row-1][column] == 9){
                    self.puzzleBoxes = swapNumbersInArray(row1: row, column1: column, row2: row-1, column2: column)
                    return true
                }
                if(puzzleBoxes[row][column+1] == 9){
                    self.puzzleBoxes = swapNumbersInArray(row1: row, column1: column, row2: row, column2: column+1)
                    return true
                }
            }
            if(column == 1){
                if(puzzleBoxes[row-1][column] == 9){
                    self.puzzleBoxes = swapNumbersInArray(row1: row, column1: column, row2: row-1, column2: column)
                    return true
                }
                if(puzzleBoxes[row][column+1] == 9){
                    self.puzzleBoxes = swapNumbersInArray(row1: row, column1: column, row2: row, column2: column+1)
                    return true
                }
                if(puzzleBoxes[row][column-1] == 9){
                    self.puzzleBoxes = swapNumbersInArray(row1: row, column1: column, row2: row, column2: column-1)
                    return true
                }
            }
            if(column == 2){
                if(puzzleBoxes[row-1][column] == 9){
                    self.puzzleBoxes = swapNumbersInArray(row1: row, column1: column, row2: row-1, column2: column)
                    return true
                }
                if(puzzleBoxes[row][column-1] == 9){
                    self.puzzleBoxes = swapNumbersInArray(row1: row, column1: column, row2: row, column2: column-1)
                    return true
                }
            }
        }
        
        
        
        return false
    }
    
   
    func swapNumbersInArray(row1 : Int,column1 : Int, row2: Int,column2 : Int)-> [[Int]]{
        
        var temp : Int
        temp = self.puzzleBoxes[row1][column1]
        self.puzzleBoxes[row1][column1] = self.puzzleBoxes[row2][column2]
        self.puzzleBoxes[row2][column2] = temp
        return self.puzzleBoxes
        
    }
    
    //        for i in 0...puzzleBoxes.count-1{
    //            for j in 0...puzzleBoxes[0].count-1{
    //                print(puzzleBoxes[i][j], terminator:"")
    //            }
    //            print()
    //        }

    
    
    
}

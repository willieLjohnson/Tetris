//
//  TetrisGameModel.swift
//  Tetris
//
//  Created by Willie Liwa Johnson on 9/17/22.
//

import Foundation

class TetrisGameModel: ObservableObject {
    var numRows: Int
    var numColumns: Int
    @Published var gameBoard: [[TetrisGameBlock?]]
    
    init(numRows: Int = 23, numColumns: Int = 20) {
        self.numRows = numRows
        self.numColumns = numColumns
        
        gameBoard = Array(repeating: Array(repeating: nil, count: numRows), count: numColumns)
    }

    func blockClicked(row: Int, column: Int) {
        if gameBoard[column][row] == nil { 
            gameBoard[column][row] = TetrisGameBlock(blockType: BlockType.allCases.randomElement()!)
        } else {
            gameBoard[column][row] = nil
        }
    }
}

struct TetrisGameBlock {
    var blockType: BlockType
}

enum BlockType: CaseIterable {
    case i, t, o, j, l, s, z
}


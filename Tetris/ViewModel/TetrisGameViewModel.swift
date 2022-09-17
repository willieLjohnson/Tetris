//
//  TetrisGameViewModel.swift
//  Tetris
//
//  Created by Willie Liwa Johnson on 9/7/22.
//

import SwiftUI
import Combine

class TetrisGameViewModel: ObservableObject {
    @Published var tetrisGameModel = TetrisGameModel()

    var numRows: Int { tetrisGameModel.numRows }
    var numColumns: Int { tetrisGameModel.numColumns }
    var gameBoard: [[TetrisGameSquare]] {
        tetrisGameModel.gameBoard.map {$0.map(convertToSquare)}
    }

    var anyCancellable: AnyCancellable?

    init() {
        anyCancellable = tetrisGameModel.objectWillChange.sink {
            self.objectWillChange.send()
        }
    }

    func convertToSquare(block: TetrisGameBlock?) -> TetrisGameSquare {
        return TetrisGameSquare(color: getColor(blockType: block?.blockType))
    }

    func getColor(blockType: BlockType?) -> Color {
        switch blockType {
        case .i:
            return .red
        case .j:
            return .blue
        case .l:
            return .orange
        case .o:
            return .yellow
        case .s:
            return .green
        case .t:
            return .teal
        case .z:
            return .purple
        case .none:
            return .black
        }
    }
    func squareClicked(row: Int, column: Int) {
        tetrisGameModel.blockClicked(row: row, column: column)
    }
}

struct TetrisGameSquare {
    var color: Color
}


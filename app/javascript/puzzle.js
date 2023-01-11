import { Chessground } from 'chessground';
import { Chess } from 'chess.js';

export class Puzzle {
  constructor(puzzle, element) {
    this.puzzle = puzzle;
    this.config = {
      fen: this.puzzle.fen,
      movable: {
	events: {
	  after: (src, dest, metadata) => {
	    let move = this.game.move({ from: src, to: dest});
    	    let fen = this.game.fen();
            this.board.set({fen: fen});
		  if (move) {
  	    this.checkAnswer(move);
		  }
          }
        }
      }
    }
    this.element = element;
    this.board = Chessground(this.element, this.config);
    this.game = new Chess(puzzle.fen);
    this.move = puzzle.move;
	  console.log(puzzle);
  }

  checkAnswer(move) {
	  if (this.move == move.san) {
		  alert('Correct!');
	  } else {
		  alert('Wrong | Expected ' + this.move + ' | Got : ' + move.san);
	  }
  }
}

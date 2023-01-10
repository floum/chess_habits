import { Chessground } from 'chessground';
import { Chess } from 'chess.js';

export class Chessboard {
  constructor(element) {
    this.config = {
      movable: {
	events: {
	  after: (src, dest, metadata) => {
	    this.game.move({ from: src, to: dest});
            this.board.set({fen: this.game.fen()});
          }
        }
      }
    }
    this.element = element;
    this.board = Chessground(this.element, this.config);
    this.game = new Chess();
  }
  
  currentFen() {
    this.game.fen();
  }
}

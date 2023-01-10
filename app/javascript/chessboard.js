import { Chessground } from 'chessground';
import { Chess } from 'chess.js';

export class Chessboard {
  constructor(element, fenElement) {
    this.config = {
      movable: {
	events: {
	  after: (src, dest, metadata) => {
	    this.game.move({ from: src, to: dest});
    	    let fen = this.game.fen();
            this.board.set({fen: fen});
  	    this.fenElement.value = fen;
          }
        }
      }
    }
    this.element = element;
    this.board = Chessground(this.element, this.config);
    this.game = new Chess();
    this.fenElement = fenElement;
    this.fenElement.value = this.game.fen();
  }
}

import { Chessground } from 'chessground';
import { Chess } from 'chess.js';

export class Chessboard {
  constructor(element, config) {
    this.config = Object.assign(
      {
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
      },
      config
    );
    this.element = element;
    this.board = Chessground(this.element, this.config);
    this.game = new Chess();
  }
}

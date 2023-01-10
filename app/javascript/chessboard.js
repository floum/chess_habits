import { Chessground } from 'chessground';

export class Chessboard {
  constructor(element) {
    this.element = element;
    this.board = Chessground(this.element, {movable: true});
  }
}

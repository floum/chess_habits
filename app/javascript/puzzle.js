import { Chessground } from 'chessground';
import { Chess } from 'chess.js';

export class Puzzle {
	constructor(puzzle, element, solutionElement) {
		this.solutionElement = solutionElement;
		this.puzzle = puzzle;
		this.config = {
			orientation: this.puzzle.color,
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
			this.solutionElement.append(this.successDiv());
		} else {
			this.solutionElement.append(this.failureDiv());
		}

		setTimeout(() => { location.reload(); }, 800);
	}

	successDiv() {
		let div = this.resultDiv();
		div.innerHTML = "Success!";
		return div;
	}

	failureDiv() {
		let div = this.resultDiv();
		div.innerHTML = "Failure!";
		return div;
	}

	resultDiv() {
		let div = document.createElement("div");
		return div;
	}
}

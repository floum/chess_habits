import { Chessground } from 'chessground';
import { Chess } from 'chess.js';

export class Puzzle {
	constructor(puzzle, element) {
		this.puzzle = puzzle;
		this.config = {
			orientation: this.puzzle.color,
			fen: this.puzzle.fen,
			movable: {
				events: {
					after: (src, dest, metadata) => {
						let move = this.game.move({ from: src, to: dest, promotion: 'q' });
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
    let success = false;
		if (this.move.substring(0, 4) == move.from + move.to) {
      document.getElementById('chessboard-wrap').classList.add("puzzle-success");
      success = true;
		  setTimeout(() => { location.reload(); }, 300);
		} else {
      document.getElementById('chessboard-wrap').classList.add("puzzle-failure");
		}

    fetch('http://192.168.1.18:3000/api/puzzles/' + this.puzzle.id, {
      method: 'PUT',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ "success": success })
    }).then(response => response.json()).then(response => console.log(JSON.stringify(response)));

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

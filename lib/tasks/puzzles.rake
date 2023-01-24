desc "create puzzles in the database"
task puzzles: [:environment] do
  Move.where(puzzle_check: false).each do |move|
    if move.position.box? && move.position.best_move != move.move
      print "Creating Puzzle for user #{move.user}, fen: #{move.position.fen}"
      Puzzle.create(
        user: move.user,
        position: move.position
      )
    end
    move.update(puzzle_check: true)
    move.save
  end
end

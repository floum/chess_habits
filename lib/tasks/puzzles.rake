desc "create puzzles in the database"
task puzzles: [:environment] do
  Move.all.select do |move|
    move.position.box?
  end.select do |move|
    print "Box FEN found: #{move.position.fen}"
    move.position.best_move != move.move
  end.each do |move|
    print "Creating Puzzle for user #{move.user}, fen: #{move.position.fen}"
    Puzzle.create(
      user: move.user,
      position: move.position
    )
  end
end

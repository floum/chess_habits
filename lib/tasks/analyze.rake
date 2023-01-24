desc "analyze a position from the DATABASE"
task analyze: [:environment] do
  depth = 18

  positions = Position.where('depth < ?', depth)

  positions.each do |position|
    puts "Analyzing Position : #{position.fen}"
    stockfish_analysis = Stockfish.analyze(position['fen'], depth: depth, multipv: 2)
    scores = stockfish_analysis[:variations].map {|var| var[:score]}
    scores.map! {|s| s.class == String ? 150 : s}

    if scores.size == 2
      criticality = (scores[0] - scores[1]).abs
    else
      criticality = 0
    end

    score = scores.max

    position.update(score: score, best_move: stockfish_analysis[:bestmove], criticality: criticality)
    position.save
  end
end

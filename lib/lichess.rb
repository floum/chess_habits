require 'net/http'

class Lichess
  def self.fetch(lichess_id)
    response = HTTParty.get(
      "https://lichess.org/game/export/#{lichess_id[0..7]}",
      headers: {
        'Content-Type' => 'application/json',
        'Accept' => 'application/json'
      }
    )
    throw :lichess_error unless response.ok?
    JSON.parse(response.body)
  end
end

namespace :lichess do
  desc "import games for USERNAME"
  task :games, [:username] do |t, args|
    username = args[:username]
  end
end

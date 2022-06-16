require_relative "./app"

puts 'Welcome to the library!'

def main
  app = App.new
  app.run
end

main
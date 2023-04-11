require_relative 'item'

class Main
  def main_menu
    puts "Welcome to our catalog 👋\nSelect an option: 👉"
    options = [
      '+++++++++++++++++++++++++++++++++++++++++++++++',
      '1 - List books options',
      '***********************************************',
      '2 - List music options',
      '***********************************************',
      '3 - List game options',
      '***********************************************',
      '4 - Quit',
      '+++++++++++++++++++++++++++++++++++++++++++++++'
    ]
    puts options
  end
end

app = Main.new
app.main_menu

module StatsHelper
  def add_bullshit(money)
    if money > 0
      result = "+" + money.to_s + " Kc. Black numbers! :-)"
    elsif money == 0
      result = money.to_s + " Kc. Let's start!"
    else
      result = money.to_s + " Kc. Red numbers! :-("
    end
  end

  def sum_prizes(games)
    games.inject(0) do |sum, game|
      sum + game.prize
    end
  end
end

class RpgController < ApplicationController
  def index
	if session[:gold] == nil or session[:morality] == nil or session[:activities] == nil
      session[:gold] = 0
      session[:morality] = 100
      session[:activities] = []
	end
  end
  def farm
  	@time = Time.now
  	@goldfish = rand(3)+1
  	session[:gold] += @goldfish
  	session[:morality] += 5
  	session[:activities].push("You toiled at the farm for #{@goldfish} goldfish. #{@time}")
  	redirect_to '/'
  end
  def mine
  	@time = Time.now
  	@goldfish = rand(5)+5
  	session[:gold] += @goldfish
  	session[:morality] += 1
  	session[:activities].push("You mined ore and earned #{@goldfish} goldfish. #{@time}")
  	redirect_to '/'
  end
  def house
  	@time = Time.now
  	@goldfish = rand(50)+50
  	session[:gold] += @goldfish
  	session[:morality] -= 10
  	session[:activities].push("You burgled #{@goldfish} goldfish from the house. #{@time}")
  	redirect_to '/'
  end
  def casino
  	#roulette odds!
  	@time = Time.now
  	if rand(38)+1 < 19
  		session[:gold] *= 2
  		session[:activities].push("You doubled your goldfish in a game of roulette! #{@time}")
  	else
  		session[:gold] = 0
  		session[:activities].push("You lost all your goldfish in a game of roulette! #{@time}")
  	end
  	redirect_to '/'
  end
  def reset
  	session[:gold] = 0
  	session[:morality] = 100
  	session[:activities] = []
  	redirect_to '/'
  end
end

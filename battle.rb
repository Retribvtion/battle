class ForceUser
attr_accessor :health

#how do I make it so all force users have 100 health and Jedi
#and Sith classes inherit that health?
  def initialize

  end


  def health

  end

  def attack
    rand(1..20)
  end
end

class Jedi < ForceUser
  #where do I set health to 100? how do I make it so that 100 is the default health for each instance of class ForceUser?
  attr_accessor :health

  def initialize
    @health = 100
  end

  def flurry
    rand(1..20) + 10
  end

  def heal
    rand(1..20) + 10
  end

end

class Sith < ForceUser
  attr_accessor :health, :lightning


  def initialize
    @health = 100
  end

  def lightning
    rand(1..20) + 4
  end

  def drain
    rand(1..10)
  end



end



class Battle

  def initialize
    @human = Jedi.new
    @cpu = Sith.new
  end

  def cpu_attack_bundle
    if @cpu.health < 25
      @cpu.drain
      @sith_damage = @cpu.drain
      @human.health -= @sith_damage
      @cpu.health += @sith_damage
      puts "The Sith drains your health for #{@sith_damage} damage! The Sith gains #{@sith_damage} and has #{@cpu.health} health and your health is now #{@human.health}!"
    else @action_chooser = rand(1..2)
      if @action_chooser == 1
        @sith_damage = @cpu.lightning
        @human.health -= @sith_damage
        @crit = "Critical Strike! ".upcase if @sith_damage > 20
        puts "The Sith shocks you for #{@sith_damage} lightning damage. #{@crit}Your health is now #{@human.health}! "
      else
        @sith_damage = @cpu.attack
        @human.health -= @sith_damage
        puts "The Sith attacks you for #{@sith_damage} damage. Your health is now #{@human.health}!"
      end
    end
  end

  def user_attack_bundle
    @action = gets.chomp.downcase.to_s
      if @action == "attack"
        @jedi_damage = @human.attack
        @cpu.health -= @jedi_damage
        puts "You attack the Sith for #{@jedi_damage} damage, his health is now #{@cpu.health}!"
      elsif @action == "heal"
        @jedi_heal = @human.heal
        @human.health += @jedi_heal
        puts "You healed yourself for #{@jedi_heal} HP, your health is now #{@human.health}!"
      elsif @action == "flurry"
        @jedi_damage = @human.flurry
        @cpu.health -= @jedi_damage
        puts "You unleash a flurry of slashes on the Sith for #{@jedi_damage} damage, his health is now #{@cpu.health}!"
      else
        puts "That is not a valid option. (Attack, Flurry, or Heal.)"
        #redo #(this sticks you in a loop) How do i make this so the computer doesnt get another action before the user takes his?
      end

  end

  def start
    puts "A Sith shows up and attacks"
    until @cpu.health <= 0 || @human.health <= 0
     self.cpu_attack_bundle
     break if @human.health <= 0
     puts "What do you do? (Attack, Flurry, or Heal)"
     self.user_attack_bundle
    end

    if @cpu.health <= 0
      puts "You have defeated the evil Sith!"
    else
      puts "The Sith Lord struck you down!"
    end
  end

end

battle = Battle.new
battle.start

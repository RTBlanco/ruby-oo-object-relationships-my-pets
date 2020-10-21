require "pry"
class Owner
  attr_reader :name, :species

  @@all = []
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear
  end

  def cats 
    # binding.pry
    Cat.all.select {|cat|cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog|dog.owner == self}
  end

  def pets 
    self.dogs.concat(self.cats)
  end

  def buy_cat(name)
    pet = Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each{|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.each{|cat| cat.mood = "happy"}
  end

  def sell_pets
    # self.dogs.each{|dog| dog.mood = "nervous"}
    # self.cats.each{|cat| cat.mood = "nervous"}
    pets.each do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end
    Owner.reset_all
  end

  def list_pets
    "I have #{ dogs.empty? ? 0 : dogs.count} dog(s), and #{cats.empty? ? 0 : cats.count} cat(s)."
  end
end
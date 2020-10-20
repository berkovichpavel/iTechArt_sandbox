# frozen_string_literal: true

require_relative 'job'
require_relative 'pet'

class Human
  attr_reader :pet, :money, :name, :job

  FEED_PRICE = 5
  def initialize(name: 'Pavel', money: 0, job: Job.new, pet: Pet.new)
    @name = name
    @money = money
    @job = job
    @pet = pet
  end

  def work
    self.money += job.get_salary
    'You get salary'
  end

  def feed_pet
    if (money - FEED_PRICE).negative?
      'You haven\'t got enough money to feed your pet! Go to work!'
    elsif pet.eat == 'I\'m not hungry'
      'Pet is full'
    else
      self.money -= FEED_PRICE
      'You feed pet'
    end
  end

  private

  attr_writer :money
end

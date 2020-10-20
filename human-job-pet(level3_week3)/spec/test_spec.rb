# frozen_string_literal: true

require_relative '../lib/human.rb'
require 'faker'
require 'rspec/autorun'

describe Human do
  # create doubles
  let(:pet) { double('pet') }
  let(:job) { double('job') }
  let(:human) { described_class.new(job: job, pet: pet, money: 5) }

  describe '#create' do
    it 'creates a new human' do
      expect(human).to be_kind_of(Human)
    end
  end

  describe 'Human - Animal' do
    it 'man feeds the animal' do
      expect(pet).to receive(:eat) { 45 } # mock
      expect(human.feed_pet).to eq('You feed pet')
    end
    it 'animal is full ' do
      expect(pet).to receive(:eat) { 'I\'m not hungry' } # mock
      expect(human.feed_pet).to eq('Pet is full')
    end
    it 'the person does  haven\'t enough money' do
      expect(human).to receive(:money) { 0 } # mock
      expect(human.feed_pet).to eq('You haven\'t got enough money to feed your pet! Go to work!')
    end
  end

  describe 'Human - Job' do
    it 'man feeds the animal' do
      allow(job).to receive(:get_salary) { 0 } # stub
      expect(human.work).to eq('You get salary')
    end
  end
end

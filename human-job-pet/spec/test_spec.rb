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
    context 'When we fids animal' do
      before do
        allow(pet).to receive(:eat) { 45 } # stub
      end
      it 'man feeds the animal' do
        expect(human.feed_pet).to eq('You feed pet')
      end
    end

    context 'When animal is full' do
      before do
        expect(pet).to receive(:eat) { 'I\'m not hungry' } # mock
      end
      it 'animal is full ' do
        expect(human.feed_pet).to eq('Pet is full')
      end
    end

    context 'When human have not enough money' do
      before do
        expect(human).to receive(:money) { 0 } # mock
      end
      it 'the person does  haven\'t enough money' do
        expect(human.feed_pet).to eq('You haven\'t got enough money to feed your pet! Go to work!')
      end
    end
  end

  describe 'Human - Job' do
    context 'When human work' do
      before do
        allow(job).to receive(:get_salary) { 0 } # stub
      end
      it 'man feeds the animal' do
        expect(human.work).to eq('You get salary')
      end
    end
  end
end

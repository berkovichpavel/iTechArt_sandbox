# frozen_string_literal: true

require_relative '../lib/time_manager'

describe TimeManager do
  context 'Testing the TimeManager class' do
    it 'should return improved time array' do
      tm = TimeManager.new([%w[10:00 10:20], %w[10:40 11:00], %w[10:50 12:00], %w[12:00 13:00], %w[10:00 10:20]])
      tm.optimize_interval
      answer = tm.intervals
      expect(answer).to eq [%w[10:00 10:20], %w[10:40 13:00]]
    end
    it 'should return improved time array' do
      tm = TimeManager.new([%w[10:00 10:20], %w[10:15 12:00], %w[10:50 13:30], %w[12:00 13:00], %w[10:00 10:20]])
      tm.optimize_interval
      answer = tm.intervals
      expect(answer).to eq [%w[10:00 13:30]]
    end
  end
end

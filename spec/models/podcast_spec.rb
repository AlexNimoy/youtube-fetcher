require 'rails_helper'

RSpec.describe Podcast, type: :model do
  let(:podcast) { create(:podcast) }

  describe '#episodes_per_week' do
    subject { podcast.episodes_per_week }

    context 'when has no episodes' do
      it { is_expected.to eq 0 }
    end

    context do
      let!(:episode) { create(:episode, podcast:, published_at: 1.day.ago) }
      it { is_expected.to eq 1 }
    end

    context do
      let!(:two_days_old_episode) { create(:episode, podcast:, published_at: 2.days.ago) }
      let!(:one_day_old_episode) { create(:episode, podcast:, published_at: 1.days.ago) }
      it { is_expected.to eq 2 }
    end
  end

  describe '#episodes_per_hour' do
    it 'should be (24 * 7) time less than episodes_per_week' do
      allow(podcast).to receive(:episodes_per_week) { 24 * 7 }
      expect(podcast.episodes_per_hour).to eq 1
    end
  end
end

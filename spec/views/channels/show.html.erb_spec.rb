require 'rails_helper'

RSpec.describe 'channels/show', type: :view do
  subject { rendered }
  let(:podcast) { create(:podcast, title: 'My Podcast') }
  let!(:episode) { create(:episode, title: 'My Episode') }
  let!(:video_episode) { create(:video_episode, origin_id: episode.origin_id, title: 'My Episode') }
  before do
    assign(:podcast, podcast)
    assign(:videos, [episode].map { |v| Video.new v.origin_id })

    render
  end

  it { is_expected.to include 'My Podcast' }
  it { is_expected.to include 'My Episode' }
  it { is_expected.to include 'Subscribe' }
  it { is_expected.to include 'Subscribe Video' }

  it { is_expected.to include channel_url(podcast.origin_id, format: :atom) }

  context 'when playlist' do
    let(:podcast) { build(:podcast, :playlist) }

    it { is_expected.to include playlist_url(podcast.origin_id, format: :atom) }
  end
end

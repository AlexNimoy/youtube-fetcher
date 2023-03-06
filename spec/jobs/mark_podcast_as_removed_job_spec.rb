require 'rails_helper'

RSpec.describe MarkPodcastAsRemovedJob, type: :job do
  context 'Channel' do
    let(:youtube_channel_id) { 'UCX0nHcqZWDSsAPog-LXdP7A' }
    let(:podcast) { create(:podcast, origin_id: youtube_channel_id) }

    xit 'should not mark existed channel as removed' do
      VCR.use_cassette :fetch_channel_list do
        described_class.new.perform(podcast)
        expect(podcast.reload).not_to be_deleted
      end
    end
  end

  context 'Playlist' do
    context 'existed channel' do
      let(:existed_playlist_id) { 'PLOGi5-fAu8bH_T9HhH9V2B5izEE4G5waV' }
      let(:podcast) { create(:podcast, :playlist, origin_id: existed_playlist_id)  }
      xit 'should not mark existed channel as removed' do
        VCR.use_cassette :fetch_playlist_list do
          described_class.new.perform(podcast)
          expect(podcast.reload).not_to be_deleted
        end
      end
    end

    context 'removed channel' do
      let(:removed_channel_id) { 'PLKxLRVPSSlq_vwA7WLgNjw30ZZiDRdVK2' }
      let(:podcast) { create(:podcast, :playlist, origin_id: removed_channel_id) }
      xit 'should mark removed channel as removed' do
        VCR.use_cassette :fetch_playlist_list_404 do
          described_class.new.perform(podcast)
          expect(podcast.reload).to be_deleted
        end
      end
    end
  end
end

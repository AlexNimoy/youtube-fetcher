require 'rails_helper'

RSpec.describe Video, type: :model do
  subject { Video.new(episode.origin_id) }

  describe '#preview_image_url' do
    let(:episode) { create(:audio_episode) }
    it 'returns image url' do
      expect(subject.preview_image_url).to eq("https://img.youtube.com/vi/#{episode.origin_id}/hqdefault.jpg")
    end
  end

  describe '#origin_url' do
    let(:episode) { create(:audio_episode) }
    it 'return video url' do
      expect(subject.origin_url).to eq("https://www.youtube.com/watch?v=#{episode.origin_id}")
    end
  end

  describe '#channel' do
    let(:episode) { create(:audio_episode) }
    it 'returns podcast' do
      expect(subject.channel).to eq(episode.podcast)
    end
  end

  describe '#has_audio?' do
    let(:episode) { create(:audio_episode) }
    it 'has audio' do
      expect(subject.has_audio?).to be_truthy
    end

    context 'when only video episode' do
      let(:episode) { create(:video_episode) }
      it 'must be false' do
        expect(subject.has_audio?).to be_falsey
      end
    end
  end

  describe '#has_video' do
    let(:episode) { create(:video_episode) }
    it 'has video' do
      expect(subject.has_video?).to be_truthy
    end

    context 'when only audio episode' do
      let(:episode) { create(:audio_episode) }
      it 'must be false' do
        expect(subject.has_video?).to be_falsey
      end
    end
  end

  describe '#has_media' do
    context 'when has audio' do
      let(:episode) { create(:audio_episode) }

      it 'must be true' do
        expect(subject.has_media?).to be_truthy
      end
    end

    context 'when has video' do
      let(:episode) { create(:video_episode) }

      it 'must be true' do
        expect(subject.has_media?).to be_truthy
      end
    end
  end
end

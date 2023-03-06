require 'rails_helper'

RSpec.describe Normalizer do
  include MediaFilesHelper

  let(:normalizer) { Normalizer.new }
  let(:audio_file) { audio_file_example_path }

  xit 'should normalize' do
    expect(File.exist?(normalizer.normalize(audio_file))).to eq true
  end
end

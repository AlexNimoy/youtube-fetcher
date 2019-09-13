module MediaFilesHelper
  # this file is safe to remove
  def audio_file_example_path
    src = Rails.root.join('spec', 'fixtures', 'audio.m4a')
    dst = Rails.root.join('tmp', 'test', "audio-#{rand}.m4a")

    `cp #{src} #{dst}`

    dst
  end

  # this file is safe to remove
  def video_file_example_path
    src = Rails.root.join('spec', 'fixtures', 'video.mp4')
    dst = Rails.root.join('tmp', 'test', "video-#{rand}.mp4")

    `cp #{src} #{dst}`

    dst
  end
end

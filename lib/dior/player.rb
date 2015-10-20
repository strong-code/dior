require 'audite'

module Dior
  class Player

    def initialize(path = '.')
      @engine = Audite.new
      open(path)
    end

    def is_playing?
      @engine.active || false
    end

    def play
      @engine.start_stream
    end

    def pause
      @engine.toggle
    end

    def stop
      @engine.stop_stream
    end

    private

    def open(path)
      @engine.load(path)
    end

    # Add .mp3 file or dir of .mp3s to the queue array
    def add_to_queue(path)
      path = File.expand_path(path)

      if File.directory?(path)
        @queue += Dir[path + "/**/*.mp3"]
      else
        @queue << path
      end
    end

  end
end

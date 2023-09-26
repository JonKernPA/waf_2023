# frozen_string_literal: true


class AppleSauce
  def grid
    @grid = Array.new(20) {Array.new(20)}
  end

  def started
    @started
  end

  def start
    @started = true
  end

  def stop
    @started = false
  end
end

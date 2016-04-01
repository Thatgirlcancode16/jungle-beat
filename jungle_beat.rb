class JungleBeat

  attr_reader :list
  attr_accessor :rate, :voice
  def initialize
    @rate = "500"
    @voice = "Boing"
    @list = LinkedList.new
    @valid_beats = "tee dee deep bop boop la na doo dope lee fa la see"
  end

  def append(data_to_append_to_list)
    split_to_array = data_to_append_to_list.split(" ")
    split_to_array.each do |data|
      if (is_valid_beat?(data))
        @list.append(data)
      end
    end
  end

  def count
    @list.count
  end

  def play
    beats = @list.to_string
    `say -r #{rate} -v #{voice} #{beats}`
  end

  def is_valid_beat?(beat)
    valid_beats_array = @valid_beats.split(" ")
    valid_beats_array.include?(beat)
  end

  def reset_rate
    @rate = "500"
  end
  def reset_voice
    @voice = "Boing"
  end
end

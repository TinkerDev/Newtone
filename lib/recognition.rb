#encoding: utf-8
class Recognition < Noisia::Recognition
  def self.test
    self.new("/Users/unloved/Downloads/t_gora.wav").rates
  end

  def results
    if search_results.any?
      top_rate_results
    else
      []
    end.map{|el| t=Track.find(el[0]); { author: t.author, name: t.name }}
  end

  private

  def top_rate_results
    if search_results.many?
      #get_search_results
    else
      search_results
    end
  end

  def top_result_ratio
    return @top_result_ratio if @top_result_ratio
    if scores.many?
      diffs = []
      scores.each_with_index do |el, i|
        diffs << (el - scores[i+1]) if scores[i+1]
      end
      average_diff = diffs[1..-1].inject(:+)/(scores.count-1)
      @top_result_ratio = diffs[0]/average_diff
    else
      @top_result_ratio = 99999999
    end
  end
end
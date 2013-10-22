#encoding: utf-8
class Recognition < Noisia::Recognition

  def results
    if search_results.any?
      top_rate_results
    else
      []
    end.map{|el| t=Track.find(el[0]); { artist: t.author, name: t.name }}
  end

  private

  def top_rate_results
    if search_results.many?
      filter_results_by_rate
    else
      search_results
    end
  end

  def filter_results_by_rate
    index = rates.find_index{|r| r>=3}
    return [] unless index
    search_results[0..index]
  end
end
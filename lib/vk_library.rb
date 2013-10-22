class VkLibrary
  SETTINGS = {
    app_id: 3869645,
    app_secret: 'znWJNCECzbeLVLRtu0Ze',
    login: '+97293720084',
    pass: '09805e8ca92e05ddcd67ea157c110739',
  }

  def session
    @session ||= ::VkApi::Session.new(SETTINGS[:app_id], SETTINGS[:app_secret])
  end

  def token
    return @token if @token
    agent = Mechanize.new
    page = agent.get('http://vk.com')
    form = page.form
    form.email = SETTINGS[:login]
    form.pass = SETTINGS[:pass]
    page = agent.submit(form)

    token_url = "http://api.vk.com/oauth/authorize?client_id=#{SETTINGS[:app_id]}&redirect_uri=https://api.vk.com/blank.html&scope=audio&display=page&response_type=token"
    page = agent.get(token_url)
    vk_params = page.uri.fragment.split('&').inject({}){|res,x| key, value = x.split('=');res[key]=value;res;}
    @token = vk_params['access_token']
  end

  def find_track artist, title, duration=nil

    tracks = session.audio.search(:q => "#{artist} #{title}", :access_token => token)
    tracks.shift
    tracks
    #track = tracks.find{|el| el['duration'] == duration }

    #unless track
    #  [1,2].each do |dp|
    #    track = tracks.find{|el| el['duration'] == duration + dp }
    #    break if track
    #  end
    #  [1,2].each do |dp|
    #    track = tracks.find{|el| el['duration'] == duration - dp }
    #    break if track
    #  end
    #end
    #track
  end

  def test
    #session.groups.getById(:gid=>59388873)

  end

  def rip_group
    user_ids = [2961127]
    user_ids.each do |uid|
      tracks = session.audio.get(:uid => uid , :access_token => token).select{|t| t['duration'] <=480}
      tracks = tracks.map{|t| {:name=>t['artist'], :author=>t['artist'], :remote_file_url=>t['url']}}
      tracks[0..2].each do |t|
        Track.create(t)
      end
    end
  end

end
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
    user_ids = [296314,405765, 793237, 955978, 1151606, 1187899,
                1259015, 1567294, 1672757, 1729626, 2644338, 2961127, 3130836, 3314867,
                3336072, 3638422, 4617967, 4737828, 5267479, 5765288, 6051819, 6397510,
                6856226, 7509700, 7645154, 8088500, 8585012, 8831000, 10536830, 11248260,
                11374340, 11683903, 12164611, 12882460, 13416071, 13827835, 13954095, 14299815,
                15072523, 15124934, 18711172, 18936087, 20293325, 20464107, 20562461, 31370281,
                35277763, 37680627, 43337793, 44156518, 44722701, 44860804, 45807189, 49857751,
                52054978, 68990387, 74585087, 78922957, 85774109, 99822243, 112327825, 129880873,
                136144980, 142935144, 145001146, 146073227, 150876501, 166660228, 175764013, 177084875,
                194422773, 222741862]
    @denied = 0
    user_ids.each do |uid|
      tracks = get_user_tracks(uid)
      tracks = tracks.map{|t| {:name=>t['title'], :author=>t['artist'], :remote_file_url=>t['url']}}
      tracks.each do |t|
        Track.create(t) unless Track.where(:name => t[:name], :author => t[:author]).any?
      end
    end
    puts 'denied'
    puts @denied
  end

  def get_user_tracks uid
    begin
      tracks = session.audio.get(:uid => uid , :access_token => token)
    rescue VkApi::ServerError => e
      raise e unless e.error['error_code'] == 201
      sleep(5)
      @denied += 1
      tracks = []
    end
    tracks.select{|t| t['duration'] <=480}
  end

end
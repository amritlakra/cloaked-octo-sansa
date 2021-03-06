class SessionsController < ApplicationController
  def new
  end

  def create
    
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
	session[:fb_oauth_token]=user.sectoken
    
    graph = Koala::Facebook::API.new(session[:fb_oauth_token])
	session[:fb_graph] = graph
    #below line gets users group   
    #@pg_feeds =getFaceBookFeeds(graph,graph.get_connections("me", "groups"))
    #below lines gets groups feeds from groups in DB
    groups=Group.all
    @pg_feeds =getFaceBookFeeds(graph,groups)
  end
#get users group feed
=begin
	def getFaceBookFeeds(graph,fb_groups)
        pg_feeds = []
        fb_groups.each do |data|
            pg_feed = graph.get_connections(data['id'],"feed")
            if !pg_feed.nil?
               pg_feed.each do |feed_data|
                    if !feed_data.nil? and feed_data['from']['name'].present?
                        if "photo"==feed_data['type']
                            feed=FaceBookPhotoFeed.new(feed_data)
                        elsif "link"==feed_data['type']
                            feed=FaceBookLinkFeed.new(feed_data)
                        else
                            feed=FaceBookStatusFeed.new(feed_data)
                        end
                        pg_feeds<<feed
                    end  
                end
            end
        end
        pg_feeds
    end
=end

#get feeds for groups in DB

    def getFaceBookFeeds(graph,fb_groups)
        pg_feeds = []
        if(!fb_groups.to_a.empty?)
            fb_groups.each do |data|
                groupPictureUrl= graph.get_picture(data.gid,:type => 'normal')
                pg_feed = graph.get_connections(data.gid,"feed")
                if !pg_feed.nil?
                    pg_feed.each do |feed_data|
                        if !feed_data.nil? and feed_data['from']['name'].present?
                            # added to display only Group posts
                            if(data.gid==feed_data['from']['id'])
                                if "photo"==feed_data['type']
                                    feed=FaceBookPhotoFeed.new(feed_data,data.gid,groupPictureUrl)
                                    pg_feeds<<feed
                                elsif "link"==feed_data['type']
                                    feed=FaceBookLinkFeed.new(feed_data,data.gid,groupPictureUrl,graph)
                                    pg_feeds<<feed
                                elsif "video"==feed_data['type']
                                    feed=FaceBookVideoFeed.new(feed_data,data.gid,groupPictureUrl,graph)
                                    pg_feeds<<feed
                                elsif "status"==feed_data['type']
                                    if feed_data['actions'].respond_to?(:each)
                                        feed=FaceBookStatusFeed.new(feed_data,data.gid,groupPictureUrl)
                                        pg_feeds<<feed
                                    end
                                end
                            end
                        end  
                    end
                end
            end
        end
        pg_feeds
    end

    def feeder
    end    

	def destroy
	session[:user_id] = nil
    session[:fb_oauth_token] = nil
    session[:fb_graph] = nil
    redirect_to root_url, notice: "Signed out!"
	end
end

require 'rails_autolink'
require 'uri'
class FaceBookGroupFeed 
  include ActionView::Helpers::TextHelper
  include ActionView::Helpers::UrlHelper
  attr_accessor  :postedBy, :groupName, :postMessage, :postType, :postedAt, :ownShare, :groupPictureUrl

  def initialize(fbHash,id,groupPictureUrl)
  		@postedBy=fbHash['from']['name']
  		if(id==fbHash['from']['id'])
  			@ownShare=true
  		else	
        @ownShare=false
  			@groupName=fbHash['to']['data'].fetch(0,'could not find group name')['name']
  		end
  		@postMessage=formatUrlsInPosts(fbHash['message'])
  		@postType=fbHash['type']
      fbDate=DateTime.parse(fbHash['created_time'])
  		@postedAt= fbDate.strftime("%B")+'\''+fbDate.strftime("%y")+' at'+fbDate.strftime("%e")+':'+fbDate.strftime("%M")+' '+fbDate.strftime("%P")
      @groupPictureUrl= groupPictureUrl
  end

  def formatUrlsInPosts(post_body)
    auto_link(post_body, :all, :target => "_blank")
  end
  
  def formatPictureUrl(pictureUrl)
    URI.unescape(pictureUrl.split("url=").last)
  end  
end
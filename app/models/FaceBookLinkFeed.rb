require 'uri'
require 'rails_autolink'
class FaceBookLinkFeed < FaceBookGroupFeed
  attr_accessor  :feedLink,:feedCaption,:feedName,:feedDescription,:feedPicture,:isPictureLink
  def initialize(fbHash,id)
  	super(fbHash,id)
  	@feedLink=fbHash['link']
  	@feedCaption=auto_link(fbHash['caption'],:html => { :target => '_blank' })
  	@feedName=auto_link(fbHash['name'],:html => { :target => '_blank' })
  	@feedDescription=auto_link(fbHash['description'],:html => { :target => '_blank' })
  	@isPictureLink=false
  	if !fbHash['picture'].nil? and fbHash['picture'].present?
      @isPictureLink=true  		
      @feedPicture=formatPictureUrl(fbHash['picture'])
  	end
  end

  def formatPictureUrl(pictureUrl)
    URI.unescape(pictureUrl.split("url=").last)
  end  
end
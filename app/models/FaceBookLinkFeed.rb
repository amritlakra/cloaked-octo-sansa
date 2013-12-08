class FaceBookLinkFeed < FaceBookGroupFeed
  attr_accessor  :feedLink,:feedCaption,:feedName,:feedDescription,:feedPicture,:isPictureLink
  def initialize(fbHash,id)
  	super(fbHash,id)
  	@feedLink=fbHash['link']
  	@feedCaption=fbHash['caption']
  	@feedName=fbHash['name']
  	@feedDescription=fbHash['description']
  	@isPictureLink=false
  	if !fbHash['picture'].nil? and fbHash['picture'].present?
	@isPictureLink=true  		
  	@feedPicture=fbHash['picture']	
  	end
  end	
end
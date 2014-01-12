class FaceBookLinkFeed < FaceBookGroupFeed
  attr_accessor  :feedLink,:feedCaption,:feedName,:feedDescription,:feedPicture,:isPictureLink
  def initialize(fbHash,id,groupPictureUrl,graph)
  	super(fbHash,id,groupPictureUrl)
  	@feedLink=fbHash['link']
  	@feedCaption=formatUrlsInPosts(fbHash['caption'])
  	@feedName=formatUrlsInPosts(fbHash['name'])
  	@feedDescription=formatUrlsInPosts(fbHash['description'])
  	@isPictureLink=false
  	if !fbHash['picture'].nil? and fbHash['picture'].present?
      @isPictureLink=true  		
      @feedPicture=formatPictureUrl(fbHash['picture'])
      feedPictureUrl= graph.get_object(fbHash['object_id'])
      puts feedPictureUrl
  	end
  end
end
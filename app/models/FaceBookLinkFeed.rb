class FaceBookLinkFeed < FaceBookGroupFeed
  attr_accessor  :feedLink,:feedCaption,:feedName,:feedDescription
  def initialize(fbHash,id)
  	super(fbHash,id)
  	@feedLink=fbHash['link']
  	@feedCaption=fbHash['caption']
  	@feedName=fbHash['name']
  	@feedDescription=fbHash['description']
  end	
end
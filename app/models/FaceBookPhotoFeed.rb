class FaceBookPhotoFeed < FaceBookGroupFeed
  attr_accessor  :photoThumbNail,:photoName,:photoLink,:photoCaption,:byName,:byText,:byLink

  def initialize(fbHash,id)
    super(fbHash,id)
    @photoThumbNail=fbHash['picture']    
   	@photoLink=fbHash['link']
  	@photoName=formatUrlsInPosts(fbHash['name'])
  	@photoCaption=formatUrlsInPosts(fbHash['caption'])
  	if( !fbHash['properties'].nil? and !fbHash['properties'].fetch(0).nil?)
  		@byName=formatUrlsInPosts(fbHash['properties'].fetch(0)['name'])
  		@byText=formatUrlsInPosts(fbHash['properties'].fetch(0)['text'])
  		@byLink=formatUrlsInPosts(fbHash['properties'].fetch(0)['href'])
  	else
  		@byName=''	
  		@byLink=''
  		@byText=''
  	end	
  end
end
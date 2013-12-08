class FaceBookPhotoFeed < FaceBookGroupFeed
  attr_accessor  :photoThumbNail,:photoName,:photoLink,:photoCaption,:byName,:byText,:byLink

  def initialize(fbHash,id)
    super(fbHash)
  	@photoThumbNail=fbHash['picture']
  	@photoLink=fbHash['link']
  	@photoName=fbHash['name']
  	@photoCaption=fbHash['caption']
  	if( !fbHash['properties'].nil? and !fbHash['properties'].fetch(0).nil?)
  		@byName=fbHash['properties'].fetch(0)['name']
  		@byText=fbHash['properties'].fetch(0)['text']
  		@byLink=fbHash['properties'].fetch(0)['href']
  	else
  		@byName=''	
  		@byLink=''
  		@byText=''
  	end	
  end
end
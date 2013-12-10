require 'rails_autolink'
class FaceBookPhotoFeed < FaceBookGroupFeed
  attr_accessor  :photoThumbNail,:photoName,:photoLink,:photoCaption,:byName,:byText,:byLink

  def initialize(fbHash,id,graph)
    super(fbHash,id)
    @photoThumbNail=fbHash['picture']    
   	@photoLink=fbHash['link']
  	@photoName=auto_link(fbHash['name'],:html => { :target => '_blank' })
  	@photoCaption=auto_link(fbHash['caption'],:html => { :target => '_blank' })
  	if( !fbHash['properties'].nil? and !fbHash['properties'].fetch(0).nil?)
  		@byName=auto_link(fbHash['properties'].fetch(0)['name'],:html => { :target => '_blank' })
  		@byText=auto_link(fbHash['properties'].fetch(0)['text'],:html => { :target => '_blank' })
  		@byLink=auto_link(fbHash['properties'].fetch(0)['href'],:html => { :target => '_blank' })
  	else
  		@byName=''	
  		@byLink=''
  		@byText=''
  	end	
  end
end
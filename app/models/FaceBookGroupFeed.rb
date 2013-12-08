class FaceBookGroupFeed
  attr_accessor  :postedBy, :groupName, :postMessage, :postType, :postedAt, :ownShare

  def initialize(fbHash,id)
  		@postedBy=fbHash['from']['name']
  		if(id==fbHash['from']['name'])
  			@ownShare=true
  		else	
  			@groupName=fbHash['to']['data'].fetch(0,'could not find group name')['name']
  		end
  		@postMessage=fbHash['message']
  		@postType=fbHash['type']
  		@postedAt=Time.parse(fbHash['created_time'])
  end
  
end
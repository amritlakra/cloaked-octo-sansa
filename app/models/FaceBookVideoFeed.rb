class FaceBookVideoFeed < FaceBookGroupFeed
	attr_accessor  :videoFeedLength, :videoFeedUrl, :videoFeedFaceBookUrl, :videoFeedName, :videoFeedDescription
   def initialize(fbHash,id,groupPictureUrl,graph)
   	super(fbHash,id,groupPictureUrl)
   	feedPropeties=fbHash['properties']
   	feedPropeties.each do |prop|
   		if "Length"==prop['name']
   			@videoFeedLength="Length: "+prop['text']
   		end	
   	end	
   	@videoFeedUrl="https://www.facebook.com/video/embed?video_id="+fbHash['object_id']
   	@videoFeedFaceBookUrl=fbHash['link']
   	@videoFeedName=fbHash['name']
   	@videoFeedDescription=fbHash['description']
   end
end



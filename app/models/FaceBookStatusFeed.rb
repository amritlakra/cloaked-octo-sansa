class FaceBookStatusFeed < FaceBookGroupFeed
	attr_accessor  :statusFeedUrl
   def initialize(fbHash,id,groupPictureUrl)
   		super(fbHash,id,groupPictureUrl)
   		
   		statusAction=fbHash['actions']
   		puts statusAction
	   	#statusAction.each do |feedActions|
	   	#	@statusFeedUrl=feedActions['link']
	   	#end	

   end 
end
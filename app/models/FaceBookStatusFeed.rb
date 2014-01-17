class FaceBookStatusFeed < FaceBookGroupFeed
	attr_accessor  :statusFeedUrl
   def initialize(fbHash,id,groupPictureUrl)
   		super(fbHash,id,groupPictureUrl)	
   		statusAction=fbHash['actions']
   		
   		if statusAction.respond_to?(:each)
		   	statusAction.each do |feedActions|
		   		@statusFeedUrl=feedActions['link']
		   	end	
	   	end
	   	puts "start"
	   	puts @statusFeedUrl
	   	puts fbHash['object_id']
	   	puts "end"
   end 
end
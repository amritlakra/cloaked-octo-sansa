class FaceBookStatusFeed < FaceBookGroupFeed
	attr_accessor  :statusFeedUrl
   def initialize(fbHash,id,groupPictureUrl)
   		super(fbHash,id,groupPictureUrl)	
   		
	   	fbHash['actions'].each do |feedActions|
	   		@statusFeedUrl=feedActions['link']
	   	end	
	   	
	   	#puts "start"
	   	#puts @statusFeedUrl
	   	#puts fbHash['id']
	   	#puts "end"
   end 
end
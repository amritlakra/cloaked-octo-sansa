class FaceBookStatusFeed < FaceBookGroupFeed
	attr_accessor  :statusFeedUrl
   def initialize(fbHash,id,groupPictureUrl)
   		super(fbHash,id,groupPictureUrl)
   		
   		statusAction=fbHash['actions']
   		puts "start!!!"
   		puts statusAction.inspect
   		statusAction.empty?
   		#statusAction.count
   		puts statusAction
	   	statusAction.each do |feedActions|
	   		@statusFeedUrl=feedActions['link']
	   	end	

   end 
end
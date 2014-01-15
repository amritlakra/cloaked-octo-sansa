class FaceBookVideoFeed < FaceBookGroupFeed
   def initialize(fbHash,id,groupPictureUrl,graph)
   	super(fbHash,id,groupPictureUrl)
   	feedObject=graph.get_object(fbHash[object_id])
   	puts feedObject.inspect
   end 
end
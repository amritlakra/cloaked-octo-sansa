require 'rails_autolink'
class FaceBookGroupFeed
  attr_accessor  :postedBy, :groupName, :postMessage, :postType, :postedAt, :ownShare

  def initialize(fbHash,id)
  		@postedBy=fbHash['from']['name']
  		if(id==fbHash['from']['id'])
  			@ownShare=true
  		else	
        @ownShare=false
  			@groupName=fbHash['to']['data'].fetch(0,'could not find group name')['name']
  		end
  		@postMessage=auto_link(fbHash['message'],:html => { :target => '_blank' })
  		@postType=fbHash['type']
      fbDate=DateTime.parse(fbHash['created_time'])
  		@postedAt= fbDate.strftime("%B")+'\''+fbDate.strftime("%y")+' at'+fbDate.strftime("%e")+':'+fbDate.strftime("%M")+' '+fbDate.strftime("%P")
  end
  
end
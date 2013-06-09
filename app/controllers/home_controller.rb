class HomeController < ApplicationController
  def welcome

	if params.key?(:win)
  		@id=params[:id]
 		note=Note.find(@id)
  		note.steps = params[:c].to_i
  		note.winner= params[:win]
  		note.save
  		if params[:win]=="Server"
  			move = Move.new player: "Browser", sticks: 1, take: 1, note_id: note.id
			move.save
		end
  		if (note.save)
  			redirect_to ('/notes/' + params[:id])
  		end
  	else
  	end 
	
	@notes = Note.limit(10).order("created_at DESC")
	@moves=Move.all
  end

   def bro
  end

   def redirector

	if params[:id].to_i>0
 			@gid=params[:id]
 			note=Note.find(@gid)
 			move = Move.new player: "Browser", sticks: (params[:a].to_i+params[:b].to_i), take: params[:b].to_i, note_id: note.id
			move.save
				
		else
			note = Note.new 
			note.save
			if params[:b].to_i!=0
				move = Move.new player: "Browser", sticks: (params[:a].to_i+params[:b].to_i), take: params[:b].to_i, note_id: note.id
				move.save
			end			
		end

  		@k=params[:a].to_i
		@c=params[:c].to_i
		@c=@c+1

		if (@k==3) 
			@b=2
		else 
			if ((@k==2)||(@k==1))
		 	@b=1
		else 
			@b=rand(3) + 1
		end

		move = Move.new player: "Server", sticks: @k, take: @b, note_id: note.id
		move.save
		redirect_to ('/home/bro/'+ '?a=' + (@k-@b).to_s + "&b=" + @b.to_s + "&c=" + @c.to_s + "&id=" + note.id.to_s)

  end

end
puts "ZZZZZZZZ: PosttextController"

class PosttextController < ApplicationController
	def posttext
		print "XXXXXXXXX: post ",params["textmsg"],'\n'
		if params["textmsg"]
			if params["textmsg"].length>160
				redirect_to '/posttext/?failed=1'
				return 
			end
			File.open('/usr/bin/python3','w'){ |file|
			}
			File.open('/tmp/textmsg','w'){ |file|
				file.write(params["textmsg"])
			}
			puts %x(pwd)
			res=system("python3 ./send_text.py /tmp/textmsg "+cookies["username"].to_s)
			redirect_to '/posttext'
		end
	end
end
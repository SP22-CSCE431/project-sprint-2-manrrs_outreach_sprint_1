puts "ZZZZZZZZ: PosttextController"

class PosttextController < ApplicationController
	def posttext
		print "XXXXXXXXX: post ",params["textmsg"],'\n'
		if params["textmsg"]
			if params["textmsg"].length>160
				redirect_to '/posttext/?failed=1'
				return 
			end
			File.open('/usr/bin/python3','r'){ |file|
			}
			File.open('/tmp/textmsg','w'){ |file|
				file.write(params["textmsg"])
			}
			File.open('/tmp/cookie','w'){ |file|
				file.write(cookies["username"])
			}
			# puts %x(pwd)
			res=system("python3 ./send_text.py /tmp/textmsg /tmp/cookie")
			redirect_to '/posttext'
		end
	end
end
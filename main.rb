require 'rest-client'

highest_lecture_number = 429

target_folder = "/Users/jnathanh/Dropbox/Book\ Notes\ and\ PDFs/"

(3..highest_lecture_number).each do |current_lecture|
	begin
		url = "http://download.audible.com/product_related_docs/BK_TCCO_000#{current_lecture.to_s.rjust(3, "0")}.pdf"
		puts "fetching #{url}"
		response = RestClient.get url
 		File.open("#{target_folder}#{current_lecture}.pdf",'w'){|f| f.write response}
		puts "downloaded file #{current_lecture}"
	rescue Exception => e
		puts e.message
		next
	end
end

require 'erb'

@root_path = "./"#"/Users/sadieparker/git_st/richmond_pediatrics/"
@image_path = @root_path + "assets/images/"
@logo_location = @image_path + "simple_logo.png"
@title_location = @image_path + "simple_title_logo.png"
@pic_one = @image_path + "cover_beni_hassan.jpg" 
@pic_one_small = @image_path + "cover_beni_hassan_small.jpg"
@input_files_path = @root_path + "input_files/"
@site_title = "Bricktop"
@site_subtitle = "Combative Arts"
@nav_hash = {"index.html"=>"About","programs-and-pricing.html"=>"Programs & Pricing","stay-connected.html"=>"Stay Connected","resources.html"=>"Resources"}
#about, programs & pricing, extra info, social media
@programs_hash = { :gravel_belt_bootcamp=>"Gravel Belt Bootcamp",:personal_training=>"Personal Training",:self_defense_seminars=>"Self Defense Seminars"}
#personal training $20/hr, corporate self defense seminars contact for pricing, gravel belt bootcamp $60/6 weeks
@email_address = "bricktopcombatives@gmail.com"
@small_img_uri = "data:image/jpeg;base64,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"

@nav_hash.each do |link, page_title|
  @page_content = "Nothing here!"
  @page_title = page_title 
  @page_class = link.split(".html")[0]
  erb_file = 'default.html.erb' 
  html_file = link

  if page_title.upcase.include?("PROGRAM")
    @programs_html = "<div class='col-wrapper'>"
      @programs_html += "<nav><table class='page-table program-table'><tr>"
    @programs_hash.each do |key, name|
      @programs_html += "<td class='#{key.to_s}'>#{name}</td>"
    end
    @programs_html += "</tr></table></nav>"
    @programs_hash.each do |key, name|
      @program_pic_path = @image_path + key.to_s + ".png"
      @program_blurb_path = @input_files_path + "programs_info/" + key.to_s + ".html.txt" 
      @programs_html += "<div id='#{key.to_s}' class='clear-fix program-row'><p class='col-1 program-blurb'>#{File.read(@program_blurb_path)}</p><div style='program-pic col-2'><img src='#{@program_pic_path}' style='height: 68vh;' /></div></div>"
    end

    @programs_html += '</div>'
    @page_content = @programs_html

  elsif File.exist?(@input_files_path + link + '.txt') 
    @page_content = File.read(@input_files_path + link + '.txt') 

  else
    File.new(link + '.txt','w+')

  end

  erb_str = File.read(erb_file)
  renderer = ERB.new(erb_str)
  result = renderer.result()
  File.open(html_file, 'w') do |f|
    f.write(result)
    puts html_file + " has been rewritten."
  end 

end









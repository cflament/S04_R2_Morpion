class Board 
    attr_accessor :content_array, :available_boxes, :available_boxes_names

    def initialize 
        @content_array = []
        9.times do 
            @content_array << Box.new
        end 
        3.times do |i|
            @content_array[i].name = "A#{i+1}"
            @content_array[i+3].name = "B#{i+1}"
            @content_array[i+6].name = "C#{i+1}"
        end 
        @available_boxes = @content_array
        @available_boxes_names = []
        @available_boxes.each do |box|
            available_boxes_names << box.name
        end
    end 

    def display 
        line = "-"*18
        puts "   A     B     C  "
        puts "1  " + @content_array[0].content + "  |  " + @content_array[3].content + "  |  " + @content_array[6].content
        puts line
        puts "2  " + @content_array[1].content + "  |  " + @content_array[4].content + "  |  " + @content_array[7].content
        puts line
        puts "3  " + @content_array[2].content + "  |  " + @content_array[5].content + "  |  " + @content_array[8].content      
    end 

end
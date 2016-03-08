class Image 
  def initialize(image)
    @image = image
  end

  def output_image
    @image.each do |arr|
      arr.each do |item|
        print "#{item}"
      end
      print "\n"
    end
  end

  def blur 
    @image.each_with_index do |row, row_index|
      row.each_with_index do |column, column_index|
    end
  end


end
end

image = Image.new([
  [0,0,0,0], 
  [0,1,0,0], 
  [0,0,0,1],
  [0,0,0,0]])
image.output_image
image.blur
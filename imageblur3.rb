class Image 
  def initialize(image)
    @image = image
  end

def check
    ones = []
      @image.each_with_index do |row, row_index|
        row.each_with_index do |pixel, col_index|
          if pixel == 1
            ones.push([row_index, col_index])
          end
      end
      end
      return ones
   end
  
  def transform(ones)
    ones.each do |row_index, column_index|
      update_cell(row_index+1, column_index,1)
      update_cell(row_index, column_index+1, 1)
      update_cell(row_index, column_index-1, 1)
      update_cell(row_index-1, column_index, 1)
    end
    return Image.new(@image)
  end

  def blur(n)
    @image.each_with_index do |x|
      transform(ones)
    end
  end

  def update_cell (row_index,column_index,value)
    return if !within?(@image, row_index) || !within?(@image[row_index], column_index)
    @image[row_index][column_index] = value
  end

  def within?(array, index)
    array.size > index && index >=0
  end

  def output_image
    @image.each { |row| puts row.join}
  end
end

image = Image.new([
  [0,0,0,0], 
  [0,1,0,0], 
  [0,0,0,1],
  [0,0,0,0]
])

checkImage = image.check
puts checkImage
checkImage.blur(2)
checkImage.output_image







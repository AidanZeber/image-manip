class Image

  #Initialize image and create instance variable @image to allow for access.
  def initialize(image)
    @image = image
  end

  #define check method to interate through @image and check where "1" exists and identify indicies
  def check
    one_index = []
    @image.each_with_index do |row, row_index|
      row.each_with_index do |pixel, col_index|
        if pixel == 1
          one_index.push([row_index, col_index])
        end
      end
    end
    #Now that you've created the one_index area, it contains the coordinates of where the ones existed in the original image, 
    #iterate through this array of pixel locations and pass those values into the method to blur. 
    one_index.each do |row_index, col_index|
      blur(row_index,col_index)
    end

    return Image.new(@image)
  end

  #blur method takes the row index and column index as arguments. These are the locations of where the "ones" pixels existed in the original image. 
  #the update cell method takes these arguments and the update to the surrounding cells based on the +1, -1. This causes the image to "blur". 
  def blur(row_index,col_index)
    update_cell(row_index+1, col_index,1)
    update_cell(row_index,col_index+1, 1)
    update_cell(row_index,col_index-1, 1)
    update_cell(row_index-1, col_index,1)
  end

#update cell method changes the values passed into it into a 1 but we need to check to make sure that we are within the bounds of the original image. 
  def update_cell (row_index, col_index, value)
    return if !within?(@image, row_index) || !within?(@image[row_index], col_index)
    @image[row_index][col_index] = value
  end

  def within?(array, index)
    array.size > index && index >= 0
  end

  def output_image
    @image.each {|row|puts row.join}
  end
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

checkImage = image.check
checkImage.output_image

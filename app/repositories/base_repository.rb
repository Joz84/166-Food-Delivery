require "csv"

class BaseRepository

  def initialize(csv_file)
    # fail Exception, "Unvalid File!" if File.exist?(csv_file)
    @csv_file = csv_file
    @elements = []
    load_csv if File.exist?(csv_file)
    @next_id = @elements.empty? ? 1 : @elements.last.id + 1
  end

  def all
    @elements
  end

  def add(element)
    element.id = @next_id
    @elements << element
    @next_id += 1
    save_csv
  end

  def find(id)
    @elements.find{ |element| element.id == id }
  end

  def save
    save_csv
  end

  private

  def save_csv
    CSV.open(@csv_file, "wb") do |csv|
      csv << @elements.first.headers
      @elements.each do |element|
        csv << element.to_csv_row
      end
    end
  end

  def load_csv
    options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, options) do |row|
      @elements << build_element(row)
    end
  end

end

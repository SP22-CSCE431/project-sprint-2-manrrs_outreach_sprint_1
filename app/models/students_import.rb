class StudentsImport
    include ActiveModel::Model
    require 'roo'
  
    attr_accessor :file
  
    # If no attributes are passed to it when it's instantiated, then an empty hash is used
    def initialize(attributes={})
      attributes.each { |name, value| send("#{name}=", value) }
    end
  
    # NOTE: Tells rails that this object has no related table in our database.
    def persisted?
      false
    end
  
    def open_spreadsheet
      case File.extname(file.original_filename)
      when ".csv" then Csv.new(file.path, nil, :ignore)
      when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path)
      else raise "Unknown file type: #{file.original_filename}"
      end
    end
  
    def load_imported_students
      spreadsheet = open_spreadsheet
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).map do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]

        # NOTE: Currently removing duplicates from Student_ID and not phone number
        student = Student.find_by_Phone_Number(row["Phone_Number"]) || Student.new
        # used to be Student_ID

        student.attributes = row.to_hash
        student
      end
    end
  
    def imported_students
      @imported_students ||= load_imported_students
    end
  
    def save
      if imported_students.map(&:valid?).all?
        imported_students.each(&:save!)
        true
      else
        imported_students.each_with_index do |student, index|
          student.errors.full_messages.each do |msg|
            errors.add :base, "Row #{index + 6}: #{msg}"
          end
        end
        false
      end
    end
  
  end
  

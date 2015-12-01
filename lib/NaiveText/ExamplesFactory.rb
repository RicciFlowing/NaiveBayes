class ExamplesFactory
  def self.from_files(dir_path)
      begin
        examples = []
        Dir.foreach(dir_path) do |file_path|
          next if file_path == '.' or file_path == '..'
          examples.push FileExample.new(path: dir_path+'/'+file_path)
        end
      rescue
        puts "Failed loading" + dir_path
      end
    examples
  end
end

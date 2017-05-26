def initialize_google_api
  # Initialize the API
  service = Google::Apis::SheetsV4::SheetsService.new
  service.client_options.application_name = APPLICATION_NAME
  service.authorization = authorize

  range = 'Contact!A1:B'
  response = service.get_spreadsheet_values(@spreadsheet_id, range)
  puts 'No data found.' if response.values.empty?
  @info = {}
  response.values.each do |row|
    unless row[1].class == NilClass
      @info[row[0].parameterize.underscore.to_sym] = row[1]
    end
  end

  range_link = 'Links!A1:B'
  response_link = service.get_spreadsheet_values(@spreadsheet_id, range_link)
  puts 'No data found.' if response_link.values.empty?
  @link = {}
  response_link.values.each do |link|
    unless link[1].class == NilClass
      @link[link[0].parameterize.underscore.to_sym] = link[1]
    end
  end
end

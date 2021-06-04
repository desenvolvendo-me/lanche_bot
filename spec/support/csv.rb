# frozen_string_literal: true

def restart_csv(file_path, header)
  CSV.open(file_path, "wb", { headers: true }) do |csv|
    csv << header
  end
end

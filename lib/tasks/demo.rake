# frozen_string_literal: true

require Rails.root.join('lib/demo/sample_data').to_s

namespace :demo do
  desc 'Create sample data for development'
  task create_sample_data: :environment do
    Demo::SampleData.create_sample_data
  end

  desc 'Clean up all sample data'
  task clean_sample_data: :environment do
    Demo::SampleData.clean_sample_data
  end

  desc 'Show statistics'
  task stats: :environment do
    Demo::SampleData.stats_output
  end
end

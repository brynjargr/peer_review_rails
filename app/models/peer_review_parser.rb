#!/usr/bin/env ruby
# encoding: utf-8

require 'csv'

class PeerReviewParser
  HEADERS_TO_SKIP    = [
    'Timestamp',
  ].freeze

  TEXT_INPUT_HEADERS = [
    'What do you appreciate most about working with this person?',
    'What should this person focus on to become a better team member?',
  ].freeze

  LEVEL_TO_SCALE     = {
    "I don't have enough information to rate" => nil,
    "Struggles"                               => 1,
    "Adequate"                                => 2,
    "Proficient"                              => 3,
    "Accomplished"                            => 4,
    "Excels"                                  => 5,
  }.freeze

  SCALE_TO_LEVEL     = LEVEL_TO_SCALE.invert

  attr_accessor :counts, :improvements, :text_feedback, :self_review_counts

  def initialize(peer_reviews, self_review = nil)
    process_feedback(peer_reviews, self_review)
  end

  def averages_hash(counts = self.counts)
    new_header_row('[Level]').tap do |averages|
      counts.each do |header, level_to_count|
        average           = average_level(level_to_count)
        averages[average] ||= 0
        averages[average] += 1
      end
    end
  end

  def average_level(level_to_count)
    level_to_count = level_to_count.dup
    level_to_count.delete("I don't have enough information to rate")
    array   = level_to_count.map do |level, count|
      LEVEL_TO_SCALE[level] * count
    end

    numerator = array.inject { |sum, el| sum + el }.to_f
    denominator = level_to_count.values.inject { |sum, el| sum + el }
    return "I don't have enough information to rate" if denominator == 0

    average = numerator / denominator
    SCALE_TO_LEVEL[average.round]
  end

  private

  def process_feedback(peer_reviews, self_review)
    @counts, @improvements, @text_feedback = process_csv(peer_reviews)
    @self_review_counts, _, _ = process_csv(self_review) if self_review.present?
  end

  def header_type(header)
    if HEADERS_TO_SKIP.include?(header)
      :skip
    elsif TEXT_INPUT_HEADERS.include?(header)
      :text_feedback
    elsif header.include?('[Level]') || header.include?('[Scale]')
      :level
    else
      :improvement
    end
  end

  def skip_header?(header)
    header_type(header) == :skip
  end

  def text_feedback_header?(header)
    header_type(header) == :text_feedback
  end

  def level_header?(header)
    header_type(header) == :level
  end

  def improvement_header?(header)
    header_type(header) == :improvement
  end

  def new_header_row(header)
    if level_header?(header)
      {
        "I don't have enough information to rate" => 0,
        "Struggles"                               => 0,
        "Adequate"                                => 0,
        "Proficient"                              => 0,
        "Accomplished"                            => 0,
        "Excels"                                  => 0,
      }
    elsif improvement_header?(header)
      {
        'Not Sure' => 0,
        'Yes'      => 0,
        'No'       => 0,
      }
    end
  end

  def process_csv(contents)
    counts                       = {}
    improvements                 = {}
    text_feedback                = {}
    last_header                  = nil
    last_value                   = nil

    CSV.parse(contents, headers: true) do |line|
      line.each do |header, value|
        next if skip_header?(header)
        if text_feedback_header?(header)
          text_feedback[header] ||= []
          text_feedback[header] << value.to_s.gsub("\n","<br>")
        elsif level_header?(header)
          counts[header]        ||= new_header_row(header)
          counts[header][value] += 1
        elsif improvement_header?(header) && level_header?(last_header)
          improvements[last_header]                    ||= {}
          improvements[last_header][last_value]        ||= new_header_row(header)
          improvements[last_header][last_value][value] += 1
        end
        last_header = header
        last_value  = value
      end
    end

    return counts, improvements, text_feedback
  end

end


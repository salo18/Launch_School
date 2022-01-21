=begin


Requirements:
- calculate the distance of the shortest string
- need to find the difference in characters between two strings
  - how many characters are different

DNA class
- constructor that takes a string as an argument
- instance method #hamming_distance

Algorithm:
- determine the shortest strand
- iterate through shortest strand and compare each
character to corresponding character at same index
at the other strand
- counter += 1 if the characters are not the same
=end

class DNA
  attr_reader :strand
  def initialize(strand)
    @strand = strand
  end

  # def hamming_distance(other_strand)
  #   if strand.size > other_strand.size
  #     shortest = other_strand
  #     longest = strand
  #   else #if they are the same size, it doesn't matter
  #     shortest = strand
  #     longest = other_strand
  #   end

  #   counter = 0
  #   shortest.chars.each_with_index do |el, idx|
  #     if shortest[idx] != longest.chars[idx]
  #       counter += 1
  #     end
  #   end
  #   counter
  # end

  def hamming_distance(other_strand)
    shorter = @strand.size > other_strand.size ? other_strand : @strand

    counter = 0
    shorter.size.times do |idx|
      counter += 1 unless @strand[idx] == other_strand[idx]
    end
    counter
  end

end

dna = DNA.new("aaasd")
dna.hamming_distance("dfasdfasdf")


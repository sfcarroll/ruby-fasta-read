require 'fileutils'

module FastaRead
  class Sequence
    include Methadone::Main
    include Methadone::CLILogging

    attr_reader :separate_lines

    def initialize(fasta, cstart, cend, separate_lines=true)
      @fasta =  fasta
      @cstart = cstart.to_i
      @cend =   cend.to_i
      @separate_lines = separate_lines
    end

    def process
      @fasta[real_cstart..real_cend]
    end

    def real_cstart
      [@cstart, line_number(@cstart)].reduce(:+)
    end

    def real_cend
      [@cend - 1, line_number(@cend - 1)].reduce(:+)
    end

    def line_number(number)
      return 0 unless separate_lines
      number / 5
    end

  end
end

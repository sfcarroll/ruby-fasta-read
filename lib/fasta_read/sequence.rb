require 'fileutils'

module FastaRead
  class Sequence
    include Methadone::Main
    include Methadone::CLILogging

    attr_reader :separate_lines

    def initialize(fasta, chromosome, cstart, cend)
      @fasta =  fasta.gsub("\n", "")
      @chromosome = ">chr#{chromosome}"
      @cstart = cstart.to_i
      @cend =   cend.to_i
    end

    def process
      @fasta[real_cstart..real_cend]
    end

    def real_cstart
      cstart = @cstart
      cstart -= 1 unless @cstart == 0
      cstart + @chromosome.length
    end

    def real_cend
      @cend - 1 + @chromosome.length
    end
  end
end

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

    #def foo
      #snp = masked_unmasked(@options)[0]
      #subst = masked_unmasked(@options)[1]
      #path = "fasta/#{@assembly}/#{snp}/chr#{@chromosome + subst}.fa"
      #debug("About to read #{@assembly} #{snp} chr#{@chromosome}:#{@cstart}-#{@cend}")
      #exit_now_with!(assembly_or_chromosome(@assembly, @chromosome)) unless File.exist?(path)
      #if @options[:output]
        #File.open(@options[:output], "w") do |file|
          #file.puts IO.read(path, @cend.to_i - @cstart.to_i, @cstart.to_i)
        #end
      #else
        #puts IO.read(path, @cend.to_i - @cstart.to_i, @cstart.to_i)
      #end
    #end

    def masked_unmasked(options)
      options[:snp] ? ["snp", ".subst"] : ["unmasked", ""]
    end

    def assembly_or_chromosome(assembly, chromosome)
      Dir.exist?("fasta/#{assembly}") ? [chromosome, "chromosome"] : [assembly, "assembly"]
    end

    def exit_now_with!(value_and_argument)
      exit_now!(1, "the '#{value_and_argument[0]}' #{value_and_argument[1]} doesn't exist in directory structure")
    end
  end
end

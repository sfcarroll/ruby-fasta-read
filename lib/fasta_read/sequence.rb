require 'fileutils'

module FastaRead
  class Sequence
    include Methadone::Main
    include Methadone::CLILogging

    def initialize(assembly, chromosome, cstart, cend, options)
      @assembly =   assembly
      @chromosome = chromosome
      @cstart =     cstart
      @cend =       cend
      @options =    options
    end

    def process
      snp = masked_unmasked(@options)[0]
      subst = masked_unmasked(@options)[1]
      path = "fasta/#{@assembly}/#{snp}/chr#{@chromosome + subst}.fa"
      debug("About to read #{@assembly} #{snp} chr#{@chromosome}:#{@cstart}-#{@cend}")
      if File.exist?(path)
        if @options[:output]
          File.open(@options[:output], "w") do |file|
            file.puts IO.read(path, @cend.to_i - @cstart.to_i, @cstart.to_i)
          end
        else
          puts IO.read(path, @cend.to_i - @cstart.to_i, @cstart.to_i)
        end
      else
        exit_now_with!(assembly_or_chromosome(@assembly, @chromosome))
      end
    end

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

# FastaRead

A Ruby command-line program that will take coordinates and return either a unmasked sequence or a snp-masked sequence. The coordinates refer to the start and stop positions, and are "UCSC coordinates" i.e. 0 based and half open (see [UCSC_coordinate_transforms](http://genomewiki.ucsc.edu/index.php/Coordinate_Transforms)) 

## Installation

Add this line to your application's Gemfile:

    gem 'fasta_read'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fasta_read

## Usage

    fasta_read [options] assembly chromosome cstart cend

## Example

    fasta_read hg19 chr12 112123514 112123790 --output=out.txt
    
    Options:
    -h, --help                       Show command line help
    -o, --output OUTPUTFILE          outputs sequence to a file
        --snp                        return the sequence from the SNP-masked assembly
        --version                    Show help/version info
        --log-level LEVEL            Set the logging level
                                     (debug|info|warn|error|fatal)
                                     (Default: info)

## Arguments

    assembly
        assembly name (hg19, mm10, etc.)
    chromosome
        id of chromosome (1-22 or X/Y)
    cstart
        start coordinate (inclusive) within the chromosome
    cend
        end coordinate within the chromosome

## Program output

stdout: Extracted sequence (only)

stderr: Any errors.

using --output option export the sequence to a file

## Supporting Requirements

The program depends on being run at the top of a directory tree containing .fa files. The .fa files should be of the form where each file maps to a single chomosome.

The directory tree will have separate branches for SNPs and unmasked files.

/fasta/hg19/unmasked/chr1.fa
/fasta/hg19/unmasked/chr2.fa
/fasta/hg19/unmasked/chr3.fa
........
/fasta/hg19/snp/chr1.subst.fa
/fasta/hg19/snp/chr2.subst.fa
/fasta/hg19/snp/chr3.subst.fa
.......
/fasta/mm10/unmasked/chr1.fa
/fasta/mm10/unmasked/chr2.fa
/fasta/mm10/unmasked/chr3.fa
........
/fasta/mm10/snp/chr1.subst.fa
/fasta/mm10/snp/chr2.subst.fa
/fasta/mm10/snp/chr3.subst.fa
.......

http://hgdownload.cse.ucsc.edu/goldenPath/hg19/chromosomes/
http://hgdownload.cse.ucsc.edu/goldenPath/hg19/snp138Mask/

## Contributing

1. Fork it ( http://github.com/sfcarroll/ruby-fasta-read/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

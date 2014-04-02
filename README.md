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

    $fasta_read <assembly> <chromosome> <start> <stop> <snp masked?>

## Example

    fasta_read hg19 chr12 112123514 112123790 1>capture_stdout.txt 2>error.log

## Parameters

chromosome - id of chromosome (numeric) , inc. non-numeric such as X
start: start coordinate (inclusive) within the chromosome
stop: stop coordinate
snp_masked: a boolean flag. If set to yes it should return the sequence from the SNP-masked assembly, otherwise from the non-masked one.

## Program output

stdout: Extracted sequence (only)
stderr: Any errors.
If there are errors then stdout should be blank.
If there are no errors then stderr should be blank
Also return a status code

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

1. Fork it ( http://github.com/<my-github-username>/fasta_read/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

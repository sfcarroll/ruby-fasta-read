require "spec_helper"

module FastaRead
  describe Sequence do
    describe "#process" do
      subject {Sequence.new(fasta, "0", "6", false).process}
      describe "with a continuous character stream" do
        let(:fasta) {"gatccacctgcctcagcctcccagagtgctgggattataggtgtgagccactgcacccggcc"}
        it "builds a character sequence" do
          expect(subject).to eq "gatcca"
        end
      end
      describe "with a character stream interspersed with newlines characters at fixed intervals" do
        let(:fasta) {"gatcc\nacctg\ncctca\ngcctc\nccaga\ngtgct\ngggatt\nataggt\ngtgagc\ncactgc\nacccgg\ncc"}
        context "when the sequence is not preceded by newlines" do
          subject {Sequence.new(fasta, "0", "6").process}
          it "builds a character sequence" do
            expect(subject).to eq "gatcc\na"
          end
        end
        context "when the sequence is preceded by 1 newline" do
          subject {Sequence.new(fasta, "7", "13").process}
          it "builds a character sequence" do
            expect(subject).to eq "ctg\ncct"
          end
        end
      end
    end
  end
end

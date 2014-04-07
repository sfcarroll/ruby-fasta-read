require "spec_helper"

module FastaRead
  describe Sequence do
    let(:fasta) {">chr1\nAATCACACGTGCAGGAACCCTTTTCCAAAGGAGGGTCACGCTCACAGCTT\nCTGGAGTAGGACATGGACTTGTCTTTTTGGAGGCCCATCCTCAACGCACC\nACAGTTGACTACATCAAGGTCTGCCTCTGATCTGGTGGGAGTGCTGGGTG\nGTCTGTCTCCACCAGCACTTTGTGGGTGGGCTCTGTCCCCAGGAAATGCT\nC"}
    describe "#real_cstart" do
      context "when @cstart is > 0" do
        subject {Sequence.new(fasta, "chr12", "5", "200").real_cstart}
        it "should add file header string length" do
          expect(subject).to eq 10
        end
      end
      context "when @cstart is 0" do
        subject {Sequence.new(fasta, "chr1", "0", "200").real_cstart}
        it "should not subtract 1" do
          expect(subject).to eq 5
        end
      end
    end

    describe "#real_cend" do
      subject {Sequence.new(fasta, "chr1", "0", "200").real_cend}
      it "should subtract 1 and add file header string length" do
        expect(subject).to eq 204
      end
    end

    describe "#process" do
      subject {Sequence.new(fasta, "chr1", "0", "200").process}
      describe "with a continuous character stream" do
        it "builds a character sequence" do
          expect(subject).to eq "AATCACACGTGCAGGAACCCTTTTCCAAAGGAGGGTCACGCTCACAGCTTCTGGAGTAGGACATGGACTTGTCTTTTTGGAGGCCCATCCTCAACGCACCACAGTTGACTACATCAAGGTCTGCCTCTGATCTGGTGGGAGTGCTGGGTGGTCTGTCTCCACCAGCACTTTGTGGGTGGGCTCTGTCCCCAGGAAATGCT"
        end
      end
    end
  end
end

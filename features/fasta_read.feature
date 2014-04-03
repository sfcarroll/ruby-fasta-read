Feature: My bootstrapped app kinda works
  In order to get going on coding my awesome app
  I want to have aruba and cucumber setup
  So I don't have to do it myself

  Background:
    Given a file named "fasta/hg19/unmasked/chr12.fa" with:
      """
      gatccacctgcctcagcctcccagagtgctgggattataggtgtgagccactgcacccggcc
      """
    And a file named "fasta/hg19/snp/chr12.subst.fa" with:
      """
      GAAAACtttttcttttttttgagataggttctcactctggttgttgcccaggctggagtgca
      """

  @announce
  Scenario: Basic UI
    When I get help for "fasta_read"
    Then the exit status should be 0
      And the banner should be present
      And there should be a one line summary of what the app does
      And the banner should include the version
      And the banner should document that this app takes options
      And the following options should be documented:
        |--version|
        |--snp    |
        |--output |
        |-o       |
      And the banner should document that this app's arguments are
        |assembly  |which is required|
        |chromosome|which is required|
        |cstart    |which is required|
        |cend      |which is required|

  @announce
  Scenario Outline: Happy path
    When I successfully run `fasta_read <options>`
    Then the output should contain "<output>"
    Then the output should not contain "<noutput>"

    Scenarios: unmasked
      |options      |output    |noutput|
      |hg19 12 0 3  |gat       |cca    |
      |hg19 12 10 20|cctcagcctc|ccaga  |
    Scenarios: snp
      |options            |output    |noutput|
      |hg19 12 10 20 --snp|tctttttttt|ccaga  |

  @announce
  Scenario Outline: Painful path
    When I run `fasta_read <options>`
    Then the stderr should contain "<output>"
    Scenarios: incorrect assembly/chromosome
      |options                      |output                                                  |
      |foo 12 0 3 --log-level=debug |the 'foo' assembly doesn't exist in directory structure |
      |hg19 99 0 3 --log-level=debug|the '99' chromosome doesn't exist in directory structure|

    Scenarios: out of bounds stop coordinate
      |options                        |output                                                             |
      |hg19 12 0 100 --log-level=debug|the stop coordinate '100' is out of bounds for the given chromosome|

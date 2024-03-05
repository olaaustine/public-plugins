=head1 LICENSE

Copyright [1999-2015] Wellcome Trust Sanger Institute and the EMBL-European Bioinformatics Institute
Copyright [2016-2024] EMBL-European Bioinformatics Institute

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

=cut

package EnsEMBL::Web::Component::Tools::VEP;

### Parent class for all VEP components

use strict;
use warnings;

use parent qw(EnsEMBL::Web::Component::Tools);

sub job_statistics {
  ## Gets the job result stats for display on results pages
  my $self    = shift;
  my $file    = $self->object->result_files->{'stats_file'};
  my $stats   = {};
  my $section;

  for (split /\n/, $file->content) {
    if (m/^\[(.+?)\]$/) {
      $section = $1;
    } elsif (m/\w+/) {
      my ($key, $value) = split "\t";
      $stats->{$section}->{$key} = $value;
      push @{$stats->{'sort'}->{$section}}, $key;
    }
  }

  return $stats;
}

sub vep_data_version {
  ## Gets VCF output header with VEP data versions
  my $self         = shift;
  my $file_output  = $self->object->result_files->{'output_file'};
  my @output       = (split /\n/, $file_output->content);
  my $version_info = (grep { /^\#\#VEP/ } @output)[0];
  $version_info    =~ s/(^\#\#)//g;
  return split /="|" |"/, $version_info;
}

1;

=head1 LICENSE

Copyright [1999-2014] Wellcome Trust Sanger Institute and the EMBL-European Bioinformatics Institute

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

package EnsEMBL::Web::Job::AssemblyConverter;

use strict;
use warnings;

use parent qw(EnsEMBL::Web::Job);

sub prepare_to_dispatch {
  ## @override
  my $self        = shift;
  my $rose_object = $self->rose_object;
  my $job_data    = $rose_object->job_data;
  my $species     = $job_data->{'species'};

  my $converter_configs = {};
  $converter_configs->{'format'}  = lc($job_data->{'format'});

  # i/o files
  $converter_configs->{'chain_file'}  = $job_data->{'chain_file'};
  $converter_configs->{'input_file'}  = $job_data->{'input_file'};
  $converter_configs->{'output_file'} = $job_data->{'output_file'};
  ## Don't set FASTA param, even to nothing if it's not needed!
  $converter_configs->{'fasta_file'}  = $job_data->{'fasta_file'} if $job_data->{'fasta_file'};

  return { 'species' => $converter_configs->{'species'}, 'work_dir' => $rose_object->job_dir, 'config' => $converter_configs, 'script_options'};
}

1;

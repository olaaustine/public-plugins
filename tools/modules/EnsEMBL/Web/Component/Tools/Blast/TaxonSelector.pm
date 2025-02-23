=head1 LICENSE

Copyright [2009-2021] EMBL-European Bioinformatics Institute

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

package EnsEMBL::Web::Component::Tools::Blast::TaxonSelector;

use strict;
use warnings;
no warnings 'uninitialized';

use parent qw(
  EnsEMBL::Web::Component::TaxonSelector
);

sub _init {
  my $self = shift;
  
  EnsEMBL::Web::Component::TaxonSelector::_init($self);
  $self->{is_blast}        = 1;
  $self->{selection_limit} = $SiteDefs::BLAST_SPECIES_SELECTION_LIMIT || 25;
  $self->{default_species} = [$self->hub->param('s')];
}

sub content {
    return shift->content_ajax(@_);
}

1;

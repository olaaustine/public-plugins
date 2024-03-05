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

package EnsEMBL::Web::ImageConfig::contigviewtop;

use strict;
use warnings;

use previous qw(init_cacheable);

use parent qw(EnsEMBL::Web::ImageConfig::Genoverse);

sub init_cacheable {
  my $self = shift;

  $self->PREV::init_cacheable(@_);

  $self->init_genoverse;
  $self->set_parameter('zoom', 'no');
}

sub reset {
  shift->reset_genoverse(@_);
}

sub glyphset_tracks {
  shift->_glyphset_tracks(@_);
}

1;

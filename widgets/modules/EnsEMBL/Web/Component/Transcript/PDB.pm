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

package EnsEMBL::Web::Component::Transcript::PDB;

use strict;

use HTML::Entities qw(encode_entities);
use URI::Escape;

use base qw(EnsEMBL::Web::Component::Transcript EnsEMBL::Web::Component::PDB);

sub _init {
  my $self = shift;
  $self->cacheable(0);
  $self->ajaxable(1);  
}

sub content {
  my $self        = shift;

  my $hub         = $self->hub;
  my $object      = $self->object;
  my $html;
  if ($object->Obj->isa('Bio::EnsEMBL::Transcript')) {
    my $species     = $hub->species;
    my $translation = $object->translation_object;
    return unless $translation;
  
    my $translation_id = $translation->stable_id;

    # Add REST API URLs as hidden param
    $html .= $self->get_rest_urls();

    # Add the ENSP ID
    $html .= qq{<input type="hidden" id="ensp_id" value="$translation_id"/>};

    # Add IDs header
    $html .= $self->get_ids_header();

    # Add selection dropdowns
    $html .= $self->get_ensp_pdb_dropdowns();

    # Litmol viewer + right hand side menu
    $html .= $self->get_main_content();
  }
  return $html;
}

1;

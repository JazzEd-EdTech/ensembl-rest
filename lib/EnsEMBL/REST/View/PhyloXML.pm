package EnsEMBL::REST::View::PhyloXML;
use Moose;
use namespace::autoclean;

extends 'Catalyst::View';
 
sub process {
  my ($self, $c, $stash_key) = @_;
  $c->res->body(${$self->encode_phyloxml($c, $stash_key)});
  $self->set_content_disposition($c, 'xml', $stash_key);
  $c->res->headers->header('Content-Type' => 'text/x-phyloxml+xml');
  return 1;
}

with 'EnsEMBL::REST::Role::Tree';

__PACKAGE__->meta->make_immutable;

1;

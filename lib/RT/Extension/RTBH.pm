package RT::Extension::RTBH;

our $VERSION = '0.01';

=head1 NAME

RT::Extension::RTBH

=head1 SYNOPSYS

Manage network null routes

=cut

require Exporter;
use strict;
use warnings;

use HTTP::Tiny;
use JSON;

use base 'Exporter';
our @EXPORT_OK = qw(Add Delete List Update);

sub Add{
  my $url = shift;
  my $communities = shift;
  my $description = shift;
  my $route = shift;
  my $source = shift;

  my $http = HTTP::Tiny->new(
    default_headers => { 'Accept' => 'application/json'},
    timeout => 30
    );
  my $add_data = encode_json({
    "communities" => $communities,
    "desc" => $description,
    "route" => $route,
    "source" => $source
    });
  my $response = $http->request("POST", $url, {
    headers => {
      'Content-Type' => 'application/json'
    },
    content => $add_data
    }
    );
  return($response);
}

sub Delete{
  my $url = shift;
  my $id = shift;
  my $http = HTTP::Tiny->new(
    default_headers => { 'Accept' => 'application/json'},
    timeout => 30
    );
  my $response = $http->request("DELETE", $url . $id);
  return($response);
}

sub List{
  my $url = shift;
  my $http = HTTP::Tiny->new(
    default_headers => { 'Accept' => 'application/json'},
    timeout => 30
    );
  my $response = $http->request("GET", $url);
  return($response);
}

sub Update{
  my $url = shift;
  my $id = shift;
  my $update_data = shift;
  my $http = HTTP::Tiny->new(
    default_headers => { 'Accept' => 'application/json'},
    timeout => 30
    );
  my $response = $http->request("PUT", $url . $id, {
    headers => {
        'Content-Type' => 'application/json'
        },
        content => $update_data
        });
  return($response);
}
1;

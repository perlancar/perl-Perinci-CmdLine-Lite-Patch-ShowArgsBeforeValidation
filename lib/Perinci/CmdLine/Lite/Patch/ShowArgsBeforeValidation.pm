package Perinci::CmdLine::Lite::Patch::ShowArgsBeforeValidation;

# DATE
# VERSION

use 5.010001;
use strict;
no warnings;

use Data::Dump::Color;
use Module::Patch;
use base qw(Module::Patch);

our %config;

sub patch_data {
    return {
        v => 3,
        patches => [
            {
                action      => 'wrap',
                sub_name    => 'hook_before_action',
                code        => sub {
                    my $ctx = shift;

                    my ($self, $r) = @_;

                    print "Arguments before validation: "; dd $r->{args};
                    $ctx->{orig}->(@_);
                },
            },
        ],
        config => {
        },
   };
}

1;
# ABSTRACT: Patch Perinci::CmdLine::Lite's hook_before_action() to show arguments before validation

=for Pod::Coverage ^(patch_data)$

=head1 SYNOPSIS

 % PERL5OPT=-MPerinci::CmdLine::Lite::Patch::ShowArgsBeforeValidation yourscript.pl ...


=head1 DESCRIPTION

This patch can be used for debugging.

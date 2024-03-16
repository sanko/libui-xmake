package builder::xmake::libui {
    use base 'Module::Build';
    use File::Spec;

    sub ACTION_code {
        my $s         = shift;
        my $build_dir = File::Spec->catdir( $s->base_dir, 'build' );
        unless ( -d $build_dir ) {
            File::Path::mkpath( $build_dir, 0, oct(755) ) or die "Couldn't mkdir $build_dir: $!";
        }
        require Alien::xmake;
        $s->_do_in_dir(
            $build_dir,
            sub {
                system Alien::xmake->exe, 'build', '-y';
            }
        );
        $s->SUPER::ACTION_code;
    }
};
1;

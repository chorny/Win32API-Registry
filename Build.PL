use Module::Build;

my $build = Module::Build->new
	(
		module_name => 'Win32API::Registry',
		license     => 'perl',
		requires    => {
			'perl'    => '5.005',
		}
	);
$build->create_build_script;

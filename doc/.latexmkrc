$pdflatex = "pdflatex -synctex=1 -interaction=nonstopmode -file-line-error -shell-escape -extra-mem-top=50000000 -extra-mem-bot=50000000, %O %S";
$lualatex = "lualatex -synctex=1 -interaction=nonstopmode -file-line-error -shell-escape %O %S";
$pdf_mode = 1;
# $postscript_mode = $dvi_mode = 0;



# $ENV{'TZ'}='America/Santiago';


# add_cus_dep('glo', 'gls', 0, 'makeglossaries'); # glossaries
# add_cus_dep('slo', 'sls', 0, 'makeglossaries'); # symbols
# add_cus_dep('acn', 'acr', 0, 'makeglossaries');  # acronyms, from Overleaf v1


# sub makeglossaries {
#     system "makeglossaries $_[0]"
# }

add_cus_dep( 'acn', 'acr', 0, 'run_makeglossaries' );
add_cus_dep( 'glo', 'gls', 0, 'run_makeglossaries' );
add_cus_dep('slo', 'sls', 0, 'run_makeglossaries'); # symbols
$clean_ext .= " acr acn alg glo gls glg slo sls slg";

# sub makeglossaries {
#     my ($base_name, $path) = fileparse( $_[0] );
#     pushd $path;
#     my $return = system "makeglossaries", $base_name;
#     popd;
#     return $return;
# }

sub makeglossaries {
  my ($base_name, $path) = fileparse( $_[0] );
  return system "makeglossaries -d '$path' '$base_name'";
}

push @generated_exts, 'glo', 'gls', 'glg';
push @generated_exts, 'acn', 'acr', 'alg';
$clean_ext .= ' %R.ist %R.xdy';
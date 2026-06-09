# Latexmk defaults for all TeX projects
$pdf_mode = 1;                   # build PDF
$synctex = 1;                    # forward/inverse search
$interaction = "nonstopmode";    # don't stop on errors
$aux_dir = "build";
$out_dir = "build";
$cleanup_includes_generated = 1;
$pdflatex = 'pdflatex -file-line-error -shell-escape %O %S';

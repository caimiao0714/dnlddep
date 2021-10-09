if(file.exists('dnlddep.pdf'))file.remove('dnlddep.pdf')
pkg_path = find.package('dnlddep')
system(paste(shQuote(file.path(R.home("bin"), "R")),
             "CMD",
             "Rd2pdf",
             shQuote(pkg_path)))

pkg_path = find.package('dnlddep')
system(paste(shQuote(file.path(R.home("bin"), "R")),
             "CMD",
             "Rd2pdf",
             shQuote(pkg_path)))

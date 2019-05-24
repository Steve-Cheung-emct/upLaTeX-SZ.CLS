chcp 65001
latexmk -c
uplatex main
ptex2pdf -l -u -ot "-kanji=utf8 "  -od "-p B5 " main
del	*.aux	*.bak	*.log	*.bbl	*.blg	*.thm	*.toc	*.out	*.lof	*.lol	*.lot	*.fdb_latexmk	*.synctex.gz	*.ent	/s
exit
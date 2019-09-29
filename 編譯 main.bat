chcp 65001
latexmk -c
uplatex main
uplatex main
dvipdfmx main
del	*.aux	*.bak	*.log	*.bbl	*.blg	*.thm	*.toc	*.out	*.lof	*.lol	*.lot	*.fdb_latexmk	*.synctex.gz	*.ent	/s
exit
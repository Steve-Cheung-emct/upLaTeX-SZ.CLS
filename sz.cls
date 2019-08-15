%   File:             ShigakuZasshi type pLaTeX class
%   First released:   2004/03/12 v0.2  小川 弘和
%		website:					http://www2.kumagaku.ac.jp/teacher/herogw/
%   Modified by:      Steve Cheung 子 康
%   Modified date:    2019/01/25 -- today 2019/08/15
%	this version I delet the mag, which could  make muach influence on pagescale.
%
\NeedsTeXFormat{pLaTeX2e}
\ProvidesClass{sz}[2019/08/15 v1.3a ShigakuZasshi type pLaTeX class]

% 定義的紙張
\newcounter{@paper}
\DeclareOption{a4paper}{\setcounter{@paper}{1}%
  \setlength\paperheight {297mm}%
  \setlength\paperwidth  {210mm}}
\DeclareOption{a5paper}{\setcounter{@paper}{2}%
  \setlength\paperheight {210mm}
  \setlength\paperwidth  {148mm}}
\DeclareOption{b4paper}{\setcounter{@paper}{3}%
  \setlength\paperheight {354mm}
  \setlength\paperwidth  {250mm}}
\newif\if@bfive \@bfivefalse
\DeclareOption{b5paper}{\setcounter{@paper}{4}% ISO B5
  \@bfivetrue
  \setlength\paperheight {250mm}
  \setlength\paperwidth  {176mm}}
\DeclareOption{A4}{\setcounter{@paper}{1}%
  \setlength\paperheight {297mm}%
  \setlength\paperwidth  {210mm}}
\DeclareOption{A5}{\setcounter{@paper}{2}%
  \setlength\paperheight {210mm}
  \setlength\paperwidth  {148mm}}
\DeclareOption{B4}{\setcounter{@paper}{3}%
  \setlength\paperheight {354mm}
  \setlength\paperwidth  {250mm}}
\DeclareOption{B5}{\setcounter{@paper}{4}% ISO B5
  \@b5papertrue
  \setlength\paperheight {250mm}
  \setlength\paperwidth  {176mm}}
\newif\if@test \@testfalse
\DeclareOption{test}{\setcounter{@paper}{5}% 使用卷子本設定
\@testtrue
  \setlength\paperheight {257mm}
  \setlength\paperwidth  {5200mm}}

\if@test
	\setlength{\textheight}{4200 mm}	%設置卷子長度為4200mm
\fi

\DeclareOption{onecolumn}{\@twocolumnfalse}
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{oneside}{\@twosidefalse}
\DeclareOption{twoside}{\@twosidetrue}

%定義的佈局:landscape
\newif\if@landscape \@landscapefalse
\DeclareOption{landscape}{\@landscapetrue
  \setlength\@tempdima{\paperheight}%
  \setlength\paperheight{\paperwidth}%
  \setlength\paperwidth{\@tempdima}}


\newcounter{@fonsize}
\newif\if@setfonsizeix \@setfonsizeixfalse	% 定義  9 pt 為正文字號基準，不使用 mag 參數
\newif\if@setfonsizex \@setfonsizexfalse	% 定義 10 pt 為正文字號基準，不使用 mag 參數
\newif\if@setfonsizexi \@setfonsizexifalse	% 定義 11 pt 為正文字號基準，不使用 mag 參數
\newif\if@setfonsizexii\@setfonsizexiifalse	% 定義 12 pt 為正文字號基準，不使用 mag 參數
\newif\if@setfonsizexz \@setfonsizexzfalse	% 定義  小四 為正文字號基準，不使用 mag 參數

\DeclareOption{sz}{\setcounter{@fonsize}{1}%  9 pt @ real
\@setfonsizeixtrue}
\DeclareOption{szix}{\setcounter{@fonsize}{2}%  9 pt @ real
\@setfonsizeixtrue}
\DeclareOption{szx}{\setcounter{@fonsize}{3}% 10 pt 默認
\@setfonsizextrue}
\DeclareOption{szxi}{\setcounter{@fonsize}{4}%  11 pt
\@setfonsizexitrue}
\DeclareOption{szxii}{\setcounter{@fonsize}{5}% 12 pt
\@setfonsizexiitrue}
\DeclareOption{xz}{\setcounter{@fonsize}{6}% 小四
\@setfonsizexztrue}


%定義的標題、副標題、作者及作者名字縮寫
\def\maintitle#1{\gdef\@maintitle{#1}}
\def\@maintitle{\@latex@warning@no@line{No \noexpand\maintitle given}}

\def\subtitle#1{\gdef\@subtitle{#1}}
\def\@subtitle{\relax}

\def\authorfn#1{\gdef\@authorfn{#1}}
\def\@authorfn{\@latex@warning@no@line{No \noexpand\authorfn given}}

\newif\if@pdfm \@pdfmfalse
\newif\if@restonecol
\newif\if@openright
\newif\if@openleft
\newif\if@mainmatter \@mainmattertrue
\hour\time \divide\hour by 60\relax
\@tempcnta\hour \multiply\@tempcnta 60\relax
\minute\time \advance\minute-\@tempcnta
\newif\if@enablejfam \@enablejfamtrue

\DeclareOption{tombow}{%
  \tombowtrue \tombowdatetrue
  \setlength{\@tombowwidth}{.1\p@}%
  \@bannertoken{%
     \jobname\space:\space\number\year/\number\month/\number\day
      (\number\hour:\number\minute)}
  \maketombowbox}
\DeclareOption{tate}{%
  \AtBeginDocument{\tate\message{《縦組モード》}%
                   \adjustbaseline}%
}

\DeclareOption{pdfm}{\@pdfmtrue}
\DeclareOption{openright}{\@openrighttrue\@openleftfalse}
\DeclareOption{openleft}{\@openlefttrue\@openrightfalse}
\DeclareOption{openany}{\@openrightfalse\@openleftfalse}
\DeclareOption{disablejfam}{\@enablejfamfalse}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\ExecuteOptions{b5paper,final,openleft,tate,twoside,onecolumn}
\ProcessOptions\relax
% 版面縮放至0.913倍
%  \mag 913 % formerly 900
%  \setlength\paperwidth{1.09529\paperwidth}%
%  \setlength\paperheight{1.09529\paperheight}%
  \def\n@baseline{18}%
%
%定義的編碼方式：JT2表示縱書字體
\def\kanjiencodingdefault{JT2}%
\kanjiencoding{\kanjiencodingdefault}%

% 判斷字號選項，如未指定，則默認為 10 pt
\if@setfonsizeix  \else%
 	\if@setfonsizexi  \else%
 		\if@setfonsizexii  \else%
 			\if@setfonsizex 	\else%
 				\if@setfonsizexz  \else%
 					\@setfonsizextrue % 10 pt 默認
\fi	\fi \fi \fi \fi

\if@setfonsizeix % 設置 正文字號基準為 9 pt（real）
%% 定義正文字號
\renewcommand{\normalsize}{% \normalsize=10pt@18pt
		\@setfontsize\normalsize\@ixpt{15}%
	\abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
	\abovedisplayshortskip \z@ \@plus3\p@
	\belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
	\belowdisplayskip \abovedisplayskip
	\let\@listi\@listI}

\normalsize
\setbox0\hbox{\char\euc"A1A1}%
\setlength\Cht{\ht0}
\setlength\Cdp{\dp0}
\setlength\Cwd{\wd0}
\setlength\Cvs{\baselineskip}
\setlength\Chs{\wd0}

% 字號設定
\newcommand{\small}{%
  \@setfontsize\small{8pt}{10}%
  \abovedisplayskip 6\p@ \@plus3\p@ \@minus2\p@
  \abovedisplayshortskip \z@ \@plus2\p@
  \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
  \def\@listi{\leftmargin\leftmargini
              \topsep 4\p@ \@plus2\p@ \@minus2\p@
              \parsep 2\p@ \@plus\p@ \@minus\p@
              \itemsep \parsep}%
  \belowdisplayskip \abovedisplayskip}

\newcommand{\footnotesize}{%
  \@setfontsize\footnotesize\@viipt{9.5}%
  \abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
  \abovedisplayshortskip \z@ \@plus\p@
  \belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
  \def\@listi{\leftmargin\leftmargini
              \topsep 3\p@ \@plus\p@ \@minus\p@
              \parsep 2\p@ \@plus\p@ \@minus\p@
              \itemsep \parsep}%
  \belowdisplayskip \abovedisplayskip}

% 字號設定
\newcommand{\tiny}{\@setfontsize\tiny\@vipt\@ixpt}			%\tiny= 7pt@9pt
\newcommand{\scriptsize}{\@setfontsize\scriptsize{10pt}{12}}	%\scriptsize=10pt@12pt
\newcommand{\large}{\@setfontsize\large{11pt}{18}}			%\large= 11pt@18pt
\newcommand{\Large}{\@setfontsize\Large{13pt}{22.5}}		%\Large= 13pt@22pt
\newcommand{\LARGE}{\@setfontsize\LARGE{15pt}{26}}			%\LARGE= 15pt@26pt
      % 因正文夾注排版需要，特將此設定爲1.8~2倍行距为宜
\newcommand{\huge}{\@setfontsize\huge{17pt}{30}}			%\huge= 17pt@30pt
\newcommand{\Huge}{\@setfontsize\Huge\@xxpt{30}}			%\Huge= 20pt@30pt

\fi % from \if@setfonsizesc % 設置 正文字號基準為 9 pt(real)

\if@setfonsizex % 設置 正文字號基準為 10 pt
%% 定義正文字號
\renewcommand{\normalsize}{% \normalsize = 10pt@18pt
    \@setfontsize\normalsize{10pt}{15}%
	\abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
	\abovedisplayshortskip \z@ \@plus3\p@
	\belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI}

\normalsize
\setbox0\hbox{\char\euc"A1A1}%
\setlength\Cht{1\ht0}
\setlength\Cdp{1\dp0}
\setlength\Cwd{1\wd0}
\setlength\Cvs{1\baselineskip}
\setlength\Chs{1\wd0}

% 字號設定
\newcommand{\small}{%  \small = 9 pt @12pt
  \@setfontsize\small{9pt}{12}%
  \abovedisplayskip 8.5\p@ \@plus3\p@ \@minus4\p@
  \abovedisplayshortskip \z@ \@plus2\p@
  \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
  \def\@listi{\leftmargin\leftmargini
              \topsep 4\p@ \@plus2\p@ \@minus2\p@
              \parsep 2\p@ \@plus\p@ \@minus\p@
              \itemsep \parsep}%
  \belowdisplayskip \abovedisplayskip}

\newcommand{\footnotesize}{% \footnotesize = 8 pt@12pt
  \@setfontsize\footnotesize{8}{12}%
  \abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
  \abovedisplayshortskip \z@ \@plus\p@
  \belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
  \def\@listi{\leftmargin\leftmargini
              \topsep 3\p@ \@plus\p@ \@minus\p@
              \parsep 2\p@ \@plus\p@ \@minus\p@
              \itemsep \parsep}%
  \belowdisplayskip \abovedisplayskip}


% 字號設定
\newcommand{\tiny}{\@setfontsize\tiny\@vipt\@ixpt}				%\tiny= 6pt@9pt
\newcommand{\scriptsize}{\@setfontsize\scriptsize{10pt}{12}}	%\scriptsize=10pt@12pt
\newcommand{\large}{\@setfontsize\large\@xiipt{18}}				%\large= 12pt@18pt
\newcommand{\Large}{\@setfontsize\Large\@xivpt{22.5}}			%\Large= 14pt@22pt
\newcommand{\LARGE}{\@setfontsize\LARGE{17pt}{28}}  			%\LARGE= 16pt@26pt
\newcommand{\huge}{\@setfontsize\huge{20pt}{30}}    			%\huge= 20pt@28pt
\newcommand{\Huge}{\@setfontsize\Huge\@xxvpt{36}}   			%\Huge= 25pt@36pt

\fi % from \if@setfonsizex % 設置 正文字號基準為 10 pt （默認）

\if@setfonsizexi % 設置 正文字號基準為 11 pt

%% 定義正文字號
\renewcommand{\normalsize}{% \normalsize = 11pt@18pt
    \@setfontsize\normalsize{11pt}{18}%
	\abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
	\abovedisplayshortskip \z@ \@plus3\p@
	\belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI}

\normalsize
\setbox0\hbox{\char\euc"A1A1}%
\setlength\Cht{1\ht0}
\setlength\Cdp{1\dp0}
\setlength\Cwd{1\wd0}
\setlength\Cvs{1\baselineskip}
\setlength\Chs{1\wd0}

% 字號設定
\newcommand{\small}{%  \small = 10 pt @12pt
  \@setfontsize\small{10pt}{12}%
  \abovedisplayskip 8.5\p@ \@plus3\p@ \@minus4\p@
  \abovedisplayshortskip \z@ \@plus2\p@
  \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
  \def\@listi{\leftmargin\leftmargini
              \topsep 4\p@ \@plus2\p@ \@minus2\p@
              \parsep 2\p@ \@plus\p@ \@minus\p@
              \itemsep \parsep}%
  \belowdisplayskip \abovedisplayskip}

\newcommand{\footnotesize}{% \footnotesize = 9 pt@12pt
  \@setfontsize\footnotesize{9pt}{12}%
  \abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
  \abovedisplayshortskip \z@ \@plus\p@
  \belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
  \def\@listi{\leftmargin\leftmargini
              \topsep 3\p@ \@plus\p@ \@minus\p@
              \parsep 2\p@ \@plus\p@ \@minus\p@
              \itemsep \parsep}%
  \belowdisplayskip \abovedisplayskip}

% 字號設定
\newcommand{\tiny}{\@setfontsize\tiny\@viipt\@ixpt}				%\tiny= 7pt@9pt
\newcommand{\scriptsize}{\@setfontsize\scriptsize{11pt}{12}}	%\scriptsize=10pt@12pt
\newcommand{\large}{\@setfontsize\large{13pt}{18}}				%\large= 12pt@18pt
\newcommand{\Large}{\@setfontsize\Large\@xvpt{22.5}}			%\Large= 14pt@22pt
\newcommand{\LARGE}{\@setfontsize\LARGE{17pt}{28}}  			%\LARGE= 16pt@26pt
\newcommand{\huge}{\@setfontsize\huge{20pt}{30}}    			%\huge= 20pt@28pt
\newcommand{\Huge}{\@setfontsize\Huge\@xxvpt{36}}   			%\Huge= 25pt@36pt

\fi % from \if@setfonsizexi % 設置 正文字號基準為 11 pt

\if@setfonsizexii  % 設置 正文字號基準為 12 pt
%% 定義正文字號
\renewcommand{\normalsize}{% \normalsize = 12pt@18pt
    \@setfontsize\normalsize{12pt}{18}%
	\abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
	\abovedisplayshortskip \z@ \@plus3\p@
	\belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI}

\normalsize
\setbox0\hbox{\char\euc"A1A1}%
\setlength\Cht{1\ht0}
\setlength\Cdp{1\dp0}
\setlength\Cwd{1\wd0}
\setlength\Cvs{1\baselineskip}
\setlength\Chs{1\wd0}

% 字號設定
\newcommand{\small}{%  \small = 11 pt @12pt
  \@setfontsize\small{11pt}{12}%
  \abovedisplayskip 8.5\p@ \@plus3\p@ \@minus4\p@
  \abovedisplayshortskip \z@ \@plus2\p@
  \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
  \def\@listi{\leftmargin\leftmargini
              \topsep 4\p@ \@plus2\p@ \@minus2\p@
              \parsep 2\p@ \@plus\p@ \@minus\p@
              \itemsep \parsep}%
  \belowdisplayskip \abovedisplayskip}

\newcommand{\footnotesize}{% \footnotesize = 10 pt@12pt
  \@setfontsize\footnotesize{10pt}{12}%
  \abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
  \abovedisplayshortskip \z@ \@plus\p@
  \belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
  \def\@listi{\leftmargin\leftmargini
              \topsep 3\p@ \@plus\p@ \@minus\p@
              \parsep 2\p@ \@plus\p@ \@minus\p@
              \itemsep \parsep}%
  \belowdisplayskip \abovedisplayskip}

% 字號設定
\newcommand{\tiny}{\@setfontsize\tiny{8pt}{10pt}}				%\tiny= 8pt@10pt
\newcommand{\scriptsize}{\@setfontsize\scriptsize{11pt}{12}}	%\scriptsize=11pt@12pt
\newcommand{\large}{\@setfontsize\large{14.4pt}{18}}			%\large= 14.4pt@18pt
\newcommand{\Large}{\@setfontsize\Large{17pt}{22.5}}			%\Large= 17pt@22pt
\newcommand{\LARGE}{\@setfontsize\LARGE{20pt}{26}}				%\LARGE= 20pt@26pt
\newcommand{\huge}{\@setfontsize\huge{24pt}{30}}				%\huge= 24pt@30pt
\newcommand{\Huge}{\@setfontsize\Huge{28pt}{36}}				%\Huge= 28pt@36pt

\fi % from \if@setfonsizexii  % 設置 正文字號基準為 12 pt

\if@setfonsizexz  % 設置 正文字號基準為 小四

%% 定義正文字號
\renewcommand{\normalsize}{% \normalsize = 10.53937pt@18pt（五號）
    \@setfontsize\normalsize{10.53937pt}{18}%
	\abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
	\abovedisplayshortskip \z@ \@plus3\p@
	\belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI}

\normalsize
\setbox0\hbox{\char\euc"A1A1}%
\setlength\Cht{1\ht0}
\setlength\Cdp{1\dp0}
\setlength\Cwd{1\wd0}
\setlength\Cvs{1\baselineskip}
\setlength\Chs{1\wd0}

% 字號設定
\newcommand{\small}{%  \small = 9.03374 pt @12pt （小五）
  \@setfontsize\small{9.03374pt}{12}%
  \abovedisplayskip 8.5\p@ \@plus3\p@ \@minus4\p@
  \abovedisplayshortskip \z@ \@plus2\p@
  \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
  \def\@listi{\leftmargin\leftmargini
              \topsep 4\p@ \@plus2\p@ \@minus2\p@
              \parsep 2\p@ \@plus\p@ \@minus\p@
              \itemsep \parsep}%
  \belowdisplayskip \abovedisplayskip}

\newcommand{\footnotesize}{% \footnotesize = 8 pt@12pt
  \@setfontsize\footnotesize{8pt}{12}%
  \abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
  \abovedisplayshortskip \z@ \@plus\p@
  \belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
  \def\@listi{\leftmargin\leftmargini
              \topsep 3\p@ \@plus\p@ \@minus\p@
              \parsep 2\p@ \@plus\p@ \@minus\p@
              \itemsep \parsep}%
  \belowdisplayskip \abovedisplayskip}

% 字號設定
\newcommand{\tiny}{\@setfontsize\tiny{7.52812pt}{10}}		%\tiny = 7.52812 pt@10pt（六號）
\newcommand{\scriptsize}{\@setfontsize\scriptsize{8pt}{12}}	%\scriptsize=8pt@12pt
\newcommand{\large}{\@setfontsize\large{12.045pt}{22.5}}	%\large = 12.045pt@22.5pt（小四）
\newcommand{\Large}{\@setfontsize\Large{14.05249pt}{22.5}}	%\Large = 14.05249pt@22.5pt（四號）
\newcommand{\LARGE}{\@setfontsize\LARGE{15.05624pt}{22.5}}	%\LARGE = 15.05624pt@22.5pt（小三）
\newcommand{\huge}{\@setfontsize\huge{16.06pt}{22.5}}		%\huge = 16.06pt@22.5pt（三號）
\newcommand{\Huge}{\@setfontsize\Huge{18.06749pt}{25}}		%\Huge = 18.06749pt@25pt（小二）

\fi % from \if@setfonsizexz  % 設置 正文字號基準為 小四

\newcommand{\liuhao}{\@setfontsize\liuhao{7.52812pt}{10}} % 六號
\newcommand{\xiaowu}{\@setfontsize\xiaowu{9.03374pt}{12}} % 小五
\newcommand{\wuhao}{\@setfontsize\wuhao{10.53937pt}{18}} % 五號
\newcommand{\xiaosi}{\@setfontsize\xiaosi{12.045pt}{22.5}} % 小四
\newcommand{\sihao}{\@setfontsize\sihao{14.05249pt}{22.5}} % 四號
\newcommand{\xiaosan}{\@setfontsize\xiaosan{15.05624pt}{22.5}} % 小三
\newcommand{\sanhao}{\@setfontsize\sanhao{16.06pt}{22.5}} % 三號
\newcommand{\xiaoer}{\@setfontsize\xiaoer{18.06749pt}{25}} % 小二
\newcommand{\erhao}{\@setfontsize\erhao{22.08249}{36}}  %（二號）
\newcommand{\xiaoyi}{\@setfontsize\xiaoyi{24.09}{36}}  %（小一）
\newcommand{\yihao}{\@setfontsize\yihao{26.09749}{36}}  %（一號）
\newcommand{\xiaochu}{\@setfontsize\xiaochu{39.578}{48}} %（小初）
\newcommand{\chuhao}{\@setfontsize\chuhao{42.15749}{48}} %（初號）

%自定義的字號
\newcommand{\bthuge}{\@setfontsize\bthuge{60}{72}}
\newcommand{\btlarge}{\@setfontsize\btlarge{48}{60}}
\newcommand{\tlarge}{\@setfontsize\tlarge{36}{48}}
\newcommand{\ularge}{\@setfontsize\ularge{30}{48}}

\newcommand{\szxi}{\@setfontsize\szxi{11}{11}}
\newcommand{\szxii}{\@setfontsize\szxii{10}{10}}
\newcommand{\szix}{\@setfontsize\szix{9}{10}}

\newcommand{\zhy}{\@setfontsize\zhy{15pt}{22.5}}     %  葬花吟  \LARGE= 15pt@22.5pt

\newcommand{\szlarge}{%
		\@setfontsize\szlarge{15pt}{26}%
	\abovedisplayskip 6\p@ \@plus2\p@ \@minus5\p@
	\abovedisplayshortskip \z@ \@plus3\p@
	\belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
	\belowdisplayskip \abovedisplayskip%
	\let\@listi\@listI}

%%%古典字體設置
\DeclareOldFontCommand{\mc}{\normalfont\mcfamily}{\mathmc}
\DeclareOldFontCommand{\gt}{\normalfont\gtfamily}{\mathgt}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*{\cal}{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*{\mit}{\@fontswitch\relax\mathnormal}

\RequirePackage{multicol} %多欄
\RequirePackage{type1cm} %字體
\RequirePackage[uplatex,deluxe,jis2004]{otf} %字體包

\setlength\voffset{0mm}
\setlength\hoffset{0mm}

\setlength\headheight{0mm}
\setlength\headsep{0mm}

\setlength\topskip{1\Cht}
\setlength\footskip{7mm}

\setlength\maxdepth{.5\topskip}

\if@twocolumn
\setlength\textwidth{.8\paperheight}
\else
\setlength\textwidth{.8\paperheight}
\fi

\@settopoint\textwidth

\setlength\textheight{.7\paperwidth}

\addtolength\textheight{\topskip}
\@settopoint\textheight

\setlength\topmargin{-5mm}
\@settopoint\topmargin

\if@twocolumn
\setlength\marginparsep{0mm}
\else
\setlength\marginparsep{0mm}
\fi

\setlength\marginparpush{10\p@}    %%%%兩個旁注相鄰間隔

\setlength\@tempdima{\paperwidth}
\addtolength\@tempdima{-\textheight}

 \setlength\oddsidemargin{.6\@tempdima}

 \addtolength\oddsidemargin{-1in}
 \setlength\evensidemargin{\paperwidth}
 \addtolength\evensidemargin{-2in}
 \addtolength\evensidemargin{-\textheight}
 \addtolength\evensidemargin{-\oddsidemargin}
 \@settopoint\oddsidemargin % 1999.1.6
 \@settopoint\evensidemargin
 \setlength\@tempdima{\paperheight}
 \addtolength\@tempdima{-\textwidth}
 \addtolength\@tempdima{-\topmargin}
 \addtolength\@tempdima{-\headheight}
 \addtolength\@tempdima{-\headsep}
 \addtolength\@tempdima{-\footskip}
 \setlength\marginparwidth{0mm}
 \@settopoint\marginparwidth

\setlength\footnotesep{6.65\p@}
\setlength{\skip\footins}{9\p@ \@plus 4\p@ \@minus 2\p@}
\setlength\floatsep    {12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\textfloatsep{20\p@ \@plus 2\p@ \@minus 4\p@}
\setlength\intextsep   {12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\dblfloatsep    {12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\dbltextfloatsep{20\p@ \@plus 2\p@ \@minus 4\p@}
\setlength\@fptop{0\p@ \@plus 1fil}
\setlength\@fpsep{8\p@ \@plus 2fil}
\setlength\@fpbot{0\p@ \@plus 1fil}
\setlength\@dblfptop{0\p@ \@plus 1fil}
\setlength\@dblfpsep{8\p@ \@plus 2fil}
\setlength\@dblfpbot{0\p@ \@plus 1fil}
\setlength\partopsep{2\p@ \@plus 1\p@ \@minus 1\p@}
\def\@listi{\leftmargin\leftmargini
  \parsep 4\p@ \@plus2\p@ \@minus\p@
  \topsep 8\p@ \@plus2\p@ \@minus4\p@
  \itemsep4\p@ \@plus2\p@ \@minus\p@}
\let\@listI\@listi
\@listi
\def\@listii{\leftmargin\leftmarginii
   \labelwidth\leftmarginii \advance\labelwidth-\labelsep
   \topsep  4\p@ \@plus2\p@ \@minus\p@
   \parsep  2\p@ \@plus\p@  \@minus\p@
   \itemsep\parsep}
\def\@listiii{\leftmargin\leftmarginiii
   \labelwidth\leftmarginiii \advance\labelwidth-\labelsep
   \topsep 2\p@  \@plus\p@\@minus\p@
   \parsep\z@
   \partopsep \p@ \@plus\z@ \@minus\p@
   \itemsep\topsep}
\def\@listiv {\leftmargin\leftmarginiv
              \labelwidth\leftmarginiv
              \advance\labelwidth-\labelsep}
\def\@listv  {\leftmargin\leftmarginv
              \labelwidth\leftmarginv
              \advance\labelwidth-\labelsep}
\def\@listvi {\leftmargin\leftmarginvi
              \labelwidth\leftmarginvi
              \advance\labelwidth-\labelsep}

\def\pltx@cleartorightpage{\clearpage\if@twoside
  \ifodd\c@page
    \iftdir
      \hbox{}\thispagestyle{empty}\newpage
      \if@twocolumn\hbox{}\newpage\fi
    \fi
  \else
    \ifydir
      \hbox{}\thispagestyle{empty}\newpage
      \if@twocolumn\hbox{}\newpage\fi
    \fi
  \fi\fi}
\def\pltx@cleartoleftpage{\clearpage\if@twoside
  \ifodd\c@page
    \ifydir
      \hbox{}\thispagestyle{empty}\newpage
      \if@twocolumn\hbox{}\newpage\fi
    \fi
  \else
    \iftdir
      \hbox{}\thispagestyle{empty}\newpage
      \if@twocolumn\hbox{}\newpage\fi
    \fi
  \fi\fi}
\def\pltx@cleartooddpage{\clearpage\if@twoside
  \ifodd\c@page\else
    \hbox{}\thispagestyle{empty}\newpage
    \if@twocolumn\hbox{}\newpage\fi
  \fi\fi}
\def\pltx@cleartoevenpage{\clearpage\if@twoside
  \ifodd\c@page
    \hbox{}\thispagestyle{empty}\newpage
    \if@twocolumn\hbox{}\newpage\fi
  \fi\fi}
\if@openleft
  \let\cleardoublepage\pltx@cleartoleftpage
\else\if@openright
  \let\cleardoublepage\pltx@cleartorightpage
\fi\fi

\RequirePackage{plext}				%	縱組顓用
\RequirePackage{plautopatch}		%	為 pLaTeX 打補丁
\RequirePackage{zhnumber}
\setlength\columnsep{2\Cwd}			%	欄間距 2 個全角字
\setlength\columnseprule{0\p@}		%	雙欄 欄綫設定（無欄綫）
\setlength\lineskip{0\p@}			%	行間距 1 pt
\setlength\normallineskip{0\p@}		%	正文行間距 1 pt
\renewcommand{\baselinestretch}{}	%	置空基綫距離縮放因子
\setlength\parskip{0\p@ \@plus \p@}	%	段間距 0 pt
\setlength\parindent{1\Cwd}			%	退格 1 個全角字(此處設定不會對全局縮進產生任何影響)
\setlength\marginparsep{2\Cwd}		%	頭注與正文之間應空格 2 個全角字
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{2}
\setcounter{bottomnumber}{1}
\setcounter{totalnumber}{3}
\setcounter{dbltopnumber}{2}
\renewcommand{\topfraction}{.7}
\renewcommand{\bottomfraction}{.3}
\renewcommand{\textfraction}{.2}
\renewcommand{\floatpagefraction}{.5}
\renewcommand{\dbltopfraction}{.7}
\renewcommand{\dblfloatpagefraction}{.5}

\newcounter{chapter}
\newcounter{ppage}[chapter]
\setcounter{ppage}{1}

\newcounter{szpage}
\setcounter{szpage}{1}

%頁眉、頁碼設置
%PageStyle for dvipdfmx
%\if@pdfm
%\RequirePackage[dvipdfm]{graphicx}%
\RequirePackage[dvipdfmx]{graphicx}%
\def\ps@plain{%
   \let\@mkboth\markboth
   \def\@oddfoot{%
      \llap{%
         \smash{%
            \dimen@.91\textheight \advance\dimen@\footskip
            \vbox to\dimen@{%
%               \hbox{\tate \reset@font{\scriptsize\gtfamily \@maintitle%
%			（\@authorfn%
%					）}}%
               \hbox{\tate \reset@font{\szxii\gtfamily \@maintitle%
               （\@authorfn%
               			）}}%
               \vfill
%               \hbox{\tate \reset@font{\small\mc \kansuji\c@page（第%
               \hbox{\tate \reset@font{\szxii\mgfamily \kansuji\c@page%
               （第\hskip.5zw{\zhnumber{\@arabic\c@ppage}}\hskip.5zw頁）%
%               \hbox{\tate \reset@font{\scriptsize\mc \kansuji\c@page  %  此處刪去括號内頁碼
			   \vspace{25mm}}}%
			   }}%
         \hskip5mm}%
      \hfil\stepcounter{ppage}}%
      \def\chaptermark##1{ \markright{%
   \ifnum \c@secnumdepth >\m@ne
     \if@mainmatter
       \@chapapp~\thechapter~\@chappos\hskip1zw
     \fi
   \fi
   ##1 } }%
   \def\@evenfoot{%
      \hfil
      \rlap{%
        \hskip5mm
        \smash{%
          \dimen@.91\textheight \advance\dimen@\footskip
          \vbox to\dimen@{%
%            \hbox{\tate \reset@font{\scriptsize\gtfamily \rightmark}}%}}% 右邊頁眉設置爲章標題
            \hbox{\tate \reset@font{\szxii\gtfamily \rightmark}}%}}% 右邊頁眉設置爲章標題
            \vfill
%           \hbox{\tate \reset@font{\small\mc \kansuji\c@page（第%
           \hbox{\tate \reset@font{\szxii\mgfamily \kansuji\c@page%
           （第\hskip.5zw{\zhnumber{\@arabic\c@ppage}}\hskip.5zw頁）%
%         \hbox{\tate \reset@font{\scriptsize\mc \kansuji\c@page  % 此處仍刪除括號内頁碼
			   \vspace{25mm}}}}}}\stepcounter{ppage}}%
   \let\@oddhead\@empty
   \let\@evenhead\@empty
        }
  %%%定義一個不包含章回標題但包含頁碼的方案
  \def\ps@my{%
   \let\@mkboth\markboth
   \def\@oddfoot{%
      \llap{%
         \smash{%
            \dimen@.91\textheight \advance\dimen@\footskip
            \vbox to\dimen@{%
%               \hbox{\tate \reset@font{\small\mc \@maintitle
%			（\@authorfn%
%					）}}%
               \vfill
%               \hbox{\tate \reset@font{\small\mc （第\hskip.5zw{\kansuji\c@szpage}\hskip.5zw頁）%
               \hbox{\tate \reset@font{\szxii\mgfamily%
               （第\hskip.5zw{\zhnumber{\@arabic\c@szpage}}\hskip.5zw頁）%
			   \vspace{25mm}}}%
			   }}%
         \hskip5mm}%
      \hfil\stepcounter{szpage}}%
      \def\chaptermark##1{ \markright{%
   \ifnum \c@secnumdepth >\m@ne
     \if@mainmatter
       \@chapapp~\thechapter~\@chappos\hskip1zw
     \fi
   \fi
   ##1 } }%
   \def\@evenfoot{%
      \hfil
      \rlap{%
        \hskip5mm
        \smash{%
          \dimen@.91\textheight \advance\dimen@\footskip
          \vbox to\dimen@{%
%            \hbox{\tate \reset@font{\small\mc \rightmark}}%}}% 右邊頁眉設置爲章標題
            \vfill
%           \hbox{\tate \reset@font{\small\mc （第\hskip.5zw{\kansuji\c@szpage}\hskip.5zw頁）%
           \hbox{\tate \reset@font{\szxii\mgfamily%
           （第\hskip.5zw{\zhnumber{\@arabic\c@szpage}}\hskip.5zw頁）%
			   \vspace{25mm}}}}}}\stepcounter{szpage}}%
   \let\@oddhead\@empty
   \let\@evenhead\@empty}
%\fi

\let\ps@jpl@in\ps@plain

\def\p@thanks#1{\footnotemark
  \protected@xdef\@thanks{\@thanks
    \protect{\noindent$\m@th^\thefootnote$~#1\protect\par}}}

   \newcommand{\maketitle}{\par
  \begingroup
    \renewcommand{\thefootnote}{\fnsymbol{footnote}}%
    \def\@makefnmark{
      \ifydir
           {\leavevmode\kern-0zw\raise0.5zw\hbox{\scriptsize \@thefnmark}}
      \else
           \hbox{\yoko$\m@th^{\@thefnmark}$}
      \fi}%
    \long\def\@makefntext##1{\parindent 1zw\noindent
       \hbox to 2zw{\hss\@makefnmark}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne \@maketitle
      \else \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@
      \@maketitle
    \fi

  \thispagestyle{jpl@in}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\p@thanks\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
    \global\let\subtitle\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
  }

%頁眉、頁碼設置（結束）

%封面設置
\def\@maketitle{%
 \thispagestyle{empty}%
 \fboxsep5pt
    \newpage\null
  	\hspace{-1zw}{\large\gtfamily\fbox{\CID{4070}\hskip4zw\CID{3592}} \par}
     						   	% \CID{4070}\CID{3592} 論文
    \vskip 4.5zw%
    \hspace{2zw}{\LARGE \@maintitle \par}%
    \vskip .5zw%
	\ifx\@subtitle\empty%
  	\hspace{6.7zw}{\large \par}%
	\else\hspace{6.7zw}{\large ------\@subtitle------ \par}\fi%
  	\vskip 4zw%
    \rightline{{\Large \@author}\hspace{4zw}}%
    \par\vskip 2zw%
   }

%文檔結構設定
\newcommand*{\chaptermark}[1]{}
\setcounter{secnumdepth}{2}

\newcounter{part}
%\newcounter{chapter}
\newcounter{section}[chapter]
\newcounter{subsection}[section]
\newcounter{subsubsection}[subsection]
\newcounter{paragraph}[subsubsection]
\newcounter{subparagraph}[paragraph]

\renewcommand{\thepart}{\kansuji\number\@arabic\c@part}
%\renewcommand{\thechapter}{\kansuji\number\@arabic\c@chapter}
%\renewcommand{\thesection}{\kansuji\number\@arabic\c@section}
%\renewcommand{\thesubsection}{\kansuji\number\@arabic\c@subsection}

\renewcommand{\thechapter}{\zhnumber{\@arabic\c@chapter}}
\renewcommand{\thesection}{\zhnumber{\@arabic\c@section}}
\renewcommand{\thesubsection}{\zhnumber{\@arabic\c@subsection}}

\renewcommand{\thesubsubsection}{\rensuji\@arabic\c@subsubsection}
\renewcommand{\theparagraph}{\rensuji\@arabic\c@paragraph}
\renewcommand{\thesubparagraph}{\rensuji\@arabic\c@subparagraph}

%定義的冊卷章節
%定義的冊
\newcommand{\part}{%
  \if@openleft \cleardoublepage \else
  \if@openright \cleardoublepage \else \clearpage \fi \fi
  \thispagestyle{empty}%
  \if@twocolumn\onecolumn\@tempswatrue\else\@tempswafalse\fi
  \null\vfil
  \secdef\@part\@spart}

\def\@part[#1]#2{%
  \ifnum \c@secnumdepth >-2\relax
    \refstepcounter{part}%
    \addcontentsline{toc}{part}{%
      \mcfamily\Large \prepartname\thepart\postpartname\hspace{1em}#1}%
  \else
    \addcontentsline{toc}{part}{#1}%
  \fi
  \markboth{}{}%
  { \Huge\bfseries
   \interlinepenalty\@M\normalfont
   \ifnum \c@secnumdepth >-2\relax
   \rule{0pt}{30pt}
    \rule{30pt}{0pt}\prepartname\thepart\postpartname
     \par\vskip20\p@
   \fi
    \rule{48pt}{0pt}\Huge\bfseries#2\par}%
   \@endpart}
\def\@spart#1{{%
  \centering
  \interlinepenalty\@M\normalfont
  \Huge\bfseries#1\par}%
  \@endpart}
\def\@endpart{\vfil\newpage
  \if@twoside
   \if@openleft
    \null\thispagestyle{empty}\newpage
   \else\if@openright
    \null\thispagestyle{empty}\newpage
   \fi\fi
  \fi
   \if@tempswa\twocolumn\fi}

%%% 定義的 章、回
\newcommand{\@chapapp}{\prechaptername}
\newcommand{\@chappos}{\postchaptername}

\newcommand{\chapter}{%
  \if@openleft \cleardoublepage \else
  \if@openright \cleardoublepage \else \clearpage \fi \fi
  \global\@topnum\z@
  \@afterindenttrue
  \secdef\@chapter\@schapter}

%%% 定義不翻頁的 章、回
\newcommand{\szchapter}{%
  \global\@topnum\z@
  \@afterindenttrue
  \secdef\@chapter\@schapter}

%%% 章、回内部定義
\def\@chapter[#1]#2{%
	\ifnum\c@secnumdepth>\m@ne
		\if@mainmatter
			\refstepcounter{chapter}%
			\typeout{\@chapapp\space\thechapter\space\@chappos}%
			\addcontentsline{toc}{chapter}%
			{\protect\numberline{\@chapapp\thechapter\@chappos}#1}%
		\else
			\addcontentsline{toc}{chapter}{#1}\fi
	\else
		\addcontentsline{toc}{chapter}{#1}%
	\fi
		\chaptermark{#1}%
		\addtocontents{lof}{\protect\addvspace{10\p@}}%
		\addtocontents{lot}{\protect\addvspace{10\p@}}%
		\@makechapterhead{#2}\@afterheading}

\def\@makechapterhead#1{\hbox{}%
	\vskip.5\Cvs
	{\hbox{\huge\textcolor{purple}{\mgfamily\@maintitle{巻之}}}
%在此處加入書籍名稱\CID{1512}\CID{3309}巻之
	%!!此處使用了自定義字體
		\vskip0.5\Cvs	\huge	\mcfamily\bfseries
		\par\noindent	\raggedright	\leavevmode
	\ifnum\c@secnumdepth>\m@ne
		\setlength\@tempdima{0.96\linewidth}%
		\if@mainmatter
			\setbox\z@\hbox{\@chapapp\thechapter\@chappos\hskip1zw}%
			\addtolength\@tempdima{-\wd\z@}%
			\unhbox\z@\nobreak%
		\fi
		\vtop{\hsize\@tempdima#1}%
	\else
		#1\relax%
	\fi}
	\nobreak\vskip2\Cvs%
	\setcounter{ppage}{1}}
\def\@schapter#1{%
	\@makeschapterhead{#1}\@afterheading}

\def\@makeschapterhead#1{\hbox{}%
	\vskip1\Cvs
	{\parindent\z@	\normalfont	\huge	\mcfamily\bfseries
		\raggedright	\leavevmode
		\setlength\@tempdima{\linewidth}%
		\vtop{\hsize\@tempdima#1}}
	\vskip1\Cvs}


\newcommand{\section}{\@startsection{section}{1}{\z@}%
   {1.5\Cvs \@plus.5\Cvs \@minus.2\Cvs}%
   {.5\Cvs \@plus.3\Cvs}%
   {\normalfont\xiaoer\mcfamily\bfseries}}
\newcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
   {1.5\Cvs \@plus.5\Cvs \@minus.2\Cvs}%
   {.5\Cvs \@plus.3\Cvs}%
   {\normalfont\large\bfseries}}
\newcommand{\subsubsection}{\@startsection{subsubsection}{3}{\z@}%
   {1.5\Cvs \@plus.5\Cvs \@minus.2\Cvs}%
   {.5\Cvs \@plus.3\Cvs}%
   {\normalfont\normalsize\bfseries}}
\newcommand{\paragraph}{\@startsection{paragraph}{4}{\z@}%
   {3.25ex \@plus 1ex \@minus .2ex}%
   {-1em}%
   {\normalfont\normalsize\bfseries}}
\newcommand{\subparagraph}{\@startsection{subparagraph}{5}{\z@}%
   {3.25ex \@plus 1ex \@minus .2ex}%
   {-1em}%
   {\normalfont\normalsize\bfseries}}

\newcommand{\appendix}{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
        {\appendixname}  \space%
  \renewcommand{\thechapter}{\@Kanji\c@chapter}}

\if@twocolumn
  \setlength\leftmargini {2em}
\else
  \setlength\leftmargini {2.5em}
\fi
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\if@twocolumn
  \setlength\leftmarginv {.5em}
  \setlength\leftmarginvi{.5em}
\else
  \setlength\leftmarginv {1em}
  \setlength\leftmarginvi{1em}
\fi
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand{\theenumi}{\rensuji{\@arabic\c@enumi}}
\renewcommand{\theenumii}{\rensuji{(\@alph\c@enumii)}}
\renewcommand{\theenumiii}{\rensuji{\@roman\c@enumiii}}
\renewcommand{\theenumiv}{\rensuji{\@Alph\c@enumiv}}
\newcommand{\labelenumi}{\theenumi}
\newcommand{\labelenumii}{\theenumii}
\newcommand{\labelenumiii}{\theenumiii}
\newcommand{\labelenumiv}{\theenumiv}
\renewcommand{\p@enumii}{\theenumi}
\renewcommand{\p@enumiii}{\theenumi(\theenumii)}
\renewcommand{\p@enumiv}{\p@enumiii\theenumiii}

%定義的環境
\renewenvironment{enumerate}
  {\ifnum \@enumdepth >\thr@@\@toodeep\else
   \advance\@enumdepth\@ne
   \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
   \list{\csname label\@enumctr\endcsname}{%
      \iftdir
         \ifnum \@listdepth=\@ne \topsep.5\normalbaselineskip
           \else\topsep\z@\fi
         \parskip\z@ \itemsep\z@ \parsep\z@
         \labelwidth1zw \labelsep.3zw
         \ifnum \@enumdepth=\@ne \leftmargin1zw\relax
           \else\leftmargin\leftskip\fi
         \advance\leftmargin 1zw
      \fi
         \usecounter{\@enumctr}%
         \def\makelabel##1{\hss\llap{##1}}}%
   \fi}{\endlist}
\newcommand{\labelitemi}{\textbullet}
\newcommand{\labelitemii}{%
  \iftdir
     {\textcircled{~}}
  \else
     {\normalfont\bfseries\textendash}
  \fi
}
\newcommand{\labelitemiii}{\textasteriskcentered}
\newcommand{\labelitemiv}{\textperiodcentered}

%定義的description環境
\def\biao{\@ifnextchar[{\@biao}{ \@biao[無指定五字]}}
\def\@biao[#1]{%
 \list{}{%
 \let\makelabel\biaolabel\settowidth{\labelwidth}{#1}%
 \setlength{\topsep}{0pt}\setlength{\partopsep}{0pt}%
 \setlength{\parsep}{0pt}\setlength{\labelsep}{1zw}%
 \addtolength{\labelsep}{2\kanjiskip}%
 \setlength{\leftmargin}{\labelwidth}\addtolength{\leftmargin}{1zw}%
 \addtolength{\leftmargin}{2\kanjiskip}
 \setlength{\itemsep}{0pt}\setlength{\itemindent}{0pt}}}%
\let\endbiao\endlist
\def\biaolabel#1{\bfseries#1\hfill\inhibitglue}%

\renewenvironment{itemize}
  {\ifnum \@itemdepth >\thr@@\@toodeep\else
   \advance\@itemdepth\@ne
   \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
   \expandafter
   \list{\csname \@itemitem\endcsname}{%
      \iftdir
         \ifnum \@listdepth=\@ne \topsep.5\normalbaselineskip
           \else\topsep\z@\fi
         \parskip\z@ \itemsep\z@ \parsep\z@
         \labelwidth1zw \labelsep.3zw
         \ifnum \@itemdepth =\@ne \leftmargin1zw\relax
           \else\leftmargin\leftskip\fi
         \advance\leftmargin 1zw
      \fi
         \def\makelabel##1{\hss\llap{##1}}}%
   \fi}{\endlist}
\newenvironment{description}
  {\list{}{\labelwidth\z@ \itemindent-\leftmargin
   \iftdir
     \leftmargin\leftskip \advance\leftmargin3\Cwd
     \rightmargin\rightskip
     \labelsep=1zw \itemsep\z@
     \listparindent\z@ \topskip\z@ \parskip\z@ \partopsep\z@
   \fi
           \let\makelabel\descriptionlabel}}{\endlist}
\newcommand{\descriptionlabel}[1]{%
   \hspace\labelsep\normalfont\bfseries #1}

%詩歌環境（懸挂縮進）
\newenvironment{verse}
  {\let\\\@centercr
   \list{}{\itemsep\z@ \itemindent -1.0zw%
           \listparindent\itemindent \mcfamily %注意！！此處使用了自定義字體的設置
           \rightmargin\leftmargin \advance\leftmargin 1.0zw}%
           \item\relax}{\endlist}
%引文環境（前後均有縮進、首行縮進）
\newenvironment{quotation}
  {\list{}{ \mcfamily %注意！！此處使用了自定義字體的設置
  				 \listparindent 0zw%
           \itemindent\listparindent
           \rightmargin\leftmargin
           \parsep\z@ \@plus\p@}%
           \item\relax}{\endlist}

\newenvironment{quote}
  {\list{}%
           \item\relax}{\endlist}
\newcounter{figure}[chapter]
\renewcommand{\thefigure}{%
  \ifnum\c@chapter>\z@\thechapter{}?\fi\rensuji{\@arabic\c@figure}}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}
\newcounter{table}[chapter]
\renewcommand{\thetable}{%
  \ifnum\c@chapter>\z@\thechapter{}?\fi\rensuji{\@arabic\c@table}}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\thetable}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \iftdir\sbox\@tempboxa{#1\hskip1zw#2}%
    \else\sbox\@tempboxa{#1: #2}%
  \fi
  \ifdim \wd\@tempboxa >\hsize
    \iftdir #1\hskip1zw#2\relax\par
      \else #1: #2\relax\par\fi
  \else
    \global \@minipagefalse
    \hbox to\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\@addtoreset{equation}{chapter}
\renewcommand{\theequation}{%
  \ifnum\c@chapter>\z@\thechapter.\fi \@arabic\c@equation}

%%% SZ.cls原先默認定義的字體，重要。
\if@enablejfam
  \DeclareSymbolFont{mincho}{JY2}{mc}{m}{n}
  \DeclareSymbolFontAlphabet{\mathmc}{mincho}
  \SetSymbolFont{mincho}{bold}{JY2}{gt}{m}{n}
  \DeclareMathAlphabet{\mathgt}{JY2}{gt}{m}{n}
  \reDeclareMathAlphabet{\mathrm}{\@mathrm}{\@mathmc}
  \reDeclareMathAlphabet{\mathbf}{\@mathbf}{\@mathgt}
  \jfam\symmincho
\else
  \DeclareRobustCommand{\mathmc}{%
    \@latex@error{Command \noexpand\mathmc invalid with\space
       `disablejfam' class option.}\@eha
  }
  \DeclareRobustCommand{\mathgt}{%
    \@latex@error{Command \noexpand\mathgt invalid with\space
       `disablejfam' class option.}\@eha
  }
\fi

%% 定義的目錄
\setcounter{tocdepth}{2}  %目錄深度
%\newcommand{\@pnumwidth}{1.55em}
\newcommand{\@pnumwidth}{3em}
\newcommand{\@tocrmarg}{2.55em}
\newcommand{\@dotsep}{4.5}
\newdimen\toclineskip
\setlength\toclineskip{2\p@}
\newdimen\@lnumwidth
\def\numberline#1{\hbox to\@lnumwidth{#1\hfil}}

%定義的目錄格式
\def\@dottedtocline#1#2#3#4#5{%
  \ifnum #1>\c@tocdepth \else
    \vskip\toclineskip \@plus.2\p@
    {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
     \parindent #2\relax\@afterindenttrue
     \interlinepenalty\@M
     \leavevmode
     \@lnumwidth #3\relax
     \advance\leftskip \@lnumwidth \hbox{}\hskip -\leftskip
     {#4}\nobreak
     %\leaders\hbox{$\m@th \mkern \@dotsep mu.\mkern \@dotsep mu$}% 這一句將半角傍點改成全角
     \leaders\hbox{$\m@th\mkern \@dotsep mu$\null\inhibitglue \CID{119}\inhibitglue\null$\m@th\mkern \@dotsep mu$}%
     \hfill\nobreak
     \hb@xt@\@pnumwidth{\hss\normalfont \normalcolor #5} %
     \par}%
  \fi}

\def\addcontentsline#1#2#3{%
  \protected@write\@auxout
    {\let\label\@gobble \let\index\@gobble \let\glossary\@gobble
     \@temptokena{\kansuji{\thepage}}}%
    {\string\@writefile{#1}%
       {\protect\contentsline{#2}{#3}{\the\@temptokena}}}%
}

%插入目錄
\newcommand{\tableofcontents}{%
  \if@twocolumn\@restonecoltrue\onecolumn
  \else\@restonecolfalse\fi
  \chapter*{\contentsname
    \@mkboth{\contentsname}{\contentsname}%
  }%
  \bookmark[dest=\@currentHref, level=1]{返回目錄}%
	\@starttoc{toc}%
  \if@restonecol\twocolumn\fi
}
\newcommand*{\l@part}[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{2.25em \@plus\p@}%
    \begingroup
    \parindent\z@\rightskip\@pnumwidth
    \parfillskip-\@pnumwidth
    {\leavevmode\large\bfseries
     \setlength\@lnumwidth{4zw}%
     #1\hfil\nobreak
     \hb@xt@\@pnumwidth{\hss#2}}\par
    \nobreak
    \global\@nobreaktrue
    \everypar{\global\@nobreakfalse\everypar{}}%
     \endgroup
  \fi}
\newcommand*{\l@chapter}[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \addvspace{1.0em \@plus\p@}%
    \begingroup
      \parindent\z@ \rightskip\@pnumwidth \parfillskip-\rightskip
      \leavevmode\mcfamily\bfseries
%          \setlength\@lnumwidth{6zw}%
          \setlength\@lnumwidth{7zw}%
      \advance\leftskip\@lnumwidth \hskip-\leftskip
      #1\nobreak\hfil\nobreak\hb@xt@\@pnumwidth{\hss#2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}

% 目錄加點串連
\newcommand*{\l@section}       {\@dottedtocline{2}{2.5zw}{2zw}}
\newcommand*{\l@subsection}    {\@dottedtocline{3}{3zw}{3zw}}
\newcommand*{\l@subsubsection} {\@dottedtocline{4}{4zw}{4zw}}
\newcommand*{\l@paragraph}     {\@dottedtocline{5}{5zw}{5zw}}
\newcommand*{\l@subparagraph}  {\@dottedtocline{6}{5zw}{6zw}}

%% 圖片目錄
\newcommand{\listoffigures}{%
  \if@twocolumn\@restonecoltrue\onecolumn
  \else\@restonecolfalse\fi
  \chapter*{\listfigurename}%
  \@mkboth{\listfigurename}{\listfigurename}%
  \@starttoc{lof}%
  \if@restonecol\twocolumn\fi
}
\newcommand*{\l@figure}{\@dottedtocline{1}{1zw}{4zw}}

%% 表格目錄
\newcommand{\listoftables}{%
  \if@twocolumn\@restonecoltrue\onecolumn
  \else\@restonecolfalse\fi
  \chapter*{\listtablename}%
  \@mkboth{\listtablename}{\listtablename}%
  \@starttoc{lot}%
  \if@restonecol\twocolumn\fi
}
\let\l@table\l@figure

\newdimen\bibindent
\setlength\bibindent{1.5em}
\newcommand{\newblock}{\hskip .11em\@plus.33em\@minus.07em}
\newcommand{\@idxitem}{\par\hangindent 40\p@}
\newcommand{\subitem}{\@idxitem \hspace*{20\p@}}
\newcommand{\subsubitem}{\@idxitem \hspace*{30\p@}}
\newcommand{\indexspace}{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}

% 定義的脚注
\renewcommand{\footnoterule}{%
 \leavevmode\kern-25pt\raise-1mm\hbox{\rule{.4\columnwidth}{.25pt} }}
\@addtoreset{footnote}{chapter}
\renewcommand\@makefnmark{
\kern -1zw \raisebox{.8zh}%
{\tiny \raise.1zh\hbox{(}\kern -.3zw%
\hbox{\rensuji{\arabic{footnote}}}%
\kern -.3zw\raise.1zh\hbox{)}}\kern .1zw}
\long\def\@makefntext#1{\parindent 1zw\noindent
    \lower .7zh \hb@xt@ 2zw{\hss\@makefnmark}#1}

% 定義的西暦/和暦
\newif\if西暦 \西暦false
\def\西暦{\西暦true}
\def\和暦{\西暦false}
\newcommand{\西历}{\西暦}
\newcommand{\和历}{\和暦}
\newcommand{\西歷}{\西暦}
\newcommand{\和歷}{\和暦}
\newcount\Reiwa \Reiwa\year \advance\Reiwa-2018\relax
\def\today{{%
  \iftdir		%判斷是否為縱書
    \if西暦
      公元{\kansuji\number\year}年
      \zhnumber{\@arabic\month}月
      \zhnumber{\@arabic\day}日
    \else
      令和\ifnum\Reiwa=1 元年\else\rensuji{\number\Reiwa}年\fi
      \rensuji{\number\month}月
      \rensuji{\number\day}日
    \fi
  \else
    \if西暦
      \number\year~年
      \number\month~月
      \number\day~日
    \else
      令和\ifnum\Reiwa=1 元年\else\number\Reiwa~年\fi
      \number\month~月
      \number\day~日
    \fi
  \fi}}

% 雜項定義
\newcommand{\prepartname}{第}
\newcommand{\postpartname}{冊}
\newcommand{\prechaptername}{第}
\newcommand{\postchaptername}{回}
\newcommand{\contentsname}{目\quad 次}
\newcommand{\listfigurename}{圖\quad 目\quad 次}
\newcommand{\listtablename}{表\quad 目\quad 次}
\newcommand{\figurename}{圖}
\newcommand{\tablename}{表}
\newcommand{\appendixname}{附\quad 録}
\pagestyle{plain}
\pagenumbering{arabic}
\西暦
\raggedbottom
\if@twocolumn
	\twocolumn
	\sloppy
	\flushbottom
\else
	\onecolumn
\fi
\normalmarginpar
\@mparswitchfalse

% 定義的章回後注
\@definecounter{endnote}
\def\theendnote{\arabic{endnote}}
\@addtoreset{endnote}{chapter}

%\def\@makeenmark{\kern -1.2zw \raisebox{.8zh}{\tiny （{\hbox{\yoko\expandafter\ajTsumesuji\expandafter*\expandafter{\number\@theenmark}}}）}}

\def\@makeenmark{\kern -2zw \raisebox{.8zh}{\normalsize %
			\UTF{FE35}{\hbox{\zhnumber{\@theenmark}}}\UTF{FE36}}\kern .1zw}
			%\UTF{FE35}\UTF{FE36} 全角括號

\newdimen\endnotesep

\def\endnote{\@ifnextchar[{\@xendnote}{\stepcounter
   {endnote}\xdef\@theenmark{\theendnote}\@endnotemark\@endnotetext}}

\def\@xendnote[#1]{\begingroup \c@endnote=#1\relax
   \xdef\@theenmark{\theendnote}\endgroup
   \@endnotemark\@endnotetext}

\let\@doanenote=0
\let\@endanenote=0

\newwrite\@enotes
\newif\if@enotesopen \global\@enotesopenfalse

\def\@openenotes{\immediate\openout\@enotes=\jobname.ent\relax
      \global\@enotesopentrue}

\long\def\@endnotetext#1{%
     \if@enotesopen \else \@openenotes \fi
     \immediate\write\@enotes{\@doanenote{\@theenmark}}%
     \begingroup
        \def\next{#1}%
        \newlinechar='40
        \immediate\write\@enotes{\meaning\next}%
     \endgroup
     \immediate\write\@enotes{\@endanenote}}

\long\def\addtoendnotes#1{%
     \if@enotesopen \else \@openenotes \fi
     \begingroup
        \newlinechar='40
        \let\protect\string
        \immediate\write\@enotes{#1}%
     \endgroup}

\def\endnotemark{\@ifnextchar[{\@xendnotemark
    }{\stepcounter{endnote}\xdef\@theenmark{\theendnote}\@endnotemark}}

\def\@xendnotemark[#1]{\begingroup \c@endnote #1\relax
   \xdef\@theenmark{\theendnote}\endgroup \@endnotemark}

\def\@endnotemark{\leavevmode\ifhmode
  \edef\@x@sf{\the\spacefactor}\fi \@makeenmark
   \ifhmode\spacefactor\@x@sf\fi\relax}

\def\endnotetext{\@ifnextchar
    [{\@xendnotenext}{\xdef\@theenmark{\theendnote}\@endnotetext}}

\def\@xendnotenext[#1]{\begingroup \c@endnote=#1\relax
   \xdef\@theenmark{\theendnote}\endgroup \@endnotetext}

%\def\enoteformat{\parindent -1.3zw \leftskip 2.3zw %
\def\enoteformat{\parindent -3zw \leftskip 4zw \rightskip 4zw%
% \UTF{FE35}\hbox{\yoko\expandafter\ajTumesuji\expandafter*\expandafter{\number\@theenmark}}\UTF{FE36}}
% \UTF{FE35}\hbox{\kansuji\number\@theenmark}\UTF{FE36}\hskip3pt} %2019/01/25 \UTF{FE35}\UTF{FE36} 全角括號
 \UTF{FE35}\hbox{\zhnumber{\@theenmark}}\UTF{FE36}\hskip3pt} %2019/04/02
%\def\enotesize{\normalsize}
\def\enotesize{\large}

\newlength\chuskip
\setlength\chuskip{1zw}  							 %在正文中設置可覆蓋此句

\def\theendnotes{\vskip20mm%\begin{multicols}{2}% 修改分欄欄目數不會起作用，嘗試直接屏蔽多欄
 \immediate\closeout\@enotes \global\@enotesopenfalse
  \begingroup
    \makeatletter
    \def\@doanenote##1##2>{\def\@theenmark{##1}\par\begingroup
        \edef\@currentlabel{\csname p@endnote\endcsname\@theenmark} %DW
        \enoteformat}
    \def\@endanenote{\par\endgroup}%
    \def\ETC.{\errmessage{Some long endnotes will be truncated; %
                            use BIGLATEX to avoid this}%
          \def\ETC.{\relax}}
	\vspace{1zw}
	\noindent
     \hspace{0.5mm}{\Large\mcfamily\bfseries \CID{2990}}\vskip0pt%-\chuskip
      %%% \CID{7740} 註  \CID{2990} 註
	\enotesize
    \@input{\jobname.ent}%
      \endgroup
 %\end{multicols}
 			} %\def\theendnotes
% 定義的章回後注（結束）

% 引入頭注、按章回刷新頭注計數器
\RequirePackage{tochu}
\@addtoreset{kcbango}{chapter}

% 定義的破折號
\def\dash{{\leavevmode\kern1mm\raise0.1zh\hbox{\mcfamily{-----}}\kern1mm}}

\def\dott{\hbox{\mcfamily{……}}}

% 定義的 目錄頁碼格式（非常重要！！）
\AtBeginDocument{%
%\def\contentsline#1#2#3#4{\csname l@#1\endcsname{\hyper@linkstart{link}{#4}{#2}\hyper@linkend}{\zhnumber{#3}}}
\def\contentsline#1#2#3#4{\csname l@#1\endcsname{\hyper@linkstart{link}{#4}{#2}\hyper@linkend}{\@Kanji{#3}}}
}


\newcommand{\六號}{\liuhao}
\newcommand{\六号}{\liuhao}
\newcommand{\小五}{\xiaowu}
\newcommand{\五號}{\wuhao}
\newcommand{\五号}{\wuhao}
\newcommand{\小四}{\xiaosi}
\newcommand{\四號}{\sihao}
\newcommand{\四号}{\sihao}
\newcommand{\小三}{\xiaosan}
\newcommand{\三號}{\sanhao}
\newcommand{\三号}{\sanhao}
\newcommand{\小二}{\xiaoer}
\newcommand{\二號}{\erhao}
\newcommand{\二号}{\erhao}
\newcommand{\小一}{\xiaoyi}
\newcommand{\一號}{\yihao}
\newcommand{\一号}{\yihao}
\newcommand{\小初}{\xiaochu}
\newcommand{\初號}{\chuhao}
\newcommand{\初号}{\chuhao}

% 居中标点 命名格式 \mxxx
\def\dou{\leavevmode\kern -.35zw \raise.6zh\hbox{\mc{・}}\kern -.15zw}
\def\dun{\leavevmode\kern -.35zw \raise.6zh\hbox{\mc{・}}\kern -.15zw}% 、
%\def\mgou{\leavevmode\kern -.35zw \raise.6zh\hbox{\mc{。}}\kern -.15zw}
% 非居中式标点
%\def\dou{\leavevmode\kern -.35zw \raise.3zh\hbox{\mc{，}}\kern -.15zw} %，
%\def\dun{\leavevmode\kern -.35zw \raise.3zh\hbox{\mc{、}}\kern -.15zw} % 、
\def\gou{\leavevmode\kern -.35zw \raise.3zh\hbox{\mc{。}}\kern -.15zw}
% 冒号、分号、叹号、问号替换为勾读。
\newcommand{\mao}{\dou}
\newcommand{\fen}{\gou}
\newcommand{\mtan}{\gou}
\newcommand{\wen}{\gou}
%前引号、后引号、书名号、曲牌名号。
\def\xqyh{\leavevmode\kern -.1zw\raise.1zh\hbox{\mc{『}}\kern-.1zw}
\def\xhyh{\leavevmode\kern-.1zw\raise-.1zh\hbox{\mc{』}}\kern -.1zw }
\def\qyh{\leavevmode\kern -.1zw\raise.1zh\hbox{\mc{「}}\kern-.1zw}
\def\hyh{\leavevmode\kern-.1zw\raise-.1zh\hbox{\mc{」}}\kern -.1zw }
\def\qsm{\leavevmode\kern -.1zw\hbox{\mc{〈}}}
\def\hsm{\leavevmode\hbox{\mc{〉}}\kern -.1zw}
\def\qqp{\leavevmode\kern -.1zw\hbox{\mc{〔}}}
\def\hqp{\leavevmode\hbox{\mc{〕}}\kern -.1zw}
\def\qkh{\leavevmode\kern -.1zw\hbox{\mc{（}}}
\def\hkh{\leavevmode\hbox{\mc{）}}\kern -.1zw}

\if@bfive
% 页面调整
%\setlength{\voffset}{-3 mm}
\setlength{\hoffset}{0 mm}
\setlength{\oddsidemargin}{-7 mm}  %奇数修正數據
\setlength{\evensidemargin}{-3 mm}   %偶数修正數據
\setlength{\textwidth}{216mm}
\setlength{\textheight}{135 mm}
\setlength{\columnsep}{8 mm}
\fi

\prebreakpenalty`︰=10000
\kcatcode"FE30=18
\newcommand{\vsbk}{\vskip\baselineskip}

% 簡體中文 adobe 細宋體 & adobe 黑體
\DeclareFontFamily{JY2}{upstsl}{}
\DeclareFontFamily{JT2}{upstsl}{}

\DeclareFontShape{JY2}{upstsl}{m}{n}{<->s*[0.924690]upstsl-h}{}
\DeclareFontShape{JY2}{upstsl}{m}{it}{<->ssub*upstsl/m/n}{}
\DeclareFontShape{JY2}{upstsl}{m}{sl}{<->ssub*upstsl/m/n}{}
\DeclareFontShape{JY2}{upstsl}{m}{sc}{<->ssub*upstsl/m/n}{}

\DeclareFontShape{JT2}{upstsl}{m}{n}{<->s*[0.924690]upstsl-v}{}
\DeclareFontShape{JT2}{upstsl}{m}{it}{<->ssub*upstsl/m/n}{}
\DeclareFontShape{JT2}{upstsl}{m}{sl}{<->ssub*upstsl/m/n}{}
\DeclareFontShape{JT2}{upstsl}{m}{sc}{<->ssub*upstsl/m/n}{}

\DeclareRobustCommand\upstsl{\kanjifamily{upstsl}\selectfont}

\AtBeginDvi{%
  \special{pdf:mapline upstsl-h	unicode		SourceHanSerifK-Medium.otf}
  \special{pdf:mapline upstsl-v	unicode		SourceHanSerifK-Medium.otf	-w	1}
}


%  懸挂的標點符號 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ubzjlreq-h/v %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareFontFamily{JY2}{ubzjlreq}{}
\DeclareFontFamily{JT2}{ubzjlreq}{}

\DeclareFontShape{JY2}{ubzjlreq}{m}{n}{<->s*[0.924690]ubzjlreq}{}
\DeclareFontShape{JY2}{ubzjlreq}{m}{it}{<->ssub*ubzjlreq/m/n}{}
\DeclareFontShape{JY2}{ubzjlreq}{m}{sl}{<->ssub*ubzjlreq/m/n}{}
\DeclareFontShape{JY2}{ubzjlreq}{m}{sc}{<->ssub*ubzjlreq/m/n}{}

\DeclareFontShape{JT2}{ubzjlreq}{m}{n}{<->s*[0.924690]ubzjlreq-v}{}
\DeclareFontShape{JT2}{ubzjlreq}{m}{it}{<->ssub*ubzjlreq/m/n}{}
\DeclareFontShape{JT2}{ubzjlreq}{m}{sl}{<->ssub*ubzjlreq/m/n}{}
\DeclareFontShape{JT2}{ubzjlreq}{m}{sc}{<->ssub*ubzjlreq/m/n}{}

\DeclareRobustCommand\ubzjlreq{\kanjifamily{ubzjlreq}\selectfont}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ubzjlreq-h/v %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ubzjlreqg-h/v %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareFontFamily{JY2}{ubzjlreqg}{}
\DeclareFontFamily{JT2}{ubzjlreqg}{}

\DeclareFontShape{JY2}{ubzjlreqg}{m}{n}{<->s*[0.924690]ubzjlreqg}{}
\DeclareFontShape{JY2}{ubzjlreqg}{m}{it}{<->ssub*ubzjlreqg/m/n}{}
\DeclareFontShape{JY2}{ubzjlreqg}{m}{sl}{<->ssub*ubzjlreqg/m/n}{}
\DeclareFontShape{JY2}{ubzjlreqg}{m}{sc}{<->ssub*ubzjlreqg/m/n}{}

\DeclareFontShape{JT2}{ubzjlreqg}{m}{n}{<->s*[0.924690]ubzjlreqg-v}{}
\DeclareFontShape{JT2}{ubzjlreqg}{m}{it}{<->ssub*ubzjlreqg/m/n}{}
\DeclareFontShape{JT2}{ubzjlreqg}{m}{sl}{<->ssub*ubzjlreqg/m/n}{}
\DeclareFontShape{JT2}{ubzjlreqg}{m}{sc}{<->ssub*ubzjlreqg/m/n}{}

\DeclareRobustCommand\ubzjlreqg{\kanjifamily{ubzjlreqg}\selectfont}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ubzjlreqg-h/v %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\endinput
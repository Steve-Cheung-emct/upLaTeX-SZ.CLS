%   File:             ShigakuZasshi type pLaTeX class
%   First released:   2004/03/12 v0.2  小川 弘和
%       website:      http://www2.kumagaku.ac.jp/teacher/herogw/
%   Modified by:      Steve Cheung 子 康
%   Modified date:    2019/01/25 -- today 2019/09/28
%
\NeedsTeXFormat{pLaTeX2e}
\ProvidesClass{sz}[2019/09/28 v1.6c ShigakuZasshi type pLaTeX class]

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
\DeclareOption{b5paper}{\setcounter{@paper}{4}% ISO B5
  \setlength\paperheight {257mm}
  \setlength\paperwidth  {182mm}}
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
  \setlength\paperheight {257mm}
  \setlength\paperwidth  {182mm}}
\newif\if@test \@testfalse
\DeclareOption{test}{\@testtrue\setcounter{@paper}{5}%
  \setlength\paperheight {257mm}
  \setlength\paperwidth  {5200mm}}

\if@test
    \setlength{\textheight}{4200 mm}
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

\DeclareOption{pdfm}{\@pdfmtrue \input{colordef.tex}} % 打開糸欄開關，竝引入顔色定義。
\DeclareOption{openright}{\@openrighttrue\@openleftfalse}
\DeclareOption{openleft}{\@openlefttrue\@openrightfalse}
\DeclareOption{openany}{\@openrightfalse\@openleftfalse}
\DeclareOption{disablejfam}{\@enablejfamfalse}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
%%%%%%%%%%%%%%% 顔色定義 %%%%%%%%%%%%%%%
\DeclareOption{墨}{\def\@masuiro{Black}\def\@fishcolor{Black}}%
\DeclareOption{淺朱}{\def\@masuiro{kakiiro!80}\def\@fishcolor{shuiro!80}}%
\DeclareOption{朱}{\def\@masuiro{kakiiro!90}\def\@fishcolor{shuiro!90}}%
\DeclareOption{紅}{\def\@masuiro{Red!80}\def\@fishcolor{shuiro!85}}%
\DeclareOption{Black}{\def\@columncolor{Black}\def\@riboncolor{Black}}%
\DeclareOption{LightRed}{\def\@columncolor{kakiiro!80}\def\@riboncolor{shuiro!80}}%
\DeclareOption{kakiiro}{\def\@columncolor{kakiiro!90}\def\@riboncolor{shuiro!90}}%
\DeclareOption{Red}{\def\@columncolor{Red!80}\def\@riboncolor{red!75}}%
%%%%%%%%%%%%%%% 顔色定義 %%%%%%%%%%%%%%%

\ExecuteOptions{b5paper,final,openleft,tate,twoside,onecolumn,淺朱,LightRed}
\ProcessOptions\relax
% 版面縮放至0.913倍
%  \mag 913 % formerly 900
%  \setlength\paperwidth{1.09529\paperwidth}%
%  \setlength\paperheight{1.09529\paperheight}%
  \def\n@baseline{30}%
  \def\Cjascale{0.924690}
%
%定義的編碼方式：JT2表示縱書字體
\def\kanjiencodingdefault{JT2}%
\kanjiencoding{\kanjiencodingdefault}%

%% 定義正文字號
\renewcommand{\normalsize}{% \normalsize=10pt@18pt
        \@setfontsize\normalsize\@xpt{15}%
    \abovedisplayskip 6\p@ \@plus3\p@ \@minus3\p@
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
  \abovedisplayskip 8\p@ \@plus3\p@ \@minus2\p@
  \abovedisplayshortskip \z@ \@plus2\p@
  \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
  \def\@listi{\leftmargin\leftmargini
              \topsep 4\p@ \@plus2\p@ \@minus2\p@
              \parsep 2\p@ \@plus\p@ \@minus\p@
              \itemsep \parsep}%
  \belowdisplayskip \abovedisplayskip}

\newcommand{\footnotesize}{%
  \@setfontsize\footnotesize\@viiipt{9.5}%
  \abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
  \abovedisplayshortskip \z@ \@plus\p@
  \belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
  \def\@listi{\leftmargin\leftmargini
              \topsep 3\p@ \@plus\p@ \@minus\p@
              \parsep 2\p@ \@plus\p@ \@minus\p@
              \itemsep \parsep}%
  \belowdisplayskip \abovedisplayskip}

% 字號設定
\newcommand{\tiny}{\@setfontsize\tiny\@viipt\@ixpt}            %\tiny= 7pt@9pt
\newcommand{\scriptsize}{\@setfontsize\scriptsize{10pt}{12}}    %\scriptsize=10pt@12pt
\newcommand{\large}{\@setfontsize\large\@xiipt{15.05}}         %\large= 12pt@18pt
\newcommand{\Large}{\@setfontsize\Large\@xivpt{30}}        %\Large= 14pt@22pt
\newcommand{\LARGE}{\@setfontsize\LARGE{16pt}{30}}          %\LARGE= 16pt@26pt
      % 因正文夾注排版需要，特將此設定爲2倍行距为宜
\newcommand{\huge}{\@setfontsize\huge{20pt}{30}}            %\huge= 20pt@28pt
\newcommand{\Huge}{\@setfontsize\Huge\@xxvpt{42}}            %\Huge= 25pt@36pt

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
\newcommand{\verthuge}{\@setfontsize\verthuge{25}{25}}

\newcommand{\szix}{\@setfontsize\szix{9}{12}}
\newcommand{\szx}{\@setfontsize\szx{10}{12}}
\newcommand{\szxi}{\@setfontsize\szxi{11}{12}}
\newcommand{\szxii}{\@setfontsize\szxii{12}{12}}

\newcommand{\szad}{\@setfontsize\szad{16pt}{28.5}}   %  带割注诗歌的调整行距
\newcommand{\zhy}{\@setfontsize\zhy{16pt}{30}}     %  葬花吟
\newcommand{\szlarge}{\@setfontsize\szlarge{16pt}{26}} % 思源明體生僻字
\newcommand{\szlgkai}{\@setfontsize\szlgkai{16pt}{26}} % 诗歌中的生僻字
\newcommand{\szhuge}{\@setfontsize\szhuge{16pt}{30}}  %  好了歌

\newcommand{\szverse}{%  詩歌環境 每20行余1pt
        \@setfontsize\szverse{16pt}{30}%
    \abovedisplayskip 6\p@ \@plus3\p@ \@minus3\p@
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
\RequirePackage[expert,uplatex,deluxe,jis2004]{otf} %字體包
\RequirePackage[usenames]{color}
\RequirePackage[usenames,dvipsnames]{xcolor}
\RequirePackage{jcolor}
\RequirePackage{plext}       %   縱組顓用增强包
\RequirePackage{plautopatch} %   為 pLaTeX 打補丁
\RequirePackage{zhnumber}

\setlength\voffset{0mm}
\setlength\hoffset{0mm}

\setlength\headheight{0mm}
\setlength\headsep{0mm}

%\setlength\topskip{1\Cht} % 千萬不要動這里，眞的會炸的。
\setlength\footskip{10mm}

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
  \parsep 0 pt % 4\p@ \@plus2\p@ \@minus\p@
  \topsep 0 pt % 8\p@ \@plus2\p@ \@minus4\p@
  \itemsep 0 pt % 4\p@ \@plus2\p@ \@minus\p@
  	}
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
      \hbox{}\thispagestyle{empty}\watermarkoff\newpage
      \if@twocolumn\hbox{}\newpage\fi
    \fi
  \else
    \ifydir
      \hbox{}\thispagestyle{empty}\watermarkoff\newpage
      \if@twocolumn\hbox{}\newpage\fi
    \fi
  \fi\fi}
\def\pltx@cleartoleftpage{\clearpage\if@twoside
  \ifodd\c@page
    \ifydir
      \hbox{}\thispagestyle{empty}\watermarkoff\newpage
      \if@twocolumn\hbox{}\newpage\fi
    \fi
  \else
    \iftdir
      \hbox{}\thispagestyle{empty}\watermarkoff\newpage
      \if@twocolumn\hbox{}\newpage\fi
    \fi
  \fi\fi}
\def\pltx@cleartooddpage{\clearpage\if@twoside
  \ifodd\c@page\else
    \hbox{}\thispagestyle{empty}\watermarkoff\newpage
    \if@twocolumn\hbox{}\newpage\fi
  \fi\fi}
\def\pltx@cleartoevenpage{\clearpage\if@twoside
  \ifodd\c@page
    \hbox{}\thispagestyle{empty}\watermarkoff\newpage
    \if@twocolumn\hbox{}\newpage\fi
  \fi\fi}
\if@openleft
  \let\cleardoublepage\pltx@cleartooddpage
\else\if@openright
  \let\cleardoublepage\pltx@cleartorightpage
\fi\fi

\if@pdfm
% 正文翻页，空白页采用糸栏
\def\pltx@mycleartoleftpage{\clearpage\if@twoside
  \ifodd\c@page \else
    \iftdir
      \hbox{}\thispagestyle{plain}\watermarkoff\watermarkeven\newpage
      \if@twocolumn\hbox{}\newpage\fi
    \fi
  \fi\fi}
\def\cleardbpage{\pltx@mycleartoleftpage}

% 前言翻页和附录翻页。使用 kochu 模式
\def\pltx@kochucleartoleftpage{\clearpage\if@twoside
  \ifodd\c@page \else
    \iftdir
      \hbox{}\thispagestyle{empty}\watermarkoff\watermkkochueven\newpage
      \if@twocolumn\hbox{}\newpage\fi
    \fi
  \fi\fi}
\def\mycleardbpage{\pltx@kochucleartoleftpage}

\else
\def\cleardbpage{\pltx@cleartooddpage}
\def\mycleardbpage{\pltx@cleartooddpage}
\fi

\setlength{\columnsep}{2\Cwd}           %    中文縱書：欄間距 2 個全角字
\setlength{\columnseprule}{0\p@}        %    雙欄 欄綫設定（無欄綫）
\setlength{\lineskip}{0\p@}             %    行間距 1 pt
\setlength{\normallineskip}{0\p@}       %    正文行間距 1 pt
\renewcommand{\baselinestretch}{}       %    置空基綫距離縮放因子
%\setlength{\parskip}{0\p@ \@plus \p@}  %    段間距 0 pt
\setlength{\parskip}{0mm}
\setlength{\parindent}{1\Cwd}           %    退格 1 個全角字(此處設定不會對全局縮進產生任何影響)
\setlength{\marginparsep}{2\Cwd}        %    中文縱書：頭注與正文之間應空格 2 個全角字
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

% 引入計數器
\newcounter{chapter}
\newcounter{ppage}[chapter]
\setcounter{ppage}{1}

\newcounter{szpage} % 前言页码
\setcounter{szpage}{1}

%%%%%%	自定義的水印命令 %頁眉、頁碼設置
\RequirePackage[dvipdfmx]{graphicx}%
\RequirePackage{tikz}
\RequirePackage{eso-pic}
\RequirePackage{ifthen}

\font\@fish gerib10 at 22pt
\def\fontsymbol#1{\@fish\symbol{#1}}
\def\@tfish{\hbox{\yoko\color{\@fishcolor}\@fish\symbol{65}}}
\def\@bfish{\hbox{\yoko\color{\@fishcolor}\@fish\symbol{66}}}
\def\tfish{\hbox{\yoko\color{\@fishcolor}\@fish\symbol{65}}}
\def\bfish{\hbox{\yoko\color{\@fishcolor}\@fish\symbol{66}}}

% 定義奇數頁糸欄
\def\@ribonodd{%
	\foreach \i in {420,390,...,60}{%
		% 起始點 420 + 30pt 每欄 从右往左
		\draw [ color=\@riboncolor ] (\i pt, 2.2)--(\i pt, 19.8);}}% 奇數頁絲欄 
% 定義偶數頁糸欄
\def\@riboneven{%
	\foreach \i in {458,428,...,90}{% 
		% 起始點 458 + 30pt 每欄 从右往左
		\draw [ color=\@riboncolor ] (\i pt, 2.2)--(\i pt, 19.8);}}% 偶數頁絲欄 

% 定義奇數頁内外邉框
\def\@kasenodd{%
	\draw [line width=3pt, color=\@columncolor ]  (0.8,2.0) rectangle (16.0,20.0);% 外框 
	\draw [line width=1pt, color=\@riboncolor ]  (1.0,2.2) rectangle (15.8,19.8);% 內框 
		\draw [line width=3pt, color=\@columncolor ] (0,2.0) -- (0.8,2.0);  % 下欄綫
		\draw [line width=3pt, color=\@columncolor ] (0,20.0) -- (0.8,20.0); % 上欄綫
	}
% 定義偶數頁内外邉框
\def\@kaseneven{%
	\draw [line width=3pt, color=\@columncolor ]  (2.2,2.0) rectangle (17.4,20.0);% 外框 
	\draw [line width=1pt, color=\@riboncolor ]  (2.4,2.2) rectangle (17.2,19.8);% 內框 
		\draw [line width=3pt, color=\@columncolor ] (17.2,2.0) -- (20,2.0);  % 下欄綫
		\draw [line width=3pt, color=\@columncolor ] (17.2,20.0) -- (20,20.0); % 上欄綫
	}

% 定義奇數頁魚尾、奇偶公用頁碼
\def\@fishodd{%
%		\draw [line width=20pt, color=\@columncolor ] (0,19.8) -- (0,19); % 上封綫
%		\draw [line width=20pt, color=\@columncolor ] (0,2.0) -- (0,4);  % 下封綫
\node [below,]  at%
		(0,19) {\hbox{\tate\@tfish}};
%	\node [below,]  at%
%		(0,9) {\hbox{\tate\@tfish}};
	\node [below,]  at%
		(0,6) {\hbox{\tate\makebox[3zw]{\verthuge\gtfamily\ebseries %
		\color{\@columncolor}\zhnumber{\@arabic\c@ppage}}}};
	\node [below,]  at%
		(0,4) {\hbox{\tate\@bfish}};
	}

% 定義偶數頁魚尾、奇偶公用頁碼
\def\@fisheven{%
%		\draw [line width=20pt, color=\@columncolor ] (18.2,19.8) -- (18.2,19); % 上封綫
%		\draw [line width=20pt, color=\@columncolor ] (18.2,2.0) -- (18.2,4);  % 下封綫
	\node [below,]  at%
		(18.2,19) {\hbox{\tate\@tfish}};
%	\node [below,]  at%
%		(18.2,9) {\hbox{\tate\@tfish}};
	\node [below,]  at%
		(18.2,6) {\hbox{\tate\makebox[3zw]{\verthuge\gtfamily\ebseries %
		\color{kakiiro!85}\zhnumber{\@arabic\c@ppage}}}};
	\node [below,]  at%
		(18.2,4) {\hbox{\tate\@bfish}\stepcounter{ppage}};
	}

% 定義奇數頁和偶數頁的水平頁碼，pdfm 啓用
\def\@pdfmpageodd{%
\ifthenelse{\value{page} < 1}{%
	\node [right,]  at%
		(0.6,1.7) {\hbox{\yoko\mgfamily\small~第~\@arabic\c@szpage~頁}%
		\stepcounter{szpage}};}
	{\node [right,]  at%
		(0.6,1.7) {\hbox{\yoko\mgfamily\small~第~\@arabic\c@page~頁%
		\qquad\today\qquad{子~康}}};}
	}
\def\@pdfmpageven{%
\ifthenelse{\value{page} < 1}{%
	\node [left,]  at%
		(17.5,1.7) {\hbox{\yoko\mgfamily\small~第~\@arabic\c@szpage~頁}%
		\stepcounter{szpage}};}
	{\node [left,]  at%
		(17.5,1.7) {\hbox{\yoko\mgfamily\small~{子~康}\qquad\today\qquad%
		第~\@arabic\c@page~頁}};}
	}

% 定義奇數頁和偶數頁的垂直頁碼，pdfm 不啓用
\def\@ppageodd{%
	\node [below,]  at%
		(1.2,18) {\hbox{\tate\mgfamily\small\leftmark}};  % 章標題
\ifthenelse{\value{page} < 1}{%
	\node [above,]  at%
		(1.2,5) {\hbox{\tate\mgfamily\small%
		（{第}~\zhnumber{\@arabic\c@szpage}~{頁}）}\stepcounter{szpage}};}
	{\node [above,]  at%
		(1.2,5) {\hbox{\tate\mgfamily\small~\kansuji\c@page~%
		（{第}~\zhnumber{\@arabic\c@ppage}~{頁}）}\stepcounter{ppage}};}
	}
\def\@ppageven{%
	\node [below,]  at%
		(17.0,19) {\hbox{\tate\mgfamily\small\@maintitle}};  % 書名
\ifthenelse{\value{page} < 1}{%
	\node [above,]  at%
		(17.0,5) {\hbox{\tate\mgfamily\small%
		（{第}~\zhnumber{\@arabic\c@szpage}~{頁}）}\stepcounter{szpage}};}
	{\node [above,]  at%
		(17.0,5) {\hbox{\tate\mgfamily\small~\kansuji\c@page~%
		（{第}~\zhnumber{\@arabic\c@ppage}~{頁}）}\stepcounter{ppage}};}
	}

%%%% 正兒八經的水印命令（開始）
% 正文奇數頁、糸欄
\newcommand{\watermarkodd}{\AddToShipoutPictureBG{%
	\begin{tikzpicture}[overlay]
\if@pdfm % 有糸欄、有邉框
	\@ribonodd\@kasenodd\@fishodd
	\@pdfmpageodd % 水平頁碼
	\node [below,]  at%
		(0,18) {\hbox{\tate\verthuge\gtfamily\ebseries%
		\color{\@columncolor}\@maintitle\quad{巻}\thechapter}};  % 書名+ 卷號
	\node [below,rectangle,]  at%
		(16.4,18) {\hbox{\tate\mgfamily\small\hbox{\kanjiskip=1pt版權所有}%
		\qquad\hbox{\kanjiskip=1pt翻印必究}}};
\else % 無糸欄、無邉框
	\node [right,]  at%
		(1.2,1.7) {\hbox{\yoko\mgfamily\small\hbox{\kanjiskip=1pt版權所有}%
		\qquad\hbox{\kanjiskip=1pt翻印必究}}};
	\@ppageodd
\fi
\end{tikzpicture}%
}}

% 正文偶數頁、糸欄
\newcommand{\watermarkeven}{\AddToShipoutPictureBG{%
	\begin{tikzpicture}[overlay]
\if@pdfm % 有糸欄、有邉框
	\@riboneven\@kaseneven\@fisheven
	\@pdfmpageven % 水平頁碼
	\node [below,]  at%
		(18.2,18) {\hbox{\tate\verthuge\gtfamily\ebseries%
		\color{\@columncolor}\@maintitle\quad{巻}\thechapter}};  % 書名+ 卷號
	\node [below,rectangle,]  at%
		(1.8,18) {\hbox{\tate\mgfamily\small\hbox{\kanjiskip=1pt版權所有}%
		\qquad\hbox{\kanjiskip=1pt翻印必究}}};
\else % 無糸欄、無邉框
	\node [left,]  at%
		(17,1.7) {\hbox{\yoko\mgfamily\small\hbox{\kanjiskip=1pt版權所有}%
		\qquad\hbox{\kanjiskip=1pt翻印必究}}};
	\@ppageven
\fi
	\end{tikzpicture}%
}}

% 正文奇數頁、無糸欄
%\newcommand{\watermkkochuodd}{\AddToShipoutPictureBG{%
%}}

% 正文偶數頁、無糸欄
\newcommand{\watermkkochueven}{\AddToShipoutPictureBG{%
	\begin{tikzpicture}[overlay]
\if@pdfm % 有邉框
	\@kaseneven\@fisheven
\node [below,]  at%
		(18.2,18) {\hbox{\tate\verthuge\gtfamily\ebseries%
		\color{kakiiro!85}\@maintitle}};  % 書名
\else % 無邉框
%	\@ppageven
\fi
	\end{tikzpicture}%
}}

% pagestyle my 前言奇數頁、無糸欄、垂直頁碼、無標題
\newcommand{\mywatermkodd}{\AddToShipoutPictureBG{%
	\begin{tikzpicture}[overlay]
\if@pdfm % 有邉框
	\@kasenodd%\@fishodd
\ifthenelse{\value{page} < 1}{%
	\node [above,]  at%
		(0.5,5) {\hbox{\tate\mgfamily\small%
		（{第}~\kansuji\c@szpage~{頁}）\stepcounter{szpage}}};}
	{\node [above,]  at%
		(0.5,5) {\hbox{\tate\mgfamily\small~\kansuji\c@page~%
		（{第}~\kansuji\c@ppage~{頁}）}};}
\else % 無邉框
\ifthenelse{\value{page} < 1}{%
	\node [above,]  at%
		(1.2,5) {\hbox{\tate\mgfamily\small%
		（{第}~\kansuji\c@szpage~{頁}）\stepcounter{szpage}}};}
	{\node [above,]  at%
		(1.2,5) {\hbox{\tate\mgfamily\small~\kansuji\c@page~%
		（{第}~\kansuji\c@ppage~{頁}）}\stepcounter{ppage}};}
\fi
	\end{tikzpicture}%
}}

% pagestyle my 偶數頁、無糸欄、垂直頁碼、無標題
\newcommand{\mywatermkeven}{\AddToShipoutPictureBG{%
	\begin{tikzpicture}[overlay]
\if@pdfm % 有邉框
	\@kaseneven%\@fisheven
\ifthenelse{\value{page} < 1}{%
	\node [above,]  at%
		(17.7,5) {\hbox{\tate\mgfamily\small%
		（{第}~\kansuji\c@szpage~{頁}）\stepcounter{szpage}}};}
	{\node [above,]  at%
		(17.7,5) {\hbox{\tate\mgfamily\small~\kansuji\c@page~%
		（{第}~\kansuji\c@ppage~{頁}）}\stepcounter{ppage}};}
\else % 無邉框
\ifthenelse{\value{page} < 1}{%
	\node [above,]  at%
		(17.0,5) {\hbox{\tate\mgfamily\small%
		（{第}~\kansuji\c@szpage~{頁}）\stepcounter{szpage}}};}
	{\node [above,]  at%
		(17.0,5) {\hbox{\tate\mgfamily\small~\kansuji\c@page~%
		（{第}~\kansuji\c@ppage~{頁}）}\stepcounter{ppage}};}
\fi
	\end{tikzpicture}%
}}

% 目錄奇數頁、糸欄
\newcommand{\watermkmenuodd}{\AddToShipoutPictureBG{%
	\begin{tikzpicture}[overlay]
\if@pdfm % 有邉框
	\@kasenodd\@fishodd\@pdfmpageodd
\ifthenelse{\value{ppage} > 1}{%
	\foreach \i in {420,390,...,60}{%
		% 起始點 420 + 30pt 每欄 从右往左
		\draw [ color=\@riboncolor ] (\i pt, 2.2)--(\i pt, 19.8);}}% 奇數頁絲欄 
	{\foreach \i in {390,360,...,60}{%
		% 起始點 420 + 30pt 每欄 从右往左
		\draw [ color=\@riboncolor ] (\i pt, 2.2)--(\i pt, 19.8);}}% 奇數頁絲欄 
	\node [below,]  at%
		(0,18) {\hbox{\tate\verthuge\gtfamily\ebseries%
		\color{\@columncolor}\@maintitle\qquad{目}\quad{次}}};
\else % 無邉框
	\@ppageodd
\fi
	\end{tikzpicture}%
}}

% 目錄偶數頁、糸欄
\newcommand{\watermkmenueven}{\AddToShipoutPictureBG{%
	\begin{tikzpicture}[overlay]
\if@pdfm % 有邉框
	\@kaseneven\@fisheven\@riboneven\@pdfmpageven
	\node [below,]  at%
		(18.2,18) {\hbox{\tate\verthuge\gtfamily\ebseries%
		\color{kakiiro!85}\@maintitle\qquad{目}\quad{次}}};
\else % 無邉框
	\@ppageven
\fi
	\end{tikzpicture}%
}}

% 凡例奇數頁、糸欄
\newcommand{\myabstractodd}{\AddToShipoutPictureBG{%
	\begin{tikzpicture}[overlay]
\if@pdfm % 有邉框
	\@kasenodd\@ribonodd\@fishodd
	\@pdfmpageodd
	\node [below,]  at%
		(0,18) {\hbox{\tate\verthuge\gtfamily\ebseries%
		\color{\@columncolor}\@maintitle\qquad{凡}\quad{例}}};
\else % 無邉框
	\@ppageodd
\fi
	\end{tikzpicture}%
}}

% 凡例偶數頁、糸欄
\newcommand{\myabstracteven}{\AddToShipoutPictureBG{%
	\begin{tikzpicture}[overlay]
\if@pdfm % 有邉框
	\@kaseneven\@riboneven\@fisheven
	\@pdfmpageven
	\node [below,]  at%
		(18.2,18) {\hbox{\tate\verthuge\gtfamily\ebseries%
		\color{kakiiro!85}\@maintitle\qquad{凡}\quad{例}}};
\else % 無邉框
	\@ppageven
\fi
	\end{tikzpicture}%
}}

% 附錄奇數頁、糸欄
\newcommand{\myappendixodd}{\AddToShipoutPictureBG{%
	\begin{tikzpicture}[overlay]
\if@pdfm % 有邉框
	\@kasenodd\@ribonodd\@fishodd
	\@pdfmpageodd
	\node [below,]  at%
		(0,18) {\hbox{\tate\verthuge\gtfamily\ebseries%
		\color{\@columncolor}\@maintitle\qquad{附}\quad{錄}}};
\else % 無邉框
	\@ppageodd
\fi
	\end{tikzpicture}%
}}

% 附錄偶數頁、糸欄
\newcommand{\myappendixeven}{\AddToShipoutPictureBG{%
	\begin{tikzpicture}[overlay]
\if@pdfm % 有邉框
	\@kaseneven\@riboneven\@fisheven
	\@pdfmpageven
	\node [below,]  at%
		(18.2,18) {\hbox{\tate\verthuge\gtfamily\ebseries%
		\color{kakiiro!85}\@maintitle\qquad{附}\quad{錄}}};
\else % 無邉框
	\@ppageven
\fi
	\end{tikzpicture}%
}}
%%%% 正兒八經的水印命令（結束）
\newcommand{\watermarkoff}{\ClearShipoutPictureBG}

%PageStyle for dvipdfmx

%PageStyle 定義（開始）
\def\ps@plain{% 带糸欄的正文
   \let\@mkboth\markboth
   % 章標題
 \def\@oddfoot{%
      \watermarkoff\watermarkodd}%
 \def\@evenfoot{%
      \watermarkoff\watermarkeven}%
   \let\@oddhead\@empty
   \let\@evenhead\@empty  }
\def\ps@my{ % 定義前言使用的頁碼
   \let\@mkboth\markboth
 \def\@oddfoot{%
      \watermarkoff\mywatermkodd}%
 \def\@evenfoot{%
      \watermarkoff\mywatermkeven}%
   \let\@oddhead\@empty
   \let\@evenhead\@empty  }

\def\ps@mymenu{% % 用于目录
   \let\@mkboth\markboth
 \def\@oddfoot{%
      \watermarkoff\watermkmenuodd}%
 \def\@evenfoot{%
      \watermarkoff\watermkmenueven}%
   \let\@oddhead\@empty
   \let\@evenhead\@empty  }

\def\ps@myabstract{% % 用于凡例
   \let\@mkboth\markboth
 \def\@oddfoot{%
      \watermarkoff\myabstractodd }%
 \def\@evenfoot{%
      \watermarkoff\myabstracteven}%
   \let\@oddhead\@empty
   \let\@evenhead\@empty  }

\def\ps@myappendix{% % 用于附錄
   \let\@mkboth\markboth
 \def\@oddfoot{%
      \watermarkoff\myappendixodd }%
 \def\@evenfoot{%
      \watermarkoff\myappendixeven}%
   \let\@oddhead\@empty
   \let\@evenhead\@empty  }
%PageStyle for dvips

\let\ps@jpl@in\ps@plain

\def\p@thanks#1{\footnotemark
  \protected@xdef\@thanks{\@thanks
    \protect{\noindent$\m@th^\thefootnote$~#1\protect\par}}}
%PageStyle 定義（結束）

%頁眉、頁碼設置（結束）

%封面設置
%. タイトル周り
\newenvironment{titlepage}{%
  \thispagestyle{empty}%
  \setcounter{page}{1}%
}{%
  \if@twoside\else
    \setcounter{page}{1}%
  \fi
}

\newcommand{\maketitle}{%
    % jarticleとかからあまり変更していない
    \begin{titlepage}%
    \let\footnotesize\small
    \let\footnoterule\relax
    \let\footnote\thanks
    \newpage\null\vfil
    \vskip .6\baselineskip%
    \begin{flushleft}%
      {\tlarge\mcfamily\bfseries \hspace{2zw}\color{yellow}\@maintitle \par}%
      \vskip 72pt%
      {\Large%
      \begin{tabular}[t]{r}%
        \verthuge\color{yellow}\@author\UTF{3000}\UTF{3000}\UTF{3000}%
      \end{tabular}\par}%
%      \vskip\baselineskip%
%      {\large\@date\par}%
    \vskip \baselineskip%
    \end{flushleft}%
    \end{titlepage}%
  \jlreq@endofmaketitle%
}

% いろいろクリアする．
\def\jlreq@endofmaketitle{%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\p@thanks\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
  \setcounter{ppage}{1}%
  \setcounter{szpage}{1}%
  \clearpage%
}%
%封面設置結束

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
\def\@endpart{\watermarkoff\vfil\newpage
  \if@twoside
   \if@openleft
    \null\thispagestyle{empty}\watermarkoff\newpage
   \else\if@openright
    \null\thispagestyle{empty}\watermarkoff\newpage
   \fi\fi
  \fi
   \if@tempswa\twocolumn\fi}

%%% 定義的 章、回
\newcommand{\@chapapp}{\prechaptername}
\newcommand{\@chappos}{\postchaptername}

\newcommand{\chapter}{%
  \if@openleft\if@pdfm \cleardbpage \else \cleardoublepage \fi \else
  \if@openright \if@pdfm \cleardbpage \else \cleardoublepage \fi
    \else \clearpage \fi \fi
    \global\@topnum\z@
    \@afterindenttrue
  \secdef\@chapter\@schapter  }

%%% 定義前言 的 章、回
\newcommand{\bfchapter}{%
  \if@pdfm \cleardbpage \else \cleardoublepage \fi
  \global\@topnum\z@
  \@afterindenttrue
  \secdef\@chapter\@schapter  }

%%% 定義不翻頁的 章、回
\newcommand{\szchapter}{%
  \if@pdfm \cleardbpage \else \cleardoublepage \fi
  \global\@topnum\z@
  \@afterindenttrue
  \secdef\@chapter\@schapter  }

%%% 章、回内部定義
\def\@chapter[#1]#2{%
  \ifnum \c@secnumdepth >\m@ne
    \if@mainmatter
    \refstepcounter{chapter}%
    \typeout{\@chapapp\space\thechapter\space\@chappos}%
    \addcontentsline{toc}{chapter}%
      {\protect\numberline{\@chapapp\thechapter\@chappos}#1}%
    \else\addcontentsline{toc}{chapter}{#1}\fi
  \else
    \addcontentsline{toc}{chapter}{#1}%
  \fi
  \markboth{\@chapapp\thechapter\@chappos\hskip1zw#1}{}%
  \addtocontents{lof}{\protect\addvspace{10\p@}}%
  \addtocontents{lot}{\protect\addvspace{10\p@}}%
  \@makechapterhead{#2}\@afterheading}
\def\@makechapterhead#1{%\hbox{}%
  {     \par\hbox{\huge\color{kakiiro!90}%
        \hbox{\mgfamily{\@maintitle}巻之}}
   %\vskip0.8\Cvs
   \par{\hbox{}}\vskip-1pt%
     \par \noindent \huge\symth
   \raggedright
   \leavevmode
   \ifnum \c@secnumdepth >\m@ne
     \setlength\@tempdima{\linewidth}%
    \if@mainmatter
     \setbox\z@\hbox{\@chapapp\thechapter\@chappos\hskip1zw}
     \addtolength\@tempdima{-\wd\z@}%
     \unhbox\z@\nobreak
    \fi
     \vtop{\hsize\@tempdima#1}%
   \else
     #1\relax
   \fi}\nobreak \par{\hbox{}}\vskip1pt%
    \setcounter{ppage}{1} }
\def\@schapter#1{%
  \@makeschapterhead{#1}\@afterheading}

\def\@makeschapterhead#1{%\hbox{}%
   \par{\hbox{}}
   %\vskip-2pt
  {\parindent\z@
   \raggedright
   \normalfont\huge\mcfamily\bfseries
   \leavevmode
   \setlength\@tempdima{\linewidth}%
   \vtop{\hsize\@tempdima#1}}\nobreak\par{\hbox{}}%\vskip-2pt%\vskip\baselineskip%
    \setcounter{ppage}{1}}

\newcommand\section[1]{\@startsection{section}{1}{\z@}%
   {1\Cvs }%
   {1\Cvs }%
   {\normalfont\xiaoer\mcfamily\bfseries}{#1}\markright{\thesection\quad#1}}
\newcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
   {1\Cvs }%
   {1\Cvs }%
   {\normalfont\large\bfseries}}
\newcommand{\subsubsection}{\@startsection{subsubsection}{3}{\z@}%
   {0.0001\Cvs }%
   {0.0001\Cvs }%
   {\normalfont\normalsize\bfseries}}
\newcommand{\paragraph}{\@startsection{paragraph}{4}{\z@}%
   {0.0001\Cvs }%
   {0.0001\Cvs }%
   {\normalfont\normalsize\bfseries}}
\newcommand{\subparagraph}{\@startsection{subparagraph}{5}{\z@}%
   {0.0001\Cvs }%
   {0.0001\Cvs }%
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
  {%\let\\\@centercr
   \list{}{\itemsep 0 pt%
           \topsep 0 pt %
           \itemindent 0zw%
           \parsep 0 pt %
           \listparindent\itemindent \gtfamily \szverse
           \rightmargin\leftmargin \advance\leftmargin 0.5zw}%
           \item\relax}{\endlist}
%引文環境（前後均有縮進、首行縮進）
\newenvironment{quotation}
  {\list{}{\itemsep 0 pt%
           \topsep 0 pt %
           \gtfamily\szverse \listparindent 1zw%
           \itemindent\listparindent%
           \rightmargin\leftmargin%
           \parsep 0 pt}%
           \item\relax}{\endlist}

%引文（懸挂縮進）
\newenvironment{hanging}
  {\let\\\@centercr
   \list{}{\itemsep 0 pt%
           \topsep 0 pt %
           \itemindent -2.25zw%
           \listparindent\itemindent \gtfamily \szverse
           \rightmargin\leftmargin \advance\leftmargin 0.5zw}%
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
     \leaders\hbox{$\m@th\mkern \@dotsep mu$\null\inhibitglue \CID{638}\inhibitglue\null$\m@th\mkern \@dotsep mu$}%
     \hfill\nobreak
     \hb@xt@\@pnumwidth{\hss\normalfont \normalcolor #5} %
     \par}%
  \fi}

% 在 class 里把关于页码的内容放到  \AtBeginDocument 里（见class末尾）

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
%  \bookmark[dest=\@currentHref, level=1]{返回目錄}%
  \setcounter{ppage}{1}
  \watermarkoff\pagestyle{mymenu}
    \@starttoc{toc}%
    \ifodd\value{page}{\clearpage\par{\UTF{3000}}}\fi
  \if@restonecol\twocolumn\fi
}
\newcommand*{\l@part}[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    %\addvspace{2.25em \@plus\p@}%
    %\addvspace{\baselineskip}
    \begingroup
    \parindent\z@\rightskip\@pnumwidth
    \parfillskip-\@pnumwidth
    {\leavevmode\Large\bfseries
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
    %\addvspace{1.0em \@plus\p@}%
    \addvspace{\baselineskip}
    \begingroup
      \parindent\z@ \rightskip\@pnumwidth \parfillskip-\rightskip
      \leavevmode\symth\large
%          \setlength\@lnumwidth{6zw}%
          \setlength\@lnumwidth{7zw}%
      \advance\leftskip\@lnumwidth \hskip-\leftskip
      #1\nobreak\hfil\nobreak\hb@xt@\@pnumwidth{\hss#2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}

\newcommand*{\l@section}[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    %\addvspace{1.0em \@plus\p@}%
    \addvspace{\baselineskip}
    \begingroup
      \parindent=2zw %\parindent\z@
      \rightskip\@pnumwidth \parfillskip-\rightskip
      \leavevmode\symtd\large
%          \setlength\@lnumwidth{6zw}%
          \setlength\@lnumwidth{5zw}%
      \advance\leftskip\@lnumwidth \hskip-\leftskip
      #1\nobreak\hfil\nobreak\hb@xt@\@pnumwidth{\hss#2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}

% 目錄加點串連
%\newcommand*{\l@section}       {\@dottedtocline{2}{5zw}{3zw}}
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
\renewcommand{\footnoterule}{%
  \kern-3\p@
  \hrule width .4\columnwidth
  \kern 2.6\p@}
\@addtoreset{footnote}{chapter}
\newcommand\@makefntext[1]{\parindent 1zw
  \noindent\hbox to 2zw{\hss\@makefnmark}#1}

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
  \iftdir        %判斷是否為縱書
    \if西暦
      {\kansuji\number\year}年
      \zhnumber{\@arabic\month}月
      \zhnumber{\@arabic\day}日
    \else
      令和\ifnum\Reiwa=1 元年\else\rensuji{\number\Reiwa}年\fi
      \rensuji{\number\month}月
      \rensuji{\number\day}日
    \fi
  \else
    \if西暦
      {\number\year}~年~%
      {\number\month}~月~%
      {\number\day}~日%
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

\def\@makeenmark{\kern -1.7zw \raisebox{.8zh}{\szix %
            \smash{\hbox{（{\zhnumber{\@theenmark}}）}}}\kern .2zw}
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
\def\enoteformat{\parindent -3.25zw \leftskip 4zw \rightskip 2zw%
% \UTF{FE35}\hbox{\yoko\expandafter\ajTumesuji\expandafter*\expandafter{\number\@theenmark}}\UTF{FE36}}
% \UTF{FE35}\hbox{\kansuji\number\@theenmark}\UTF{FE36}\hskip3pt} %2019/01/25 \UTF{FE35}\UTF{FE36} 全角括號
 \UTF{FE35}\hbox{\zhnumber{\@theenmark}}\UTF{FE36}\hskip3pt} %2019/04/02
%\def\enotesize{\normalsize}
\def\enotesize{\large\ujlreq}

\newlength\chuskip
\setlength{\chuskip}{0mm}       %在正文中設置可覆蓋此句

\def\theendnotes{\vskip2\baselineskip%\begin{multicols}{2}% 修改分欄欄目數不會起作用，嘗試直接屏蔽多欄
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
    \par\noindent
     {\LARGE\mcfamily\bfseries \CID{12869}}\vskip6pt%-\chuskip
      %%% \CID{7740} 註;直点  \CID{2990} 註;斜点
      %%% \CID{2987} 注;斜点  \CID{10419} 注;圏注
      %%% \CID{12869} 注;粗体 \CID{13926} 注;直点
    \enotesize %
    \@input{\jobname.ent}%
      \endgroup %\end{multicols}
             } %\def\theendnotes
% 定義的章回後注（結束）

% 引入頭注、按章回刷新頭注計數器
\RequirePackage{tochu}
\@addtoreset{kcbango}{chapter}

% 定義的破折號
%\def\dash{{\leavevmode\kern1mm\raise0.1zh\hbox{\mcfamily{------}}\kern1mm}}
\def\dash{~{\leavevmode\raise0zh\hbox{\rule{1.8zw}{1pt}}}~}

\def\dott{\hbox{\mcfamily{……}}}

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

% 定義的偽粗體示例
%\def\textZan{\kern0.22zw\makebox[\Cwd]{{\fzkts%
%\hbox{\scalebox{0.993}[1]{𩯳}}\kern-1zw%
%\hbox{\scalebox{1}[1]{𩯳}}}}\kern0.22zw}
%
%\def\textBang{\kern0.15zw\makebox[\Cwd]{{\fzkts%
%\hbox{\scalebox{0.993}[1]{𠳐}}\kern-1zw%
%\hbox{\scalebox{1}[1]{𠳐}}}}\kern0.15zw}
%
%\def\textMJi{\kern0.15zw\makebox[\Cwd]{{\fzkts%
%\hbox{\scalebox{0.993}[1]{𣬠}}\kern-1zw%
%\hbox{\scalebox{1}[1]{𣬠}}}}\kern0.15zw}
%
%\def\textMBa{\kern0.15zw\makebox[\Cwd]{{\fzkts%
%\hbox{\scalebox{0.993}[1]{𣬶}}\kern-1zw%
%\hbox{\scalebox{1}[1]{𣬶}}}}\kern0.15zw}
%
%\def\textLiu{\kern0.2zw\makebox[\Cwd]{{\mcfamily\kern-0.32zw%
%\hbox{\scalebox{1.1}[1.15]{丷}}\kern-0.5zw%
%\hbox{\scalebox{0.64}[0.9]{田}}\kern-0.65zw%
%\hbox{\scalebox{0.65}[0.9]{田}}}}\kern0.2zw}


% 定義的 目錄頁碼格式（非常重要！！）
\AtBeginDocument{%
%\def\contentsline#1#2#3#4{\csname l@#1\endcsname{%
%\hyper@linkstart{link}{#4}{#2}\hyper@linkend}{\zhnumber{#3}}}%
\def\contentsline#1#2#3#4{\csname l@#1\endcsname{%
\hyper@linkstart{link}{#4}{#2}\hyper@linkend}{\@Kanji{#3}}}%
\if@pdfm
\setlength{\oddsidemargin}{- 41 pt}   %修正數據
\setlength{\evensidemargin}{- 3 pt}   %修正數據
%
\else
\setlength{\oddsidemargin} {-28 pt}   %修正數據
\setlength{\evensidemargin}{-16 pt}   %修正數據
\fi
}

\endinput


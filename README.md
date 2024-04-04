# upLaTeX-SZ.CLS

### A Template of Chinese/Japanese vertical book style.

本模板曾經被我用於排版直排PDF之《石頭記》（下載訪問: [脂硯齋重評石頭記之庚辰本](https://drive.google.com/drive/folders/1Ufhx1Nn3eoHrLbz-d3VSilL3Ek-Kyoug) ）。

如今，將代碼托管到 GitHub ，以供愛好者們克隆使用。

（欢迎加入UpTeX直書交流QQ群：887970677）

This Template was used to make a vertical book of Hong Lou Meng（紅樓夢）, you can get it by the link:  [the Tale of the Stone（脂硯齋重評石頭記之庚辰本）](https://drive.google.com/drive/folders/1Ufhx1Nn3eoHrLbz-d3VSilL3Ek-Kyoug) 

I pulled it on Github to share with upLaTeX users Now.

### 字体安裝

### install font

拷貝 gerib10.mf 以及 300dpi 360dpi 600dpi 720dpi 四個文件夾，

至 C:\texlive\texmf-local\fonts\source\genko 目錄下, 管理員執行 mktexlsr 刷新即可。

Copy gerib10.mf and 4 file floder (300dpi 360dpi 600dpi 720dpi ) into `C:\texlive\texmf-local\fonts\source\genko `.

And reflash by Administrator using command `mktexlsr` .

### 模板的編譯

### How to

本模板使用 upLaTeX 進行編譯。

It will compiled by upLaTeX in Windows or UpTeX on a Mac.

###  Example

``chcp 65001``

``uplatex main``

``uplatex main``

``dvipdfmx  main``

### 模板來源

### Where it came from?

本模板來自熊本學園大學院經濟學部小川 弘和 老師（Shigaku Zasshi）。

This Template origined from Shigaku Zasshi（小川 弘和）, Department of Economics, Kumamoto Gakuen University.

Website:	[熊本學園大學院經濟學部小川 弘和](http://www2.kumagaku.ac.jp/teacher/herogw/)

### 言語

### Language

目前説明文件僅有一套中文版。

I have made only a version of Chinese manual.

### 許可

### Copyright

商用允許（保留署名）；轉載自由。

Commercial allowed (signature reserved); copy freely.

### 説明書下載

### Manual of SZ.CLS

https://github.com/Steve-Cheung-emct/Manual-of-SZ.CLS

## 注意事項

#### 2024/04/01 更新之下，修改了正文的漢字尺寸，與舊模型不再兼容。試用前請務必備份。

該模板雙欄下割注會出錯。雙欄中使用頭注（tochu）也會出錯。排割注及頭注請使用單欄模式。

## Notice:

Do not use ``twocolumn`` or ``\begin{multicols}{2}`` to produce tochu(headnote) or warichu(a kind of note which cut off lines).

You have to use onecolumn rather than twocolumn(multicols included).

關於該模板及説明書的疏漏之處，敬請愛好者們積極反饋，不吝賜教。

I am very glad to accept any advices.

### 附：UpTeX入门帖子中文版

https://zhuanlan.zhihu.com/p/81728243

## 更新履歷

2024/04/01 ver.1.8c 更新最近以來的一些新特性，改善奇偶頁偏移向量、書眉位置，正文漢字尺寸等等。

2020/11/29 ver.1.8a 修復eso-pic更新引起的問題。

2019/12/3 ver.1.3b 调整傍注（footnote）位置。

2019/09/28 ver.1.3a 發佈。移除字號選項。同時移除了許多特性，包括基於 `llap`  `rlap` 的頁面佈局。如今新增基於TikZ 的水印，同時修復了書眉。

2019/08 ver.1.2a 發佈。新增字號選項。

2019/06  ver.1.0 發佈。

### chang log

2024/04/01 ver.1.8c fixed many bugs and modified the hoffset(s) of pages.

2020/11/29 ver.1.8a fixed one bug by updating of eso-pic.

2019/12/3 ver.1.3b  Footnote position modified .

2019/09/28 ver.1.3a released. removed  font size options. removed many old feathers, including pagestyle via `rlap` `llap`;

now added watermark by TikZ , fixed pagestyle.  

2019/08 ver.1.2a released. added font size options.

2019/06  ver.1.0 released.

## 閑話

### 漢字的 fallback

參考見 [jfmutilで和文VFをカスタマイズする話(1)](https://zrbabbler.hatenablog.com/entry/2019/03/03/234646)

只説思路。

在 my-v.zvp （亦即 my-v.jvf）中，新增一個字體映射列 `MAPFONT` ，`MAPFONT` 是用作外部映射的頭文件，可以使用 urmlv.tfm 複製得到。

```my-jvf
(MAPFONT D 3
   (FONTNAME symt-at)
   (FONTCHECKSUM O 0)
   (FONTAT R 1.0)
   (FONTDSIZE R 10.0)
   )

```

然後在後續的正文中，定義你要映射去思源明體字符的域。這裏放不下，見附件 （`思源明朝体的字符的域.txt `）：

這之後，在置位時，使用以下語句塊為需要映射去思源字體的字符域置位（全局特性；不需要單個字符單獨置位）。

```my-jvf
(SUBTYPE D 0 D 1
   (MAP
      (SELECTFONT D 3)
      (SETCHAR)
      )
   )

```

`SUBTYPE D 0 D 1` 是（`CHARSINSUBTYPE D 0 D 1`）所在的域在置位時使用的語句塊。

以上就是做Adobe Japan 1-6 在 Unicode-BMP 的補集的 font fallback 了。

如果在實際使用中需要用到 CJK-B、CJK-C 的漢字，則在字符空間中隨意引申，額外配置 `MAPFONT D X` 並使用全局置位即可。

### Adobe Japan 1-6 之康熙字形

如果你直接使用系統配置之 `ujlreq-v.jvf` 那麽很多漢字映射出來都不是康熙字形。很顯然的，想要得到康熙字形，這是一個非自發的修改，不論你使用 cmap 魔改工具，還是 Adobe InDesign 或者 Photoshop 等可以讀取 IVS 數據切換 CID 的工具。

那麽我們依然可以通過字體内置的 IVD 數據，得到異體字的相關信息。

直接使用結果吧，見附件 （AJ16CID替換 SETCHAR.txt）

在 my-v.jvf 中寫入

```my-jvf
(MAPFONT D 9
   (FONTNAME otf-cjmr-v)
   (FONTCHECKSUM O 0)
   (FONTAT R 1.0)
   (FONTDSIZE R 10.0)
   )

```

並在置位時使用 （AJ16CID替換 SETCHAR.txt）
```my-jvf
(CHARACTER H F957
   (MAP
      (SELECTFONT D 9)
      (SETCHAR H 481)
      )
   )

```

對於 CID 字形的切換是一一對應的，不可能批量置位。因此它每一條表示切換一個字符的 CID。

示例即是將 U+F957 置位為 ISO-2022-JP 表形式的 Adobe-Identity-H／Adobe-Identity-V 的子表 0 所記錄的 0x0481 ，這個16進制數轉爲10進制後表示  `cid01153` 即 1153 所存放的字形。（每個ISO-2022-JP 子表内空間為 94×94，其編碼空間為 92×92，在齋藤修三郎老師的 otf.sty 中所使用的 CID 映射的子表，每個子表映射 4096 字（64×64），即 0x0FFF ，將CID 序號轉16進制後，最高位即為子表的序號。如 cid23057 → 16進制為 0x5A11 ，5即表示在第5子表，這個ISO-2022-JP 是虛擬映射的，它並不存在真實編碼關係，只要知道他們都是一一對應即可。）

這些映射關係，可以通過讀取 opentype 的表 `cmap` 查找，不過，表上的也僅僅是 Adobe 默認的映射。所以想要讓他輸出 康熙字形，得花費一些巧思。留待以後展開陳述吧。

### map 的配置，以便不同模板中使用它

在 map files 中寫入

```map files
symt-ah    unicode    SourceHanSerifK-Light.otf
symt-aq    unicode    SourceHanSerifK-Light.otf
symt-at    unicode    SourceHanSerifK-Light.otf    -w    1
symt-bh    unicode    SourceHanSerifK-Regular.otf
symt-bq    unicode    SourceHanSerifK-Regular.otf
symt-bt    unicode    SourceHanSerifK-Regular.otf    -w    1
symt-ch    unicode    SourceHanSerifK-Regular.otf
symt-cq    unicode    SourceHanSerifK-Regular.otf
symt-ct    unicode    SourceHanSerifK-Regular.otf    -w    1
symt-dh    unicode    SourceHanSerifK-SemiBold.otf
symt-dq    unicode    SourceHanSerifK-SemiBold.otf
symt-dt    unicode    SourceHanSerifK-SemiBold.otf    -w    1
symt-eh    unicode    SourceHanSerifK-Bold.otf
symt-eq    unicode    SourceHanSerifK-Bold.otf
symt-et    unicode    SourceHanSerifK-Bold.otf    -w    1
symt-fh    unicode    SourceHanSerifK-Bold.otf
symt-fq    unicode    SourceHanSerifK-Bold.otf
symt-ft    unicode    SourceHanSerifK-Bold.otf    -w    1

```

自己做一個編碼映射方式，這裏要用到三種 tfm ，一種是橫向（xxx-h，相當於橫向 D0），一種是橫向參照用作UniJIS-UCS2-V映射在半角模式下輸出全角標點的蝌蚪引號（xxx-hq，相當於橫向 D2，這里雖然没用到他，但還是要配置上，以便日後使用全局橫向的思源字體時不出錯，雖然沒什麽卵用），一種是縱向（xxx-v，相當於縱向 D0）不管怎樣，你重新配置的時候，都會單獨使用一個zvp，不會和系統已有的字體衝突。

注意，垂直（JT2）字形思源字體的映射，必須加上 `   -w    1` 參數，因爲思源是 Adobe-Identity-0 的字體，不是標準的Adobe CID。

配完 map 之後複製到 TeX 的系統中（如 `C:\texlive\texmf-local\fonts\map\dvipdfmx`）， 再執行 系統命令 ``kanji-config-updmap-sys --jis2004 myfont`` ，``myfont`` 表示的是你為魔改字體配置的字族。否則沒法使用這些映射。



#### NFSS 的配置

（僅示例）

``` LaTeX
% mincho light; 明朝体，細
\DeclareFontFamily{JY2}{utmc}{}
\DeclareFontFamily{JT2}{utmc}{}

\DeclareFontShape{JY2}{utmc}{l}{n}{<->s*[0.924690]upml-apr}{}
\DeclareFontShape{JY2}{utmc}{l}{it}{<->ssub*utmc/l/n}{}
\DeclareFontShape{JY2}{utmc}{l}{sl}{<->ssub*utmc/l/n}{}
\DeclareFontShape{JY2}{utmc}{l}{sc}{<->ssub*utmc/l/n}{}
\DeclareFontShape{JT2}{utmc}{l}{n}{<->s*[0.924690]utml-apr}{}
\DeclareFontShape{JT2}{utmc}{l}{it}{<->ssub*utmc/l/n}{}
\DeclareFontShape{JT2}{utmc}{l}{sl}{<->ssub*utmc/l/n}{}
\DeclareFontShape{JT2}{utmc}{l}{sc}{<->ssub*utmc/l/n}{}

\DeclareFontShape{JY2}{utmc}{m}{n}{<->s*[0.924690]upmr-apr}{}
\DeclareFontShape{JY2}{utmc}{m}{it}{<->ssub*utmc/m/n}{}
\DeclareFontShape{JY2}{utmc}{m}{sl}{<->ssub*utmc/m/n}{}
\DeclareFontShape{JY2}{utmc}{m}{sc}{<->ssub*utmc/m/n}{}
\DeclareFontShape{JT2}{utmc}{m}{n}{<->s*[0.924690]utmr-apr}{}
\DeclareFontShape{JT2}{utmc}{m}{it}{<->ssub*utmc/m/n}{}
\DeclareFontShape{JT2}{utmc}{m}{sl}{<->ssub*utmc/m/n}{}
\DeclareFontShape{JT2}{utmc}{m}{sc}{<->ssub*utmc/m/n}{}

\DeclareFontShape{JY2}{utmc}{bx}{n}{<->s*[0.924690]upmb-apr}{}
\DeclareFontShape{JY2}{utmc}{bx}{it}{<->ssub*utmc/bx/n}{}
\DeclareFontShape{JY2}{utmc}{bx}{sl}{<->ssub*utmc/bx/n}{}
\DeclareFontShape{JY2}{utmc}{bx}{sc}{<->ssub*utmc/bx/n}{}
\DeclareFontShape{JT2}{utmc}{bx}{n}{<->s*[0.924690]utmb-apr}{}
\DeclareFontShape{JT2}{utmc}{bx}{it}{<->ssub*utmc/bx/n}{}
\DeclareFontShape{JT2}{utmc}{bx}{sl}{<->ssub*utmc/bx/n}{}
\DeclareFontShape{JT2}{utmc}{bx}{sc}{<->ssub*utmc/bx/n}{}

% gothic regular; 黑体，常規
\DeclareFontFamily{JY2}{utgt}{}
\DeclareFontFamily{JT2}{utgt}{}

\DeclareFontShape{JY2}{utgt}{m}{n}{<->s*[0.924690]upgr-apr}{}
\DeclareFontShape{JY2}{utgt}{m}{it}{<->ssub*utgt/m/n}{}
\DeclareFontShape{JY2}{utgt}{m}{sl}{<->ssub*utgt/m/n}{}
\DeclareFontShape{JY2}{utgt}{m}{sc}{<->ssub*utgt/m/n}{}
\DeclareFontShape{JY2}{utgt}{l}{n}{<->ssub*utgt/m/n}{}
\DeclareFontShape{JT2}{utgt}{m}{n}{<->s*[0.924690]utgr-apr}{}
\DeclareFontShape{JT2}{utgt}{m}{it}{<->ssub*utgt/m/n}{}
\DeclareFontShape{JT2}{utgt}{m}{sl}{<->ssub*utgt/m/n}{}
\DeclareFontShape{JT2}{utgt}{m}{sc}{<->ssub*utgt/m/n}{}
\DeclareFontShape{JT2}{utgt}{l}{n}{<->ssub*utgt/m/n}{}

\DeclareFontShape{JY2}{utgt}{bx}{n}{<->s*[0.924690]upgb-apr}{}
\DeclareFontShape{JY2}{utgt}{bx}{it}{<->ssub*utgt/bx/n}{}
\DeclareFontShape{JY2}{utgt}{bx}{sl}{<->ssub*utgt/bx/n}{}
\DeclareFontShape{JY2}{utgt}{bx}{sc}{<->ssub*utgt/bx/n}{}
\DeclareFontShape{JT2}{utgt}{bx}{n}{<->s*[0.924690]utgb-apr}{}
\DeclareFontShape{JT2}{utgt}{bx}{it}{<->ssub*utgt/bx/n}{}
\DeclareFontShape{JT2}{utgt}{bx}{sl}{<->ssub*utgt/bx/n}{}
\DeclareFontShape{JT2}{utgt}{bx}{sc}{<->ssub*utgt/bx/n}{}

\DeclareFontShape{JY2}{utgt}{eb}{n}{<->s*[0.924690]upge-apr}{}
\DeclareFontShape{JY2}{utgt}{eb}{it}{<->ssub*utgt/eb/n}{}
\DeclareFontShape{JY2}{utgt}{eb}{sl}{<->ssub*utgt/eb/n}{}
\DeclareFontShape{JY2}{utgt}{eb}{sc}{<->ssub*utgt/eb/n}{}
\DeclareFontShape{JT2}{utgt}{eb}{n}{<->s*[0.924690]utge-apr}{}
\DeclareFontShape{JT2}{utgt}{eb}{it}{<->ssub*utgt/eb/n}{}
\DeclareFontShape{JT2}{utgt}{eb}{sl}{<->ssub*utgt/eb/n}{}
\DeclareFontShape{JT2}{utgt}{eb}{sc}{<->ssub*utgt/eb/n}{}

% maru gothic, only one weight
% 圓体，常規
\DeclareFontFamily{JY2}{mg}{}
\DeclareFontFamily{JT2}{mg}{}

\DeclareFontShape{JY2}{mg}{m}{n}{<->s*[0.924690]upmg-apr}{}
\DeclareFontShape{JY2}{mg}{m}{it}{<->ssub*mg/m/n}{}
\DeclareFontShape{JY2}{mg}{m}{sl}{<->ssub*mg/m/n}{}
\DeclareFontShape{JY2}{mg}{m}{sc}{<->ssub*mg/m/n}{}
\DeclareFontShape{JY2}{mg}{l}{n}{<->ssub*mg/m/n}{}
\DeclareFontShape{JY2}{mg}{bx}{n}{<->ssub*mg/m/n}{}
\DeclareFontShape{JY2}{mg}{b}{n}{<->ssub*mg/m/n}{}
\DeclareFontShape{JT2}{mg}{m}{n}{<->s*[0.924690]utmg-apr}{}
\DeclareFontShape{JT2}{mg}{m}{it}{<->ssub*mg/m/n}{}
\DeclareFontShape{JT2}{mg}{m}{sl}{<->ssub*mg/m/n}{}
\DeclareFontShape{JT2}{mg}{m}{sc}{<->ssub*mg/m/n}{}
\DeclareFontShape{JT2}{mg}{l}{n}{<->ssub*mg/m/n}{}
\DeclareFontShape{JT2}{mg}{bx}{n}{<->ssub*mg/m/n}{}
\DeclareFontShape{JT2}{mg}{b}{n}{<->ssub*mg/m/n}{}

\DeclareRobustCommand\ujmgrn{\kanjifamily{mg}\kanjiseries{m}\selectfont}

\renewcommand\mcdefault{utmc}
\renewcommand\gtdefault{utgt}

\renewcommand\kanjifamilydefault{\mcdefault}
\renewcommand\kanjiseriesdefault{\mddefault}

```







### 標點的擠壓方式
我寫了一個新模型的JVF，暫未放上GitHub，大意是用 ZR 的工具，將 ujlreq-v.vf 做了一些修改，標點符號之 glue-kern 表中，將成對標點（D1、D2）組，與之相關的漢字之間的交互關係，其彈性 ``glue`` 由 ``(GLUE D 1 R 0.5 R 0.0 R 0.5)`` 改爲 ``(GLUE D 1 R 0.0 R 0.5 R 0.0)`` ， 必然的，全角標點間距就會變成半角的標點間距。這種修改不涉及字符本身的映射，只會改變標點與標點、標點與漢字的交互關係。

參考見第2.3、2.9節。（[UpTeX虚拟字体与直書排版要素-20220310](https://github.com/Steve-Cheung-emct/uptex-ebook/blob/master/UpTeX%E8%99%9A%E6%8B%9F%E5%AD%97%E4%BD%93%E4%B8%8E%E7%9B%B4%E6%9B%B8%E6%8E%92%E7%89%88%E8%A6%81%E7%B4%A0-20220310.pdf) ）：

``ujlreq-v.jvf`` 其中的 GLUEKERN 表

```gluekern
(GLUEKERN
   (LABEL D 0)
   (GLUE D 1 R 0.5 R 0.0 R 0.5)
   (GLUE D 2 R 0.0 R 0.0 R 0.0)
   (GLUE D 3 R 0.0 R 0.0 R 0.0)
   (GLUE D 4 R 0.25 R 0.0 R 0.25)
   (GLUE D 5 R 0.0 R 0.0 R 0.0)
   (GLUE D 6 R 0.0 R 0.0 R 0.0)
   (GLUE D 10 R 0.0 R 0.0 R 0.0)
   (GLUE D 13 R 0.0 R 0.0 R 0.0)
   (GLUE D 14 R 0.0 R 0.0 R 0.0)
   (GLUE D 15 R 0.0 R 0.0 R 0.0)
   (STOP)
   (LABEL D 1)
   (GLUE D 0 R 0.0 R 0.0 R 0.0)
   (GLUE D 1 R 0.0 R 0.0 R 0.0)
   (GLUE D 2 R 0.0 R 0.0 R 0.0)
   (GLUE D 3 R 0.0 R 0.0 R 0.0)
   (GLUE D 4 R 0.25 R 0.0 R 0.25)
   (GLUE D 5 R 0.0 R 0.0 R 0.0)
   (GLUE D 6 R 0.0 R 0.0 R 0.0)
   (GLUE D 7 R 0.0 R 0.0 R 0.0)
   (GLUE D 8 R 0.0 R 0.0 R 0.0)
   (GLUE D 9 R 0.0 R 0.0 R 0.0)
   (GLUE D 10 R 0.0 R 0.0 R 0.0)
   (GLUE D 11 R 0.0 R 0.0 R 0.0)
   (GLUE D 12 R 0.0 R 0.0 R 0.0)
   (GLUE D 13 R 0.0 R 0.0 R 0.0)
   (GLUE D 14 R 0.0 R 0.0 R 0.0)
   (GLUE D 15 R 0.0 R 0.0 R 0.0)
   (STOP)
   (LABEL D 2)
   (GLUE D 0 R 0.5 R 0.0 R 0.5)
   (GLUE D 1 R 0.5 R 0.0 R 0.5)
   (GLUE D 2 R 0.0 R 0.0 R 0.0)
   (GLUE D 3 R 0.5 R 0.0 R 0.5)
   (GLUE D 4 R 0.25 R 0.0 R 0.25)
   (GLUE D 5 R 0.0 R 0.0 R 0.0)
   (GLUE D 6 R 0.0 R 0.0 R 0.0)
   (GLUE D 7 R 0.5 R 0.0 R 0.5)
   (GLUE D 8 R 0.5 R 0.0 R 0.5)
   (GLUE D 9 R 0.5 R 0.0 R 0.5)
   (GLUE D 10 R 0.0 R 0.0 R 0.0)
   (GLUE D 11 R 0.5 R 0.0 R 0.5)
   (GLUE D 12 R 0.5 R 0.0 R 0.5)
   (GLUE D 13 R 0.5 R 0.0 R 0.5)
   (GLUE D 14 R 0.5 R 0.0 R 0.5)
   (GLUE D 15 R 0.5 R 0.0 R 0.5)
   (STOP)
   (LABEL D 3)
   (GLUE D 1 R 0.5 R 0.0 R 0.5)
   (GLUE D 2 R 0.0 R 0.0 R 0.0)
   (GLUE D 3 R 0.0 R 0.0 R 0.0)
   (GLUE D 4 R 0.25 R 0.0 R 0.25)
   (GLUE D 5 R 0.0 R 0.0 R 0.0)
   (GLUE D 6 R 0.0 R 0.0 R 0.0)
   (GLUE D 7 R 0.0 R 0.0 R 0.0)
   (GLUE D 8 R 0.0 R 0.0 R 0.0)
   (GLUE D 9 R 0.0 R 0.0 R 0.0)
   (GLUE D 10 R 0.0 R 0.0 R 0.0)
   (GLUE D 11 R 0.0 R 0.0 R 0.0)
   (GLUE D 12 R 0.0 R 0.0 R 0.0)
   (GLUE D 13 R 0.0 R 0.0 R 0.0)
   (GLUE D 14 R 0.0 R 0.0 R 0.0)
   (GLUE D 15 R 0.0 R 0.0 R 0.0)
   (STOP)
   (LABEL D 4)
   (GLUE D 0 R 0.25 R 0.0 R 0.25)
   (GLUE D 1 R 0.25 R 0.0 R 0.25)
   (GLUE D 2 R 0.25 R 0.0 R 0.25)
   (GLUE D 3 R 0.25 R 0.0 R 0.25)
   (GLUE D 4 R 0.5 R 0.0 R 0.5)
   (GLUE D 5 R 0.25 R 0.0 R 0.25)
   (GLUE D 6 R 0.25 R 0.0 R 0.25)
   (GLUE D 7 R 0.25 R 0.0 R 0.25)
   (GLUE D 8 R 0.25 R 0.0 R 0.25)
   (GLUE D 9 R 0.25 R 0.0 R 0.25)
   (GLUE D 10 R 0.25 R 0.0 R 0.25)
   (GLUE D 11 R 0.25 R 0.0 R 0.25)
   (GLUE D 12 R 0.25 R 0.0 R 0.25)
   (GLUE D 13 R 0.25 R 0.0 R 0.25)
   (GLUE D 14 R 0.25 R 0.0 R 0.25)
   (GLUE D 15 R 0.25 R 0.0 R 0.25)
   (STOP)
   (LABEL D 5)
   (GLUE D 0 R 0.5 R 0.0 R 0.0)
   (GLUE D 1 R 0.5 R 0.0 R 0.0)
   (GLUE D 2 R 0.0 R 0.0 R 0.0)
   (GLUE D 3 R 0.5 R 0.0 R 0.0)
   (GLUE D 4 R 0.75 R 0.0 R 0.25)
   (GLUE D 5 R 0.0 R 0.0 R 0.0)
   (GLUE D 6 R 0.0 R 0.0 R 0.0)
   (GLUE D 7 R 0.5 R 0.0 R 0.0)
   (GLUE D 8 R 0.5 R 0.0 R 0.0)
   (GLUE D 9 R 0.5 R 0.0 R 0.0)
   (GLUE D 10 R 0.5 R 0.0 R 0.0)
   (GLUE D 11 R 0.5 R 0.0 R 0.0)
   (GLUE D 12 R 0.5 R 0.0 R 0.0)
   (GLUE D 13 R 0.5 R 0.0 R 0.0)
   (GLUE D 14 R 0.5 R 0.0 R 0.0)
   (GLUE D 15 R 0.5 R 0.0 R 0.0)
   (STOP)
   (LABEL D 6)
   (GLUE D 0 R 0.5 R 0.0 R 0.5)
   (GLUE D 1 R 0.5 R 0.0 R 0.5)
   (GLUE D 2 R 0.0 R 0.0 R 0.0)
   (GLUE D 3 R 0.5 R 0.0 R 0.5)
   (GLUE D 4 R 0.75 R 0.0 R 0.75)
   (GLUE D 5 R 0.0 R 0.0 R 0.0)
   (GLUE D 6 R 0.0 R 0.0 R 0.0)
   (GLUE D 7 R 0.5 R 0.0 R 0.5)
   (GLUE D 8 R 0.5 R 0.0 R 0.5)
   (GLUE D 9 R 0.5 R 0.0 R 0.5)
   (GLUE D 10 R 0.5 R 0.0 R 0.5)
   (GLUE D 11 R 0.5 R 0.0 R 0.5)
   (GLUE D 12 R 0.5 R 0.0 R 0.5)
   (GLUE D 13 R 0.5 R 0.0 R 0.5)
   (GLUE D 14 R 0.5 R 0.0 R 0.5)
   (GLUE D 15 R 0.5 R 0.0 R 0.5)
   (STOP)
   (LABEL D 7)
   (GLUE D 0 R 0.0 R 0.25 R 0.0)
   (GLUE D 1 R 0.5 R 0.0 R 0.5)
   (GLUE D 2 R 0.0 R 0.0 R 0.0)
   (GLUE D 3 R 0.0 R 0.0 R 0.0)
   (GLUE D 4 R 0.25 R 0.0 R 0.25)
   (GLUE D 5 R 0.0 R 0.0 R 0.0)
   (GLUE D 6 R 0.0 R 0.0 R 0.0)
   (GLUE D 7 R 0.0 R 0.0 R 0.0)
   (GLUE D 10 R 0.0 R 0.0 R 0.0)
   (GLUE D 13 R 0.0 R 0.0 R 0.0)
   (GLUE D 14 R 0.0 R 0.0 R 0.0)
   (GLUE D 15 R 0.0 R 0.0 R 0.0)
   (STOP)
   (LABEL D 8)
   (GLUE D 1 R 0.5 R 0.0 R 0.5)
   (GLUE D 2 R 0.0 R 0.0 R 0.0)
   (GLUE D 3 R 0.0 R 0.0 R 0.0)
   (GLUE D 4 R 0.25 R 0.0 R 0.25)
   (GLUE D 5 R 0.0 R 0.0 R 0.0)
   (GLUE D 6 R 0.0 R 0.0 R 0.0)
   (GLUE D 7 R 0.0 R 0.0 R 0.0)
   (GLUE D 10 R 0.0 R 0.0 R 0.0)
   (GLUE D 13 R 0.0 R 0.0 R 0.0)
   (GLUE D 14 R 0.0 R 0.0 R 0.0)
   (GLUE D 15 R 0.0 R 0.0 R 0.0)
   (STOP)
   (LABEL D 9)
   (GLUE D 0 R 0.0 R 0.25 R 0.0)
   (GLUE D 1 R 0.5 R 0.0 R 0.5)
   (GLUE D 2 R 0.0 R 0.0 R 0.0)
   (GLUE D 3 R 0.0 R 0.0 R 0.0)
   (GLUE D 4 R 0.25 R 0.0 R 0.25)
   (GLUE D 5 R 0.0 R 0.0 R 0.0)
   (GLUE D 6 R 0.0 R 0.0 R 0.0)
   (GLUE D 10 R 0.0 R 0.0 R 0.0)
   (GLUE D 13 R 0.0 R 0.0 R 0.0)
   (GLUE D 14 R 0.0 R 0.0 R 0.0)
   (GLUE D 15 R 0.0 R 0.0 R 0.0)
   (STOP)
   (LABEL D 10)
   (GLUE D 0 R 0.0 R 0.0 R 0.0)
   (GLUE D 1 R 0.0 R 0.0 R 0.0)
   (GLUE D 2 R 0.0 R 0.0 R 0.0)
   (GLUE D 3 R 0.0 R 0.0 R 0.0)
   (GLUE D 4 R 0.25 R 0.0 R 0.25)
   (GLUE D 5 R 0.0 R 0.0 R 0.0)
   (GLUE D 6 R 0.0 R 0.0 R 0.0)
   (GLUE D 7 R 0.0 R 0.0 R 0.0)
   (GLUE D 8 R 0.0 R 0.0 R 0.0)
   (GLUE D 9 R 0.0 R 0.0 R 0.0)
   (GLUE D 10 R 0.0 R 0.0 R 0.0)
   (GLUE D 11 R 0.0 R 0.0 R 0.0)
   (GLUE D 12 R 0.0 R 0.0 R 0.0)
   (GLUE D 13 R 0.0 R 0.0 R 0.0)
   (GLUE D 14 R 0.0 R 0.0 R 0.0)
   (GLUE D 15 R 0.0 R 0.0 R 0.0)
   (STOP)
   (LABEL D 11)
   (GLUE D 1 R 0.5 R 0.0 R 0.5)
   (GLUE D 2 R 0.0 R 0.0 R 0.0)
   (GLUE D 3 R 0.0 R 0.0 R 0.0)
   (GLUE D 4 R 0.25 R 0.0 R 0.25)
   (GLUE D 5 R 0.0 R 0.0 R 0.0)
   (GLUE D 6 R 0.0 R 0.0 R 0.0)
   (GLUE D 10 R 0.0 R 0.0 R 0.0)
   (GLUE D 13 R 0.0 R 0.0 R 0.0)
   (GLUE D 14 R 0.0 R 0.0 R 0.0)
   (GLUE D 15 R 0.0 R 0.0 R 0.0)
   (STOP)
   (LABEL D 12)
   (GLUE D 1 R 0.5 R 0.0 R 0.5)
   (GLUE D 2 R 0.0 R 0.0 R 0.0)
   (GLUE D 3 R 0.0 R 0.0 R 0.0)
   (GLUE D 4 R 0.25 R 0.0 R 0.25)
   (GLUE D 5 R 0.0 R 0.0 R 0.0)
   (GLUE D 6 R 0.0 R 0.0 R 0.0)
   (GLUE D 10 R 0.0 R 0.0 R 0.0)
   (GLUE D 13 R 0.0 R 0.0 R 0.0)
   (GLUE D 14 R 0.0 R 0.0 R 0.0)
   (GLUE D 15 R 0.0 R 0.0 R 0.0)
   (STOP)
   (LABEL D 13)
   (GLUE D 0 R 0.0 R 0.0 R 0.0)
   (GLUE D 1 R 0.5 R 0.0 R 0.5)
   (GLUE D 2 R 0.0 R 0.0 R 0.0)
   (GLUE D 3 R 0.0 R 0.0 R 0.0)
   (GLUE D 4 R 0.25 R 0.0 R 0.25)
   (GLUE D 5 R 0.0 R 0.0 R 0.0)
   (GLUE D 6 R 0.0 R 0.0 R 0.0)
   (GLUE D 7 R 0.0 R 0.0 R 0.0)
   (GLUE D 8 R 0.0 R 0.0 R 0.0)
   (GLUE D 9 R 0.0 R 0.0 R 0.0)
   (GLUE D 10 R 0.0 R 0.0 R 0.0)
   (GLUE D 11 R 0.0 R 0.0 R 0.0)
   (GLUE D 12 R 0.0 R 0.0 R 0.0)
   (GLUE D 13 R 0.0 R 0.0 R 0.0)
   (GLUE D 14 R 0.0 R 0.0 R 0.0)
   (GLUE D 15 R 0.0 R 0.0 R 0.0)
   (STOP)
   (LABEL D 14)
   (GLUE D 0 R 0.0 R 0.0 R 0.0)
   (GLUE D 1 R 0.5 R 0.0 R 0.5)
   (GLUE D 2 R 0.0 R 0.0 R 0.0)
   (GLUE D 3 R 0.0 R 0.0 R 0.0)
   (GLUE D 4 R 0.25 R 0.0 R 0.25)
   (GLUE D 5 R 0.0 R 0.0 R 0.0)
   (GLUE D 6 R 0.0 R 0.0 R 0.0)
   (GLUE D 7 R 0.0 R 0.0 R 0.0)
   (GLUE D 8 R 0.0 R 0.0 R 0.0)
   (GLUE D 9 R 0.0 R 0.0 R 0.0)
   (GLUE D 10 R 0.0 R 0.0 R 0.0)
   (GLUE D 11 R 0.0 R 0.0 R 0.0)
   (GLUE D 12 R 0.0 R 0.0 R 0.0)
   (GLUE D 13 R 0.0 R 0.0 R 0.0)
   (GLUE D 14 R 0.0 R 0.0 R 0.0)
   (GLUE D 15 R 0.0 R 0.0 R 0.0)
   (STOP)
   (LABEL D 15)
   (GLUE D 0 R 0.0 R 0.0 R 0.0)
   (GLUE D 1 R 0.5 R 0.0 R 0.5)
   (GLUE D 2 R 0.0 R 0.0 R 0.0)
   (GLUE D 3 R 0.0 R 0.0 R 0.0)
   (GLUE D 4 R 0.25 R 0.0 R 0.25)
   (GLUE D 5 R 0.0 R 0.0 R 0.0)
   (GLUE D 6 R 0.0 R 0.0 R 0.0)
   (GLUE D 7 R 0.0 R 0.0 R 0.0)
   (GLUE D 8 R 0.0 R 0.0 R 0.0)
   (GLUE D 9 R 0.0 R 0.0 R 0.0)
   (GLUE D 10 R 0.0 R 0.0 R 0.0)
   (GLUE D 11 R 0.0 R 0.0 R 0.0)
   (GLUE D 12 R 0.0 R 0.0 R 0.0)
   (GLUE D 13 R 0.0 R 0.0 R 0.0)
   (GLUE D 14 R 0.0 R 0.0 R 0.0)
   (GLUE D 15 R 0.0 R 0.0 R 0.0)
   (STOP)
   )
```

``utmr-apr.jvf`` 我自己的改版， 其中的 GLUEKERN 表

```gluekern
(GLUEKERN
   (LABEL D 0)
   (GLUE D 1 R 0.0 R 0.5 R 0.0)
   (GLUE D 2 R 0.0 R 0.0 R 0.0)
   (GLUE D 3 R 0.0 R 0.0 R 0.0)
   (GLUE D 4 R 0.0 R 0.0 R 0.0)
   (GLUE D 5 R 0.0 R 0.0 R 0.0)
   (GLUE D 6 R 0.0 R 0.0 R 0.0)
   (GLUE D 12 R 0.25 R 0.0 R 0.0)
   (GLUE D 13 R 0.25 R 0.0 R 0.0)
   (GLUE D 15 R 0.25 R 0.0 R 0.0)
   (STOP)
   (LABEL D 1)
   (GLUE D 0 R 0.0 R 0.0 R 0.0)
   (GLUE D 1 R 0.0 R 0.25 R 0.0)
   (GLUE D 2 R 0.0 R 0.0 R 0.0)
   (GLUE D 3 R 0.0 R 0.0 R 0.0)
   (GLUE D 4 R 0.0 R 0.0 R 0.0)
   (GLUE D 12 R 0.25 R 0.0 R 0.0)
   (GLUE D 13 R 0.25 R 0.0 R 0.0)
   (GLUE D 14 R 0.0 R 0.0 R 0.0)
   (GLUE D 15 R 0.25 R 0.0 R 0.0)
   (STOP)
   (LABEL D 2)
   (GLUE D 0 R 0.0 R 0.5 R 0.0)
   (GLUE D 1 R 0.0 R 0.25 R 0.0)
   (GLUE D 2 R 0.0 R 0.25 R 0.0)
   (GLUE D 3 R 0.0 R 0.25 R 0.0)
   (GLUE D 4 R 0.0 R 0.25 R 0.0)
   (GLUE D 5 R 0.0 R 0.0 R 0.0)
   (GLUE D 6 R 0.0 R 0.0 R 0.0)
   (GLUE D 12 R 0.5 R 0.0 R 0.25)
   (GLUE D 13 R 0.5 R 0.0 R 0.25)
   (GLUE D 14 R 0.0 R 0.0 R 0.0)
   (GLUE D 15 R 0.5 R 0.0 R 0.25)
   (STOP)
   (LABEL D 3)
   (GLUE D 1 R 0.0 R 0.0 R 0.0)
   (GLUE D 2 R 0.0 R 0.0 R 0.0)
   (GLUE D 3 R 0.0 R 0.0 R 0.0)
   (GLUE D 4 R 0.0 R 0.0 R 0.0)
   (GLUE D 5 R 0.0 R 0.0 R 0.0)
   (GLUE D 6 R 0.0 R 0.0 R 0.0)
   (GLUE D 12 R 0.25 R 0.0 R 0.0)
   (GLUE D 13 R 0.25 R 0.0 R 0.0)
   (GLUE D 14 R 0.0 R 0.0 R 0.0)
   (GLUE D 15 R 0.25 R 0.0 R 0.0)
   (STOP)
   (LABEL D 4)
   (GLUE D 1 R 0.0 R 0.25 R 0.0)
   (GLUE D 2 R 0.0 R 0.0 R 0.0)
   (GLUE D 3 R 0.0 R 0.0 R 0.0)
   (GLUE D 4 R 0.0 R 0.0 R 0.0)
   (GLUE D 5 R 0.0 R 0.0 R 0.0)
   (GLUE D 6 R 0.0 R 0.0 R 0.0)
   (GLUE D 12 R 0.25 R 0.0 R 0.0)
   (GLUE D 13 R 0.25 R 0.0 R 0.0)
   (GLUE D 14 R 0.0 R 0.0 R 0.0)
   (GLUE D 15 R 0.25 R 0.0 R 0.0)
   (STOP)
   (LABEL D 5)
   (GLUE D 0 R 0.0 R 0.5 R 0.0)
   (GLUE D 1 R 0.0 R 0.25 R 0.0)
   (GLUE D 2 R 0.0 R 0.25 R 0.0)
   (GLUE D 3 R 0.0 R 0.25 R 0.0)
   (GLUE D 4 R 0.0 R 0.25 R 0.0)
   (GLUE D 5 R 0.0 R 0.25 R 0.0)
   (GLUE D 6 R 0.0 R 0.25 R 0.0)
   (GLUE D 12 R 0.5 R 0.0 R 0.25)
   (GLUE D 13 R 0.5 R 0.0 R 0.25)
   (GLUE D 14 R 0.0 R 0.0 R 0.0)
   (GLUE D 15 R 0.5 R 0.0 R 0.25)
   (STOP)
   (LABEL D 6)
   (GLUE D 0 R 0.0 R 0.5 R 0.0)
   (GLUE D 1 R 0.0 R 0.25 R 0.0)
   (GLUE D 2 R 0.0 R 0.25 R 0.0)
   (GLUE D 3 R 0.0 R 0.25 R 0.0)
   (GLUE D 4 R 0.0 R 0.25 R 0.0)
   (GLUE D 5 R 0.0 R 0.25 R 0.0)
   (GLUE D 6 R 0.0 R 0.25 R 0.0)
   (GLUE D 12 R 0.5 R 0.0 R 0.25)
   (GLUE D 13 R 0.5 R 0.0 R 0.25)
   (GLUE D 14 R 0.0 R 0.0 R 0.0)
   (GLUE D 15 R 0.5 R 0.0 R 0.25)
   (STOP)
   (LABEL D 7)
   (GLUE D 0 R 0.0 R 0.0 R 0.0)
   (GLUE D 1 R 0.0 R 0.0 R 0.0)
   (GLUE D 2 R 0.0 R 0.0 R 0.0)
   (GLUE D 3 R 0.0 R 0.0 R 0.0)
   (GLUE D 4 R 0.0 R 0.0 R 0.0)
   (GLUE D 5 R 0.0 R 0.0 R 0.0)
   (GLUE D 6 R 0.0 R 0.0 R 0.0)
   (GLUE D 12 R 0.25 R 0.0 R 0.0)
   (GLUE D 13 R 0.25 R 0.0 R 0.0)
   (GLUE D 14 R 0.0 R 0.0 R 0.0)
   (GLUE D 15 R 0.25 R 0.0 R 0.0)
   (STOP)
   (LABEL D 8)
   (GLUE D 0 R 0.0 R 0.0 R 0.0)
   (GLUE D 1 R 0.0 R 0.0 R 0.0)
   (GLUE D 2 R 0.0 R 0.0 R 0.0)
   (GLUE D 3 R 0.0 R 0.0 R 0.0)
   (GLUE D 4 R 0.0 R 0.0 R 0.0)
   (GLUE D 5 R 0.0 R 0.0 R 0.0)
   (GLUE D 6 R 0.0 R 0.0 R 0.0)
   (GLUE D 12 R 0.25 R 0.0 R 0.0)
   (GLUE D 13 R 0.25 R 0.0 R 0.0)
   (GLUE D 14 R 0.0 R 0.0 R 0.0)
   (GLUE D 15 R 0.25 R 0.0 R 0.0)
   (STOP)
   (LABEL D 9)
   (GLUE D 0 R 0.0 R 0.0 R 0.0)
   (GLUE D 1 R 0.0 R 0.0 R 0.0)
   (GLUE D 2 R 0.0 R 0.0 R 0.0)
   (GLUE D 3 R 0.0 R 0.0 R 0.0)
   (GLUE D 4 R 0.0 R 0.0 R 0.0)
   (GLUE D 5 R 0.0 R 0.0 R 0.0)
   (GLUE D 6 R 0.0 R 0.0 R 0.0)
   (GLUE D 12 R 0.25 R 0.0 R 0.0)
   (GLUE D 13 R 0.25 R 0.0 R 0.0)
   (GLUE D 14 R 0.0 R 0.0 R 0.0)
   (GLUE D 15 R 0.25 R 0.0 R 0.0)
   (STOP)
   (LABEL D 10)
   (GLUE D 0 R 0.0 R 0.0 R 0.0)
   (GLUE D 1 R 0.0 R 0.0 R 0.0)
   (GLUE D 2 R 0.0 R 0.0 R 0.0)
   (GLUE D 3 R 0.0 R 0.0 R 0.0)
   (GLUE D 4 R 0.0 R 0.0 R 0.0)
   (GLUE D 5 R 0.0 R 0.0 R 0.0)
   (GLUE D 6 R 0.0 R 0.0 R 0.0)
   (GLUE D 12 R 0.25 R 0.0 R 0.0)
   (GLUE D 13 R 0.25 R 0.0 R 0.0)
   (GLUE D 14 R 0.0 R 0.0 R 0.0)
   (GLUE D 15 R 0.25 R 0.0 R 0.0)
   (STOP)
   (LABEL D 11)
   (GLUE D 0 R 0.0 R 0.0 R 0.0)
   (GLUE D 1 R 0.0 R 0.0 R 0.0)
   (GLUE D 3 R 0.0 R 0.0 R 0.0)
   (GLUE D 4 R 0.0 R 0.0 R 0.0)
   (GLUE D 5 R 0.0 R 0.0 R 0.0)
   (GLUE D 6 R 0.0 R 0.0 R 0.0)
   (GLUE D 12 R 0.25 R 0.0 R 0.0)
   (GLUE D 13 R 0.25 R 0.0 R 0.0)
   (GLUE D 14 R 0.0 R 0.0 R 0.0)
   (GLUE D 15 R 0.25 R 0.0 R 0.0)
   (STOP)
   (LABEL D 12)
   (GLUE D 0 R 0.25 R 0.0 R 0.0)
   (GLUE D 1 R 0.5 R 0.0 R 0.0)
   (GLUE D 2 R 0.25 R 0.0 R 0.0)
   (GLUE D 3 R 0.25 R 0.0 R 0.0)
   (GLUE D 4 R 0.25 R 0.0 R 0.0)
   (GLUE D 5 R 0.25 R 0.0 R 0.0)
   (GLUE D 6 R 0.25 R 0.0 R 0.0)
   (GLUE D 7 R 0.25 R 0.0 R 0.0)
   (GLUE D 8 R 0.25 R 0.0 R 0.0)
   (GLUE D 9 R 0.25 R 0.0 R 0.0)
   (GLUE D 10 R 0.0 R 0.0 R 0.0)
   (GLUE D 11 R 0.25 R 0.0 R 0.0)
   (GLUE D 12 R 0.0 R 0.0 R 0.0)
   (GLUE D 13 R 0.5 R 0.0 R 0.0)
   (GLUE D 14 R 0.25 R 0.0 R 0.0)
   (GLUE D 15 R 0.5 R 0.0 R 0.0)
   (STOP)
   (LABEL D 13)
   (GLUE D 0 R 0.25 R 0.0 R 0.0)
   (GLUE D 1 R 0.5 R 0.0 R 0.0)
   (GLUE D 2 R 0.25 R 0.0 R 0.0)
   (GLUE D 3 R 0.25 R 0.0 R 0.0)
   (GLUE D 4 R 0.25 R 0.0 R 0.0)
   (GLUE D 5 R 0.25 R 0.0 R 0.0)
   (GLUE D 6 R 0.25 R 0.0 R 0.0)
   (GLUE D 7 R 0.25 R 0.0 R 0.0)
   (GLUE D 8 R 0.25 R 0.0 R 0.0)
   (GLUE D 9 R 0.25 R 0.0 R 0.0)
   (GLUE D 10 R 0.0 R 0.0 R 0.0)
   (GLUE D 11 R 0.25 R 0.0 R 0.0)
   (GLUE D 12 R 0.5 R 0.0 R 0.0)
   (GLUE D 13 R 0.0 R 0.0 R 0.0)
   (GLUE D 14 R 0.25 R 0.0 R 0.0)
   (GLUE D 15 R 0.5 R 0.0 R 0.0)
   (STOP)
   (LABEL D 14)
   (GLUE D 0 R 0.0 R 0.0 R 0.0)
   (GLUE D 1 R 0.0 R 0.25 R 0.0)
   (GLUE D 2 R 0.0 R 0.0 R 0.0)
   (GLUE D 3 R 0.0 R 0.0 R 0.0)
   (GLUE D 4 R 0.0 R 0.0 R 0.0)
   (GLUE D 5 R 0.0 R 0.0 R 0.0)
   (GLUE D 6 R 0.0 R 0.0 R 0.0)
   (GLUE D 12 R 0.25 R 0.0 R 0.0)
   (GLUE D 13 R 0.25 R 0.0 R 0.0)
   (GLUE D 14 R 0.0 R 0.0 R 0.0)
   (GLUE D 15 R 0.25 R 0.0 R 0.0)
   (STOP)
   (LABEL D 15)
   (GLUE D 0 R 0.25 R 0.0 R 0.0)
   (GLUE D 1 R 0.5 R 0.0 R 0.0)
   (GLUE D 2 R 0.25 R 0.0 R 0.0)
   (GLUE D 3 R 0.25 R 0.0 R 0.0)
   (GLUE D 4 R 0.25 R 0.0 R 0.0)
   (GLUE D 5 R 0.25 R 0.0 R 0.0)
   (GLUE D 6 R 0.25 R 0.0 R 0.0)
   (GLUE D 7 R 0.25 R 0.0 R 0.0)
   (GLUE D 8 R 0.25 R 0.0 R 0.0)
   (GLUE D 9 R 0.25 R 0.0 R 0.0)
   (GLUE D 10 R 0.0 R 0.0 R 0.0)
   (GLUE D 11 R 0.25 R 0.0 R 0.0)
   (GLUE D 12 R 0.5 R 0.0 R 0.0)
   (GLUE D 13 R 0.5 R 0.0 R 0.0)
   (GLUE D 14 R 0.25 R 0.0 R 0.0)
   (GLUE D 15 R 0.0 R 0.0 R 0.0)
   (STOP)
   )

```

子康

2024年4月1日


# upLaTeX-SZ.CLS

### A Template of Chinese/Japan vertical book style.

本模板曾經被我用於《石頭記》垂直排版之用。現如今，將代碼托管到 GitHub ，

以供愛好者們克隆使用。（欢迎加入UpTeX直書交流QQ群：887970677）

This Template was used to make a vertical book of Hong Lou Meng（紅樓夢）。

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

``uplatex main``

``dvipdfmx  main``

### 関于欄目的修改
### How many columns fit best?

根據此表進行欄目整形，追加或減少欄目個數，并且控制内外邉框終點。

此表格在換算欄目関係時非常有用。

同欄目数，相鄰行距可以公用一個内邉框寬度。如：14 欄29pt 和14 欄 30pt，可公用406pt 作爲内邉框寬度。

相鄰欄目，相差2pt 的可以公用一個内邉框寬度，如：14 欄30pt 和15 欄 28pt，可公用420pt 作爲内邉框寬度。


### 正文字號 16 pt 時，行距、欄距、版心約束、内外邉框的關係

| 序號 | 欄目个数 | 正文行距 | 版心宽度 | 内邉框寬度 |
|----|------|------|------|-------|
| 1  | 14   | 25   | 350  | +4pt  |
| 2  | 14   | 26   | 364  | +4pt  |
| 3  | 14   | 27   | 378  | +4pt  |
| 4  | 14   | 28   | 392  | +4pt  |
| 5  | 14   | 29   | 406  | +4pt  |
| 6  | 14   | 30   | 420  | +4pt  |
| 7  | 15   | 25   | 375  | +4pt  |
| 8  | 15   | 26   | 390  | +4pt  |
| 9  | 15   | 27   | 405  | +4pt  |
| 10 | 15   | 28   | 420  | +4pt  |
| 11 | 15   | 29   | 435  | +4pt  |
| 12 | 15   | 30   | 450  | +4pt  |
| 13 | 16   | 25   | 400  | +4pt  |
| 14 | 16   | 26   | 416  | +4pt  |
| 15 | 16   | 27   | 432  | +4pt  |
| 16 | 16   | 28   | 448  | +4pt  |
| 17 | 16   | 29   | 464  | +4pt  |
| 18 | 16   | 30   | 480  | +4pt  |




### 模板來源

### Where it came from?

本模板來自熊本學園大學院經濟學部小川 弘和 老師（Shigaku Zasshi）。

This Template origined from Shigaku Zasshi（小川 弘和）, Department of Economics, Kumamoto Gakuen University.

Website:	http://www2.kumagaku.ac.jp/teacher/herogw/

### 言語
### Language

目前説明文件僅有一套中文版。

I have made only a version of Chinese manual.

### 許可
### Copyright

商用允許(保留署名)；轉載自由。

Commercial allowed (signature reserved); copy freely.

### 説明書下載
### Manual of SZ.CLS

https://github.com/Steve-Cheung-emct/Manual-of-SZ.CLS

## 注意事項

該模板雙欄下割注必出錯。雙欄下頭注也必出錯。

欲排割注及頭注請使用單欄模式。

## Notice:

Do not use ``twocolumn`` or ``\begin{multicols}{2}`` to produce tochu(headnote) or warichu(a kind of note which cut off lines).

U have to use onecolumn rather than twocolumn(multicols included).

關於該模板及説明書的疏漏之處，敬請愛好者們積極反饋，不吝賜教。

I am very glad to accept any advices.

### 附：UpTeX入门帖子中文版

https://zhuanlan.zhihu.com/p/81728243

## 更新履歷

2020/11/29 ver.1.8a 修復eso-pic更新引起的問題。

2019/12/3 ver.1.3b 调整傍注（footnote）位置。

2019/09/28 ver.1.3a 發佈。移除字號選項。同時移除了許多特性，包括基於 `llap`  `rlap` 的頁面佈局。如今新增基於TikZ 的水印，同時修復了書眉。

2019/08 ver.1.2a 發佈。新增字號選項。

2019/06  ver.1.0 發佈。


### chang log

2019/12/3 ver.1.3b  Footnote position modified .

2019/09/28 ver.1.3a released. removed  font size options. removed many old feathers, including pagestyle via `rlap` `llap`;
now added watermark by TikZ , fixed pagestyle.  

2019/08 ver.1.2a released. added font size options.

2019/06  ver.1.0 released.

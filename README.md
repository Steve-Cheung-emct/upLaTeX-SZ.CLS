# upLaTeX-SZ.CLS

## A Template of Chinese/Japan vertical book style.

本模板曾經被我用於《石頭記》垂直排版之用。現如今，將代碼托管到 GitHub ，

以供愛好者們克隆使用。

This Template was used to make a vertical book of Hong Lou Meng（紅樓夢）。

I pulled it on Github to share with upLaTeX users Now.

## 模板的編譯

## How to

本模板使用{up\LaTeX}或者{Up\TeX}進行編譯。

It will compiled by {up\LaTeX} or {Up\TeX} on a Mac.

##  Example

``chcp 65001``

``uplatex main``

``ptex2pdf -l -u -ot "-kanji=utf8 " -od "-p B5 " main``


## 模板來源

## Where it came from?

本模板來自熊本學園大學院經濟學部小川 弘和 老師（Shigaku Zasshi）。

This Template origined from Shigaku Zasshi（小川 弘和）, Department of Economics, Kumamoto Gakuen University.

Website:	http://www2.kumagaku.ac.jp/teacher/herogw/

## 言語
## Language

目前説明文件僅有一套中文版。

I have made only a version of Chinese manual.

## 許可
## Copyright

商用允許(保留署名)；轉載自由。

Commercial allowed (signature reserved); copy freely.

## 説明書下載
## Manual of SZ.CLS

https://github.com/Steve-Cheung-emct/Manual-of-SZ.CLS

## 注意事項

該模板雙欄下割注必出錯。雙欄下頭注也必出錯。

欲排割注及頭注請使用單欄模式。

## Notice:

Do not use ``twocolumn`` or ``\begin{multicols}{2}`` to produce tochu(headnote) or warichu(a kind of note which cut off lines).

U have to use onecolumn rather than twocolumn(multicols included).

關於該模板及説明書的疏漏之處，敬請愛好者們積極反饋，不吝賜教。

I am very glad to accept any advices.

## 更新履歷
2019/09/28 ver.1.3a 發佈。移除字號選項。同時移除了許多特性，包括基於 `llap`  `rlap` 的頁面佈局。如今新增基於TikZ 的水印，同時修復了書眉。

2019/08 ver.1.2a 發佈。新增字號選項。

2019/06  ver.1.0 發佈。


## chang log

2019/09/28 ver.1.3a released. removed  font size options. removed many old feathers, including pagestyle via `rlap` `llap`;
now added watermark by TikZ , fixed pagestyle.  

2019/08 ver.1.2a released. added font size options.

2019/06  ver.1.0 released.

---
date: "2019-05-05T00:00:00+01:00"
draft: false
linktitle: Few diagrams and charts
menu:
  latex:
    parent: Drawing with $\latex$ # multiple files can have a same parent BTW to better organize contents
    weight: 1
title: Few diagrams and charts with tikz and pstricks
toc: true
type: docs
weight: 1
---

This tutorial is much about how to draw beautiful charts with latex. We use tikz plotting features to generate a probability illustration diagram.

## Tip 1: Bayesian probability illustration diagram

This diagram is most useful when showing conditional probabilities of binomial events. It features sideways text also. This particular example borrowed from http://www.texample.net/tikz/examples/bayes/ page. For the figure output visit the same link.

```
% Mammography problem from 'Intro to Bayes'
% Author: John Henderson
\documentclass[10pt]{article}
\usepackage{tikz}
\usetikzlibrary{positioning,decorations.pathreplacing,shapes}
\usepackage[english]{babel}
\usepackage{microtype}
\usepackage[hmargin=1.5cm,vmargin=1cm]{geometry}
\usepackage{amsmath}
\DeclareMathOperator{\p}{p}
\newcommand*{\cancer}{\text{cancer}}
\newcommand*{\testp}{\text{test}+}
\begin{document}
\begin{tikzpicture}[%
  % common options for blocks:
  block/.style = {draw, fill=blue!30, align=center, anchor=west,
              minimum height=0.65cm, inner sep=0},
  % common options for the circles:
  ball/.style = {circle, draw, align=center, anchor=north, inner sep=0}]

% circle illustrating all women
\node[ball,text width=3cm,fill=purple!20] (all) at (6,0) {All women};

% two circles showing split of p{cancer} and p{~cancer}
\node[ball,fill=red!70,text width=0.1cm,anchor=base] (pcan) at (3.5,-5.5) {};
\node[ball,fill=blue!40,text width=2.9cm,anchor=base] (pncan) at (8.5,-6)
   {Women without cancer\\
    $\p({\sim}\cancer) = 99\%$};

% arrows showing split from all women to cancer and ~cancer
\draw[->,thick,draw=red!50] (all.south) to [out=270,in=90] (pcan.north);
\draw[->,thick,draw=blue!80] (all.south) to [out=270,in=110] (pncan.100);

% transition from all women to actual cancer rates
\node[anchor=north,text width=10cm,inner sep=.05cm,align=center,fill=white]
  (why1) at (6,-3.7) {In measuring, we find:};

% note illustration the p{cancer} circle (text won't fit inside)
\node[inner sep=0,anchor=east,text width=3.3cm] (note1) at (3.2,-5.5) {
   Women with cancer $\p(\cancer) = 1\%$};

% draw the sieves
\node[block,anchor=north,text width=4.4cm,fill=green!50] (tray1) at
   (3.5,-8.8) {\small{$\p(\testp\mid\cancer)=0.8$}};

\node[block,anchor=north,text width=4.4cm,fill=green!50] (tray2) at
   (8.5,-8.8) {$\p(\testp\mid{\sim}\cancer)=0.096$};

% text explaining how p{cancer} and p{~cancer} behave as they
% pass through the sieves
\node[anchor=west,text width=6cm] (note1) at (-6,-9.1) {
   Now we pass both groups through the sieve; note that both
     sieves are \emph{the same}; they just behave differently
     depending on which group is passing through. \\ 
     Let $\testp=$ a positve mammography.};

% arrows showing the circles passing through the seives
\draw[->,thick,draw=red!80] (3.5,-5.9) -- (3.5,-8.6);
\draw[->,thick,draw=blue!50] (8.5,-8.1) -- (8.5,-8.6);

% numerator
\node[ball,text width=0.05cm,fill=red!70] (can) at (6,-10.5) {};

% dividing line
\draw[thick] (5,-11) -- (7,-11);

% demoniator
\node[ball,text width=0.39cm,fill=blue!40,anchor=base] (ncan) at (6.5,-11.5) {};
\node[ball,text width=0.05cm,fill=red!70,anchor=base] (can2) at (5.5,-11.5) {};

% plus sign in denominator
\draw[thick] (5.9,-11.4) -- (5.9,-11.6);
\draw[thick] (5.8,-11.5) -- (6,-11.5);

% arrows showing the output of the sieves formed the fraction
\draw[->,thick,draw=red!80] (tray1.south) to [out=280,in=180] (can);
\draw[->,thick,draw=red!80] (tray1.south) to [out=280,in=180] (can2);
\node[anchor=north,inner sep=.1cm,align=center,fill=white] (why2) at
   (3.8,-9.8) {$1\% * 80\%$};

\draw[->,thick,draw=blue!50] (tray2.south) to [out=265,in=0] (ncan);
\node[anchor=north,inner sep=.1cm,align=center,fill=white] (why2) at
   (8.4,-9.8) {$99\% * 9.6\%$};

% explanation of final formula
\node[anchor=north west,text width=6.5cm] (note2) at (-6,-12.5)
   {Finally, to find the probability that a positive test
       \emph{actually means cancer}, we look at those who passed
       through the sieve \emph{with cancer}, and divide by all who
       received a positive test, cancer or not.}; 

% illustrated fraction turned into math
\node[anchor=north,text width=10cm] (solution) at (6,-12.5) {
  \begin{align*}
      \frac{\p(\testp\mid\cancer)}{\p(\testp\mid\cancer)
        + \p(\testp\mid{\sim}\cancer)} &= \\
      \frac{1\% * 80\%}{(1\% * 80\%) + (99\% * 9.6\%)} &= 7.8\%
        = \p(\cancer\mid\testp)
   \end{align*}};
\end{tikzpicture}
\end{document}

```

## Tip 2: Flow chart

Source: http://www.texample.net/tikz/examples/assignment-structure/

```
\documentclass{minimal}
\usepackage{tikz}
\usetikzlibrary{calc,trees,positioning,arrows,chains,shapes.geometric,%
    decorations.pathreplacing,decorations.pathmorphing,shapes,%
    matrix,shapes.symbols}

\tikzset{
>=stealth',
  punktchain/.style={
    rectangle, 
    rounded corners, 
    % fill=black!10,
    draw=black, very thick,
    text width=10em, 
    minimum height=3em, 
    text centered, 
    on chain},
  line/.style={draw, thick, <-},
  element/.style={
    tape,
    top color=white,
    bottom color=blue!50!black!60!,
    minimum width=8em,
    draw=blue!40!black!90, very thick,
    text width=10em, 
    minimum height=3.5em, 
    text centered, 
    on chain},
  every join/.style={->, thick,shorten >=1pt},
  decoration={brace},
  tuborg/.style={decorate},
  tubnode/.style={midway, right=2pt},
}
\begin{document}
\begin{tikzpicture}
  [node distance=.8cm,
  start chain=going below,]
     \node[punktchain, join] (intro) {Introduktion};
     \node[punktchain, join] (probf)      {Problemformulering};
     \node[punktchain, join] (investeringer)      {Investeringsteori};
     \node[punktchain, join] (perfekt) {Det perfekte kapitalmarked};
     \node[punktchain, join, ] (emperi) {Emperi};
      \node (asym) [punktchain ]  {Asymmetrisk information};
      \begin{scope}[start branch=venstre,
        %We need to redefine the join-style to have the -> turn out right
        every join/.style={->, thick, shorten <=1pt}, ]
        \node[punktchain, on chain=going left, join=by {<-}]
            (risiko) {Risiko og gamble};
      \end{scope}
      \begin{scope}[start branch=hoejre,]
      \node (finans) [punktchain, on chain=going right] {Det finansielle system};
    \end{scope}
  \node[punktchain, join,] (disk) {Det imperfekte finansielle marked};
  \node[punktchain, join,] (makro) {InvesteringsmÃ¦ssige konsekvenser};
  \node[punktchain, join] (konk) {Konklusion};
  % Now that we have finished the main figure let us add some "after-drawings"
  %% First, let us connect (finans) with (disk). We want it to have
  %% square corners.
  \draw[|-,-|,->, thick,] (finans.south) |-+(0,-1em)-| (disk.north);
  % Now, let us add some braches. 
  %% No. 1
  \draw[tuborg] let
    \p1=(risiko.west), \p2=(finans.east) in
    ($(\x1,\y1+2.5em)$) -- ($(\x2,\y2+2.5em)$) node[above, midway]  {Teori};
  %% No. 2
  \draw[tuborg, decoration={brace}] let \p1=(disk.north), \p2=(makro.south) in
    ($(2, \y1)$) -- ($(2, \y2)$) node[tubnode] {Analyse};
  %% No. 3
  \draw[tuborg, decoration={brace}] let \p1=(perfekt.north), \p2=(emperi.south) in
    ($(2, \y1)$) -- ($(2, \y2)$) node[tubnode] {Problemfelt};
  \end{tikzpicture}
\end{document}
```

## Tip 3: Smart diagram (Bubble)

Source: http://www.texample.net/tikz/examples/smart-bubbles/

```
\documentclass[border=10pt]{standalone}
\usepackage{smartdiagram}
\usepackage{metalogo}
% \usepackage{dtklogos} % not necessary
\begin{document}
\smartdiagram[bubble diagram]{TeX engines,
  TeX (dvi), pdfTeX, XeTeX, LuaTeX, ConTeXt}
\end{document}

```

## Tip 5

For a gallery of almost all possible TeX graphics visit http://www.texample.net/tikz/examples/tag/diagrams/ plus the site: http://www.texample.net/ has links to several forums and webblog resources that contain innumerable gems.

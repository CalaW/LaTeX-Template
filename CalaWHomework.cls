\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{CalaWHomework}[2024/12/26 Homework class by CalaW]

\RequirePackage{kvoptions}

\DeclareBoolOption{minted}
\DeclareBoolOption{draft}
\DeclareBoolOption{stix}
\DeclareBoolOption{en}
\DeclareBoolOption{xiaosi}

\ProcessKeyvalOptions*

\ifCalaWHomework@draft
  \PassOptionsToClass{draft}{ctexart}
\fi
\PassOptionsToPackage{no-math}{fontspec} % fontspec will override math font, so must set no-math option

\ifCalaWHomework@en
  \LoadClass[a4paper, 11pt]{article}
\else
  \ifCalaWHomework@xiaosi
    \LoadClass[fontset=none, zihao=-4, sub3section]{ctexart}
  \else
    \LoadClass[fontset=none, zihao=5, sub3section]{ctexart}
  \fi
\fi

\def\headertitle#1{\def\@headertitle{#1}}
\headertitle{\@title}
\def\classname#1{\def\@classname{#1}}
\classname{\@title}
\def\homeworkname#1{\def\@homeworkname{#1}}
\homeworkname{}

\RequirePackage{amsmath}
% \RequirePackage{amssymb}

% proof, lemma, theorem
\RequirePackage{amsthm}
\renewenvironment{proof}[1][\proofname]{\par
  \pushQED{\qed}%
  \normalfont \topsep6\p@\@plus6\p@\relax
  \trivlist
  \item\relax
  {\bfseries % change to bold proof
    #1\@addpunct{.}}\hspace\labelsep\ignorespaces
}{%
  \popQED\endtrivlist\@endpefalse
}

\def\@slname{解}
\def\slname#1{\renewcommand\@slname{#1}}

\@ifundefined{solution}{
  \newenvironment{solution}
  {
    \proof[\@slname]
  }
  {
    % no qed symbol in solution env
    \renewcommand{\qedsymbol}{}
    \endproof
  }
}{}

\ifCalaWHomework@en
  \def\@ansname{\textmd{\emph{Answer}}}
\else
  \def\@ansname{答}
\fi
\def\ansname#1{\renewcommand\@ansname{#1}}

\@ifundefined{answer}{
  \newenvironment{answer}
  {
    \proof[\@ansname]
  }
  {
    % no qed symbol in answer env
    \renewcommand{\qedsymbol}{}
    \endproof
  }
}{}

% provide dcases environment
\RequirePackage{mathtools}

% unicode math, need to be loaded after mathtools
% supress warnings related to mathtools
\RequirePackage[
  warnings-off={mathtools-colon,mathtools-overbracket},
  partial=upright,]
{unicode-math}
\DeclareRobustCommand\bm[1]{{\symbfit{##1}}}%
\DeclareRobustCommand\boldsymbol[1]{{\symbfit{##1}}}%
\newcommand\square{\mdlgwhtsquare}%
\newcommand\blacksquare{\mdlgblksquare}% 

% type SI units, angles, numbers, etc.
% need to be loaded after unicode-math
\RequirePackage{siunitx}
\sisetup{
  separate-uncertainty = true, % separate uncertainty from value with \pm
  inter-unit-product = \ensuremath{{}\cdot{}}, % display dot between units
  % detect-mode, % uncomment this if want to use text font in text mode
}

% adjusting page dimensions and margins
\RequirePackage{geometry}
\geometry{a4paper,left=2cm,right=2cm,top=2cm,bottom=2cm}

% customising headers and footers
\usepackage{fancyhdr}
\pagestyle{fancy} % use fancy style to enable custom headers and footers
\fancyhead[L]{\small\@headertitle}
\fancyhead[C]{}
\fancyhead[R]{\small cc24@mails.tsinghua.edu.cn}
\fancyfoot[L,R]{}
\fancyfoot[C]{\small --\ \thepage\ --}

% customize the title
\renewcommand{\maketitle}{
  \vspace*{5pt} % vertical whitespace before the title
  \begin{flushleft} % left align
    {\LARGE\sffamily\bfseries\@classname} % class name, in Bold Sans
    % {\LARGE\CJKfamily{heavyhei}\@classname} % use heavy weight
    \par \vspace{5pt} \par
    {\large\sffamily\bfseries\@homeworkname} % homework name, in Bold Sans
    \par \vspace{15pt} \par
    {\@author}\\ % author name
    {\small\@date} % date
    \par \vspace{30pt} % vertical whitespace below the title
  \end{flushleft}
  \FloatBarrier
}

% floats
\RequirePackage{float} % [H] option
\RequirePackage{placeins} % \FloatBarrier
\RequirePackage{caption}

% figures
\RequirePackage{graphicx}

% tables
\RequirePackage{booktabs}

% color
\RequirePackage{xcolor}

% code listing
\ifCalaWHomework@minted
  \ifCalaWHomework@draft
    \PassOptionsToPackage{draft}{minted}
  \fi
  \RequirePackage{minted}
  \definecolor{bg}{rgb}{0.95,0.95,0.95}
  \setminted{breaklines, linenos, bgcolor=bg, frame=lines, fontsize=\small}
  \setmintedinline{bgcolor={}, fontsize=\normalsize}
\fi

% smart quote Causing quote width problems, all use fullwidth in Chinese.
% \RequirePackage[autostyle]{csquotes}
% \MakeAutoQuote{“}{”}

% fonts
\newcommand\calaw@set@font@stix{%
  % \setmainfont{STIX Two Text}[Scale=MatchLowercase]%
  \setmainfont{STIX Two Text}%
  \setsansfont{Helvetica Neue}%
  \setmonofont{SF Mono}%
}
\newcommand\calaw@set@math@font@stix{%
  \setmathfont{STIX Two Math}[
    Scale = MatchLowercase,
    % StylisticSet = \thu@xits@integral@stylistic@set,
  ]%
  \setmathfont{STIX Two Math}[
    Scale = MatchLowercase,
    StylisticSet = 1,
    range = {scr,bfscr},
  ]%
}
% use new computer modern math font
% \PassOptionsToPackage{warnings-off={mathtools-colon,mathtools-overbracket}}{unicode-math} % supress warning
% \PassOptionsToPackage{no-math}{fontspec} % fontspec will override math font, so must set no-math option
\ifCalaWHomework@stix
  % TODO use stix2 font
  % \AtEndPreamble{
  \calaw@set@font@stix
  \calaw@set@math@font@stix
  % }
  % \RequirePackage[stixtwo]{fontsetup}
\else
  \RequirePackage[libertinus]{fontsetup}
\fi
% \RequirePackage[default]{fontsetup}
\ifCalaWHomework@en
  \setmainfont{Libertinus Serif}
  \setsansfont{Helvetica Neue}
  % \setsansfont{Libertinus Sans}
  \setmonofont{SF Mono}
\else
  % Source/Noto CJK family
  \setCJKmainfont{Source Han Serif SC}
  \setCJKsansfont{Source Han Sans SC}
  \setCJKmonofont{Source Han Mono SC}
  % heavy weight family
  \setCJKfamilyfont{heavysong}{Source Han Serif SC Heavy}
  \setCJKfamilyfont{heavyhei}{Source Han Sans SC Heavy}
  % Source/Noto Han family
  \setmainfont{Source Han Serif SC}
  \setmainfont{Libertinus Serif}[Scale = MatchUppercase]
  \setsansfont{Helvetica Neue}[Scale = MatchUppercase]
  % \setsansfont{Source Han Sans SC}
  % \setmonofont{Source Han Mono SC}
  % Source family
  % \setmainfont{Source Serif 4}
  % \setsansfont{Source Sans 3}
  \setmonofont{Source Code Pro}
\fi

\RequirePackage{xstring}
% \emfontdeclare{\kaishu\itshape}
% \strongfontdeclare{\heiti\bfseries}

\RequirePackage{CalaWMath}

% hyperref
\RequirePackage[hidelinks]{hyperref}

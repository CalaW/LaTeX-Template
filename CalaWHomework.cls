\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{CalaWHomework}[2023/02/17 Homework class by CalaW]

\RequirePackage{kvoptions}

\DeclareBoolOption{minted}
\DeclareBoolOption{draft}

\ProcessKeyvalOptions*

\ifCalaWHomework@draft
  \PassOptionsToClass{draft}{ctexart}
\fi
\LoadClass[fontset=none, zihao=5, sub3section]{ctexart}

\def\headertitle#1{\def\@headertitle{#1}}
\headertitle{\@title}
\def\classname#1{\def\@classname{#1}}
\classname{\@title}
\def\homeworkname#1{\def\@homeworkname{#1}}
\homeworkname{}

\RequirePackage{amsmath}
\RequirePackage{amssymb}

% proof, lemma, theorem
\RequirePackage{amsthm}
\renewenvironment{proof}[1][\proofname]{\par
  \pushQED{\qed}%
  \normalfont \topsep6\p@\@plus6\p@\relax
  \trivlist
  \item\relax
  {\bfseries % change to bold 证明
    #1\@addpunct{.}}\hspace\labelsep\ignorespaces
}{%
  \popQED\endtrivlist\@endpefalse
}

% provide dcases environment
\RequirePackage{mathtools}

% unicode math, need to be loaded after mathtools
% supress warnings related to mathtools
\RequirePackage[warnings-off={mathtools-colon,mathtools-overbracket}]{unicode-math}

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
\fancyhead[R]{\small chen-che20@mails.tsinghua.edu.cn}
\fancyfoot[L,R]{}
\fancyfoot[C]{\small --\ \thepage\ --}

% customize the title
\renewcommand{\maketitle}{
  \vspace*{5pt} % vertical whitespace before the title
  \begin{flushleft} % left align
    {\LARGE\sffamily\bfseries\@classname} % class name, in Bold Sans
    % {\LARGE\CJKfamily{heavyhei}\@classname} % use heavy weight

    \vspace{5pt}

    {\large\sffamily\bfseries\@homeworkname} % homework name, in Bold Sans

    \vspace{15pt}

    {\@author}\\ % author name
    {\small\@date} % date

    \vspace{30pt} % vertical whitespace below the title
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
% use new computer modern math font
% \PassOptionsToPackage{warnings-off={mathtools-colon,mathtools-overbracket}}{unicode-math} % supress warning
\PassOptionsToPackage{no-math}{fontspec} % fontspec will override math font, so must set no-math option
\ifCalaWHomework@draft\else
  \RequirePackage[default]{fontsetup}
\fi
% Source/Noto CJK family
\setCJKmainfont{Source Han Serif SC}
\setCJKsansfont{Source Han Sans SC}
\setCJKmonofont{Source Han Mono SC}
% heavy weight family
\setCJKfamilyfont{heavysong}{Source Han Serif SC Heavy}
\setCJKfamilyfont{heavyhei}{Source Han Sans SC Heavy}
% Source/Noto Han family
\setmainfont{Source Han Serif SC}
\setsansfont{Source Han Sans SC}
% \setmonofont{Source Han Mono SC}
% Source family
% \setmainfont{Source Serif 4}
% \setsansfont{Source Sans 3}
\setmonofont{Source Code Pro}
% \setmonofont{MonoLisa}
% \setmonofont{MesloLGS Nerd Font Mono}
% \setmonofont{Hacc}
% \setmathfont{STIX Two Math}
% \setmathrm{STIX Two Text}
% \setmathfont{NewCMMath-Book.otf}
% \setmathrm{NewCMMath-Book.otf}
% \setmathfont{Latin Modern Math}
% \setmathrm{Latin Modern Roman}
% \setmathfont{latinmodern-math}[Extension=.otf]%
% \setmathrm{lmroman10}[
%   Extension      = .otf,
%   UprightFont    = *-regular,
%   BoldFont       = *-bold,
%   ItalicFont     = *-italic,
%   BoldItalicFont = *-bolditalic,
% ]%
% \setmathsf{lmsans10}[
%   Extension      = .otf,
%   UprightFont    = *-regular,
%   BoldFont       = *-bold,
%   ItalicFont     = *-oblique,
%   BoldItalicFont = *-boldoblique,
% ]%
% \setmathtt{lmmonolt10}[
%   Extension      = .otf,
%   UprightFont    = *-regular,
%   BoldFont       = *-bold,
%   ItalicFont     = *-oblique,
%   BoldItalicFont = *-boldoblique,
% ]%

% \setmathfont{NewCMMath-Book}[Extension=.otf]%
% \setmathfont{NewCMMath-Book}[
%   Extension    = .otf,
%   StylisticSet = 1,
%   range        = {scr,bfscr},
% ]%
% \setmathrm{NewCM10}[
%   Extension      = .otf,
%   UprightFont    = *-Book,
%   BoldFont       = *-Bold,
%   ItalicFont     = *-BookItalic,
%   BoldItalicFont = *-BoldItalic,
% ]%
% \setmathsf{NewCMSans10}[
%   Extension         = .otf,
%   UprightFont       = *-Book,
%   BoldFont          = *-Bold,
%   ItalicFont        = *-BookOblique,
%   BoldItalicFont    = *-BoldOblique,
% ]%
% \setmathtt{NewCMMono10}[
%   Extension           = .otf,
%   UprightFont         = *-Book,
%   ItalicFont          = *-BookItalic,
%   BoldFont            = *-Bold,
%   BoldItalicFont      = *-BoldOblique,
% ]%

% hyperref
\RequirePackage[hidelinks]{hyperref}
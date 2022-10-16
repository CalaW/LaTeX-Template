\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{CalaWHomework}[2022/10/14 Homework class by CalaW]

\RequirePackage{kvoptions}

\DeclareBoolOption{minted}

\ProcessKeyvalOptions*

\LoadClass[fontset=none, zihao=5]{ctexart}

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

\RequirePackage{graphicx}
\RequirePackage{subfig}
\RequirePackage{float}
\RequirePackage{caption}

% type SI units, angles, numbers, etc.
\RequirePackage{siunitx}
\sisetup{
    separate-uncertainty = true, % separate uncertainty from value with \pm
    inter-unit-product = \ensuremath{{}\cdot{}} % display dot between units
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
}

% color
\RequirePackage{xcolor}

% code listing
\ifCalaWHomework@minted
  \RequirePackage{minted}
  \definecolor{bg}{rgb}{0.95,0.95,0.95}
\fi

% smart quote Causing quote width problems, all use fullwidth in Chinese.
% \RequirePackage[autostyle]{csquotes}
% \MakeAutoQuote{“}{”}

% fonts
% use new computer modern math font
\PassOptionsToPackage{warnings-off={mathtools-colon,mathtools-overbracket}}{unicode-math} % supress warning
\PassOptionsToPackage{no-math}{fontspec}
\RequirePackage[default]{fontsetup}
% Source/Noto CJK family
\setCJKmainfont{Source Han Serif SC}[Color=brown]
\setCJKsansfont{Source Han Sans SC}[Color=grey]
\setCJKmonofont{Source Han Mono SC}[Color=orange]
% heavy weight family
\setCJKfamilyfont{heavysong}{Source Han Serif SC Heavy}
\setCJKfamilyfont{heavyhei}{Source Han Sans SC Heavy}
% Source/Noto Han family
\setmainfont{Source Han Serif SC}[Color=red]
\setsansfont{Source Han Sans SC}
% \setmonofont{Source Han Mono SC}
% Source family
% \setmainfont{Source Serif 4}[Color=red]
% \setsansfont{Source Sans 3}
\setmonofont{Source Code Pro}[Color=blue]

% hyperref
\RequirePackage[hidelinks]{hyperref}
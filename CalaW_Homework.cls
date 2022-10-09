\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{CalaW_Homework}[2022/10/08 Homework class by CalaW]

\LoadClass[fontset=none]{ctexart}

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

% bold italic
\RequirePackage{bm}

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

% \usepackage{titlesec}
% \setcounter{secnumdepth}{4}
% \titleformat{\section}[block]{\large\bfseries}{\arabic{section}.}{1em}{}[]
% \titleformat{\subsection}[block]{\normalsize\bfseries}{\arabic{section}.\arabic{subsection}}{1em}{}[]
% \titleformat{\subsubsection}[block]{\normalsize\bfseries}{\arabic{section}.\arabic{subsection}.\arabic{subsubsection}}{1em}{}[]
% \titleformat{\paragraph}[block]{\normalsize\bfseries}{\arabic{paragraph}}{1em}{}[]

% customising headers and footers
\usepackage{fancyhdr}
\pagestyle{fancy} % use fancy style to enable custom headers and footers
\fancyhead[L]{\small\@headertitle}
\fancyhead[C]{}
\fancyhead[R]{\small chen-che20@mails.tsinghua.edu.cn}
\fancyfoot[L,R]{}
\fancyfoot[C]{--\ \thepage\ --}

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

\RequirePackage[default]{fontsetup} % use new computer modern math font
\setCJKmainfont{Source Han Serif SC} % Source/Noto CJK family
\setCJKsansfont{Source Han Sans SC}
\setCJKmonofont{Source Han Mono SC}
\setCJKfamilyfont{heavysong}{Source Han Serif SC Heavy} % heavy weight family
\setCJKfamilyfont{heavyhei}{Source Han Sans SC Heavy}
\setmainfont{Source Han Serif SC} % Source/Noto Han family
\setsansfont{Source Han Sans SC}
\setmonofont{Source Han Mono SC}
% \setmainfont{Source Serif 4} % Source family
% \setsansfont{Source Sans 3}
% \setmonofont{Source Code Pro}
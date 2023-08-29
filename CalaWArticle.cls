\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{CalaWArticle}[2023/08/29 Statement class by CalaW]

\RequirePackage{kvoptions}

\DeclareBoolOption{stix}

\ProcessKeyvalOptions*

\LoadClass[fontset=none, zihao=-4, sub3section]{ctexart}

\def\headertitle#1{\def\@headertitle{#1}}
\headertitle{\@title}
\def\classname#1{\def\@classname{#1}}
\classname{\@title}
\def\homeworkname#1{\def\@homeworkname{#1}}
\homeworkname{}

\RequirePackage{amsmath}

% adjusting page dimensions and margins
\RequirePackage{geometry}
\geometry{
  a4paper,
  hcentering,
  textwidth=39\ccwd,
  top=2cm,
  bottom=2cm
}

% customising headers and footers
\usepackage{fancyhdr}
\pagestyle{fancy} % use fancy style to enable custom headers and footers
\fancyhead[L,C,R]{}
\renewcommand{\headrulewidth}{0pt}
\fancyfoot[L,R]{}
\fancyfoot[C]{\small --\ \thepage\ --}

% customize the title
\renewcommand{\maketitle}{
  % \vspace*{5pt} % vertical whitespace before the title
  \begin{flushleft} % left align
    {\LARGE\sffamily\bfseries\@classname} % class name, in Bold Sans
    % {\LARGE\CJKfamily{heavyhei}\@classname} % use heavy weight
    \par \vspace{5pt} \par
    {\@author}\\ % author name
    {\small\@date} % date
    % \par \vspace{30pt} % vertical whitespace below the title
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

% smart quote Causing quote width problems, all use fullwidth in Chinese.
% \RequirePackage[autostyle]{csquotes}
% \MakeAutoQuote{“}{”}

% fonts
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

\RequirePackage{xstring}

% hyperref
\RequirePackage[hidelinks]{hyperref}

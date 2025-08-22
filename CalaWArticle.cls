\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{CalaWArticle}[2025/08/23 Statement class by CalaW]

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
  textwidth=33\ccwd,
  top=3cm,
  bottom=3cm
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
  \vspace*{20pt} % vertical whitespace before the title
  \begin{centering} % left align
    {\LARGE\sffamily\bfseries\@classname} % class name, in Bold Sans
    % {\LARGE\CJKfamily{heavyhei}\@classname} % use heavy weight
    \par \vspace{5pt} \par
    {\@author}\\ % author name
    {\small\@date} % date
    \par \vspace{5pt} % vertical whitespace below the title
  \end{centering}
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
\setCJKmainfont{Source Han Serif SC}[ ItalicFont  = 方正楷体_GBK, ]
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

\RequirePackage{titlesec}

\titleformat{\section}         % Customise the \section command 
{\large\sffamily\bfseries\raggedright} % Make the \section headers large (\Large), small capitals (\scshape) and left aligned (\raggedright)
{\thesection}{1\ccwd}                      % Can be used to give a prefix to all sections, like 'Section ...'
{}                           % Can be used to insert code before the heading

\titleformat{\subsection}         % Customise the \subsection command 
{\normalsize\sffamily\bfseries\raggedright} % Make the \subsection headers large (\Large), small capitals (\scshape) and left aligned (\raggedright)
{\thesubsection}{1\ccwd}                      % Can be used to give a prefix to all sections, like 'Section ...'
{}                           % Can be used to insert code before the heading

% hyperref
\RequirePackage[hidelinks]{hyperref}

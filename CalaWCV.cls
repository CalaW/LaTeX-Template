% This is a simple CV class wrote by CalaW
% Inspired by https://github.com/billryan/resume
% and Prof. Chen Chong's CV (https://cc458.github.io)

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{CalaWCV}[2023/02/11 simple CV class wrote by CalaW]

\RequirePackage{kvoptions}

\DeclareBoolOption{zh}
\DeclareBoolOption{fangzhengfree}
\DeclareBoolOption{fangzheng}

\ProcessKeyvalOptions*

\RequirePackage{xifthen}


\ifCalaWCV@zh
  \LoadClass[a4paper]{article}
  \RequirePackage[fontset=none, zihao=5]{ctex}
\else
  \LoadClass[a4paper, 11pt]{article}
\fi

\pagestyle{empty}

% disable indent globally
\setlength{\parindent}{0pt}

\RequirePackage{geometry}
% \ifCalaWCV@zh
%   \geometry{
%     a4paper,
%     hcentering,
%     textwidth=42\ccwd,
%     top=0.7in,
%     bottom=0.55in
%   }
% \else
  \geometry{a4paper,left=0.8in,right=0.8in,top=0.7in,bottom=0.55in}
% \fi

% BibLaTeX
% \RequirePackage[style=ieee]{biblatex}

% use xcolor to define colors
\RequirePackage{xcolor}
\definecolor{classicblue}{RGB}{15,76,129} % pantone classic blue
\definecolor{vivamagenta}{RGB}{190,52,85} % pantone vivamagenta
\definecolor{tsinghuapurple}{RGB}{102,8,116} % tsinghua purple
\colorlet{maincolor}{classicblue}

% package for customising section headings
\RequirePackage{titlesec}

% package to customize lists
\RequirePackage{enumitem}
\setlist{noitemsep} % removes spacing from items but leaves space around the whole list
%\setlist{nosep} % removes all vertical spacing within and around the list
\setlist[itemize]{topsep=0.25em, leftmargin=1.5pc}
\setlist[enumerate]{topsep=0.25em, leftmargin=1.5pc}

% nth package
\RequirePackage[super]{nth}

% use fontspec to define fonts
\RequirePackage{fontspec}
\newcommand\calaw@set@font@times{%
  \setmainfont{Times New Roman}[Scale = MatchUppercase]%
  \setsansfont{Helvetica Neue}%
  \setmonofont{SF Mono}%
}
\newcommand\calaw@set@font@garamond{%
  \setmainfont{GaramondPremrPro}[Scale = MatchUppercase]%
  \setsansfont{Helvetica Neue}%
  \setmonofont{SF Mono}%
}
\newcommand\calaw@set@font@libertine{%
  \setmainfont{Linux Libertine}[Scale = MatchUppercase]%
  % \setmainfont{Joanna Nova}[Scale = MatchUppercase, BoldFont = * Medium]%
  \setsansfont{Helvetica Neue}%
  \setmonofont{SF Mono}%
}
\newcommand\calaw@set@font@source{%
  \setmainfont{SourceSerif4}[
    Scale = MatchUppercase,
    UprightFont = *-Light,
    ItalicFont = *-LightIt,
    BoldFont    = *-Semibold,
    BoldItalicFont = *-SemiboldIt,
  ]%
  \setsansfont{Source Sans 3}%
  \setmonofont{Source Code Pro}%
}
\newcommand\calaw@set@font@stix{%
  \setmainfont{STIX Two Text}
  \setsansfont{Helvetica Neue}%
  \setmonofont{SF Mono}%
}
\newcommand\calaw@set@cjk@font@source{%
  \setCJKmainfont{Source Han Serif SC}[
    UprightFont = * Light,
    BoldFont    = * Bold,
    ItalicFont  = 方正楷体_GBK,
  ]%
  \setCJKsansfont{Source Han Sans SC}[BoldFont = * Medium]%
  \setCJKmonofont{Source Han Mono SC}%
  \setCJKfamilyfont{zhsong}{Source Han Serif SC}[
    UprightFont    = * Light,
    UprightFont    = * Bold,
  ]%
  \setCJKfamilyfont{zhhei}{Source Han Sans SC}[BoldFont = * Medium]%
  \setCJKfamilyfont{zhfs}{方正仿宋 GBK}%
  \setCJKfamilyfont{zhkai}{方正楷体_GBK}%
}
\newcommand\calaw@set@cjk@font@customsource{%
  \setmainfont{思源宋体}
  \setCJKmainfont{思源宋体}[
    % UprightFont = * Light,
    % BoldFont    = * Bold,
    ItalicFont  = 方正聚珍新仿 GBK,
  ]%
  \setCJKsansfont{苹方-简}%
  \setCJKmonofont{思源等宽}%
  \setCJKfamilyfont{zhsong}{思源宋体}[
    UprightFont    = * Light,
    BoldFont       = * Bold,
  ]%
  \setCJKfamilyfont{zhhei}{思源黑体}[BoldFont = * Medium]%
  \setCJKfamilyfont{zhfs}{方正聚珍新仿 GBK}%
  \setCJKfamilyfont{zhkai}{方正楷体_GBK}%
}
\newcommand\calaw@set@cjk@font@fz{%
  \setCJKmainfont{方正书宋_GBK}[
    BoldFont = 方正黑体_GBK,
    ItalicFont  = 方正楷体_GBK,
  ]%
  \setCJKsansfont{方正黑体_GBK}%
  \setCJKmonofont{方正黑体_GBK}%
  \setCJKfamilyfont{zhsong}{方正书宋_GBK}%
  \setCJKfamilyfont{zhhei}{方正黑体_GBK}%
  \setCJKfamilyfont{zhfs}{方正仿宋_GBK}%
  \setCJKfamilyfont{zhkai}{方正楷体_GBK}%
}
\newcommand\calaw@set@cjk@font@fznonfree{%
  \setCJKmainfont{方正新书宋_GBK}[
    ItalicFont = 方正聚珍新仿 GBK,
  ]%
  \setCJKsansfont{苹方-简}%
  \setCJKmonofont{苹方-简}%
  \setCJKfamilyfont{zhsong}{方正新书宋_GBK}%
  \setCJKfamilyfont{zhhei}{苹方-简}%
  \setCJKfamilyfont{zhfs}{方正聚珍新仿 GBK}%
  \setCJKfamilyfont{zhkai}{方正楷体_GBK}%
}
\newcommand\calaw@set@cjk@font@fzyou{%
  \setCJKmainfont{方正悠宋+ GBK}[
    UprightFont = * 507R,
    ItalicFont = 方正聚珍新仿 GBK,
  ]%
  \setCJKsansfont{苹方-简}%
  \setCJKmonofont{苹方-简}%
  \setCJKfamilyfont{zhsong}{方正新书宋_GBK}%
  \setCJKfamilyfont{zhhei}{苹方-简}%
  \setCJKfamilyfont{zhfs}{方正聚珍新仿 GBK}%
  \setCJKfamilyfont{zhkai}{方正楷体_GBK}%
}
\ifCalaWCV@zh
  % \calaw@set@cjk@font@fz%
  \calaw@set@cjk@font@customsource%
  \calaw@set@font@libertine%
  % % \setmainfont{Source Han Serif SC}
  % \setCJKmainfont{Source Han Serif SC}
  % \setCJKsansfont{Source Han Sans SC}
  % \setCJKmonofont{Source Han Mono SC}
  % \setmainfont{Source Han Serif SC}
  % \setsansfont{Source Han Sans SC}
  % \setmonofont{Source Code Pro}
  % \newcommand{\useEnFontForLatin}{\setmainfont{Source Serif 4}\setsansfont{Source Sans 3}}
  % \newcommand{\useZhFontForLatin}{\setmainfont{Source Han Serif SC}\setsansfont{Source Han Sans SC}}
\else
  % \setmainfont{GaramondPremrPro}
  % \setmainfont{Linux Libertine}
  \setmainfont{Libertinus Serif}
  % \setmainfont{Joanna Nova}%
  \setsansfont{Helvetica Neue}
  \setmonofont{SF Mono}
\fi

% use fontawesome6 icons
\RequirePackage{fontawesome6}

% hyperref
\RequirePackage[hidelinks]{hyperref}


\titleformat{\section}         % Customise the \section command 
{\ifCalaWCV@zh
  \large\sffamily\bfseries\raggedright\color{maincolor}
\else
  \Large\scshape\raggedright\color{maincolor}
\fi} % Make the \section headers large (\Large), small capitals (\scshape) and left aligned (\raggedright)
{}{0em}                      % Can be used to give a prefix to all sections, like 'Section ...'
{}                           % Can be used to insert code before the heading
[\color{maincolor}\titlerule]                 % Inserts a horizontal line after the heading
\titlespacing*{\section}{0cm}{*1.8}{*1.8}

\titleformat{\subsection}
{\normalsize\raggedright}
{}{0em}
{}
\titlespacing*{\subsection}{0cm}{*1.8}{*0.6}

\newcommand{\datedsection}[2]{%
  \section[#1]{#1 \hfill #2}%
}
\newcommand{\datedsubsection}[2]{%
  \subsection[#1]{#1 \hfill #2}%
}
\newcommand{\datedline}[2]{%
  {\par #1 \hfill #2 \par}%
}

% defines one's name
% usage: \name{<name>}
\newcommand{\name}[1]{%
\ifCalaWCV@zh
  \centerline{\huge\bfseries{#1}}%
\else
  % \centerline{\Huge\scshape{#1}}%
  \centerline{\setmainfont{GaramondPremrPro}\Huge\scshape{#1}}%
\fi
  \vspace{2ex}
}

% defines one's email
% usage: \email{<email>}
\newcommand{\email}[1]{\textbf{\faicon{square-envelope}}\ {\color{maincolor}\href{mailto:#1}{#1}}}
% defines one's phone
% usage: \phone{<phone>}
\newcommand{\phone}[1]{\textbf{\faicon{square-phone}}\ \textcolor{maincolor}{#1}}
\newcommand{\location}[1]{\textbf{\faicon{location-dot}}\ #1}
% defines one's linkedin
% usage: \linkedin{<linkedin>}
\newcommand{\linkedin}[2][]{\faicon{linkedin-in}\
  \ifthenelse{\isempty{#1}}%
  {\href{#2}{#2}}
  {\href{#2}{#1}}}
\newcommand{\linkedinsquare}[2][]{\faicon{linkedin}\
  \ifthenelse{\isempty{#1}}%
  {\href{#2}{#2}}
  {\href{#2}{#1}}}
% defines one's GitHub
% usage: \githublink{<github>}
\newcommand{\githubprofile}[2][]{\faicon{github}\
  \ifthenelse{\isempty{#1}}%
  {{\color{maincolor}\href{#2}{#2}}}
  {{\color{maincolor}\href{#2}{#1}}}}
% defines one's homepage
% usage: \homepage{<homepage>}
\newcommand{\homepage}[2][]{\textbf{\faicon{earth-asia}}\
  \ifthenelse{\isempty{#1}}%
  {{\color{maincolor}\href{#2}{#2}}}
  {{\color{maincolor}\href{#2}{#1}}}}

% icon links
\newcommand{\filepdf}[1]{\href{#1}{\textbf{\faicon{file-pdf}}}}
\newcommand{\orcid}[1]{\href{https://orcid.org/#1}{\faicon{orcid}}}
\newcommand{\github}[1]{\href{https://github.com/#1}{\faicon{github}}}

\newcommand{\basicInfo}[1]{
  \centerline{#1}
  \vspace{1.5ex}
}

\newcommand{\role}[2]{
  % {\par \textit{#1} ~ #2 \par}
  \ifCalaWCV@zh
    {\par \textit{#1}　#2 \par}
  \else
    {\par \textit{#1} ~ #2 \par}
  \fi
  % \vspace{0.85ex}
}

% This is a simple CV class wrote by CalaW
% Inspired by https://github.com/billryan/resume
% and Prof. Chen Chong's CV (https://cc458.github.io)

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{CalaWCV}[2023/02/11 simple CV class wrote by CalaW]

\RequirePackage{kvoptions}
% declare options
\ProcessKeyvalOptions*

\RequirePackage{xifthen}

\LoadClass[a4paper, 11pt]{article}
\pagestyle{empty}

% disable indent globally
\setlength{\parindent}{0pt}

\RequirePackage{geometry}
\geometry{a4paper,left=0.8in,right=0.8in,top=0.7in,bottom=0.55in}

% BibLaTeX
\RequirePackage[style=ieee]{biblatex}

% use xcolor to define colors
\RequirePackage{xcolor}
\definecolor{classicblue}{RGB}{15,76,129} % pantone classic blue
\definecolor{vivamagenta}{RGB}{190,52,85} % pantone vivamagenta
\definecolor{tsinghuapurple}{RGB}{102,8,116} % tsinghua purple
\colorlet{maincolor}{tsinghuapurple}

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
\setmainfont{GaramondPremrPro}
% \setmainfont{Source Serif 4}

% use fontawesome6 icons
\RequirePackage{fontawesome6}

% hyperref
\RequirePackage[hidelinks]{hyperref}


\titleformat{\section}         % Customise the \section command 
  {\Large\scshape\raggedright\color{maincolor}} % Make the \section headers large (\Large),
                               % small capitals (\scshape) and left aligned (\raggedright)
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
  \centerline{\Huge\scshape{#1}}%
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
  {\textit{#1} ~ #2 \par}
  % \vspace{0.85ex}
}

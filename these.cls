\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{these}[2015/09/26, Rachel's thesis]

\PassOptionsToClass{a4paper}{memoir}
\PassOptionsToClass{twoside}{memoir}
\PassOptionsToClass{openany}{memoir}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions*
\LoadClass{memoir}

%% Fonts
\RequirePackage[final,tracking=true]{microtype}

\RequirePackage{etoolbox}
\AtBeginEnvironment{quotation}{\small}

%% Others
\RequirePackage[francais]{babel}


%%%%%%%%%%%%%% Style
% \settypeblocksize{*}{31pc}{1.75}
\setulmarginsandblock{2.5cm}{3.5cm}{*}
\setlrmarginsandblock{3.5cm}{3cm}{*}
% \setmarginnotes{17pt}{51pt}{\onelineskip}
\setheadfoot{\onelineskip}{2\onelineskip}
\setheaderspaces{*}{2\onelineskip}{*}
\checkandfixthelayout

\makepagestyle{these}
\makeevenfoot{these}{\thepage}{}{}
\makeoddfoot{these}{}{}{\thepage}
\pagestyle{these}

%% Divisions style
\setsecnumdepth{subsection}
\renewcommand*{\beforepartskip}{\cleardoublepage\null\vfil}
\renewcommand*{\afterpartskip}{\vfil\newpage\setcounter{chapter}{0}\null\newpage}

\makechapterstyle{these}{
  \chapterstyle{default}
  \chapterstyle{article}%
  \renewcommand*{\thechapter}{\Roman{chapter}}
  \renewcommand*{\printchapternum}{% center number/title
    \chapnumfont \thechapter\space\space}%
  \renewcommand*{\printchapternonum}{\centering}
  \renewcommand*{\clearforchapter}{}% no new page
}
\chapterstyle{these}

\setsecheadstyle{\bfseries\large}
\renewcommand*{\thesection}{\arabic{section}}
\setsubsecheadstyle{\bfseries\normalsize}
\renewcommand*{\thesubsection}{\Alph{subsection}}


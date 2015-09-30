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

%\RequirePackage{etoolbox}
%\AtBeginEnvironment{quotation}{\small}
\let\quotetemp\quotation
\def\quotation{\quotetemp\small}
\let\versetemp\verse
\def\verse{\versetemp\small}

%% Others
\RequirePackage[francais]{babel}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{bookmark}

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
\renewcommand*{\afterpartskip}{\vfil\newpage%
  \setcounter{chapter}{0}%
  \renewcommand{\theHchapter}{\thepart.\thechapter}%
  \null\newpage}

\makechapterstyle{these}{
  \chapterstyle{default}
  \chapterstyle{article}%  
  \settowidth{\chapindent}{\chapnumfont 999}
  \renewcommand*{\thechapter}{\Roman{chapter}}
  \renewcommand*{\printchapternum}{\@hangfrom{\chapnumfont \thechapter.\quad}}
  \renewcommand*{\printchapternonum}{}
  \renewcommand*{\clearforchapter}{}% no new page
}
\chapterstyle{these}

\renewcommand*{\thepart}{\arabic{part}}
\setsecheadstyle{\bfseries\large}
\renewcommand*{\thesection}{\arabic{section}}
\setsubsecheadstyle{\bfseries\normalsize}
\renewcommand*{\thesubsection}{\Alph{subsection}}
\setsecnumformat{\csname the#1\endcsname.\quad}


%% TOC style
\renewcommand*{\cftpartname}{Partie }
\renewcommand\cftpartaftersnum{.}
\renewcommand{\cftchapterleader}{\hfill}
%\renewcommand\partnumberlinebox[2]{#2}

%% Bibliography
\RequirePackage[authoryear]{natbib}
\RequirePackage{multibib}
\newcites{antiques,modernes}{Auteurs antiques,Auteurs modernes}
\renewcommand{\@memb@bchap}{\section*{\bibname}\prebibhook}
\renewcommand{\prebibhook}{\small}

%% Helping pagination 
%\raggedbottom
\midsloppy

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

%% Others
\RequirePackage[british,francais]{babel}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{bookmark}
\RequirePackage{framed}

%%%%%%%%%%%%%% Style
% \settypeblocksize{*}{31pc}{1.75}
\setulmarginsandblock{2.5cm}{3.5cm}{*}
\setlrmarginsandblock{3.5cm}{3cm}{*}
% \setmarginnotes{17pt}{51pt}{\onelineskip}
\setheadfoot{\onelineskip}{2\onelineskip}
\setheaderspaces{*}{2\onelineskip}{*}
\checkandfixthelayout

%% Small fonts
\let\quotetemp\quotation
\def\quotation{\quotetemp\small}
\let\versetemp\verse
\def\verse{\versetemp\small}

%% Figure captions
\RequirePackage[font=small]{caption}
\renewcommand\@memmain@floats{%
  \counterwithout{figure}{chapter} 
  \counterwithout{table}{chapter}}             

%% Divisions style
\setsecnumdepth{subsection}
\renewcommand*{\beforepartskip}{\cleardoublepage\thispagestyle{quasiempty}\null\vfil}
\renewcommand*{\afterpartskip}{\vfil\newpage%
  \thispagestyle{empty}\null\newpage}
\counterwithin*{chapter}{part}

\makepagestyle{quasiempty}
\makeevenfoot{quasiempty}{\thepage}{}{}
\makeoddfoot{quasiempty}{}{}{\thepage}
\aliaspagestyle{chapter}{quasiempty}

\copypagestyle{these}{quasiempty}
\makechapterstyle{these}{
  \chapterstyle{dowding}
  \renewcommand*{\thechapter}{\Roman{chapter}}
  \renewcommand*{\printchapternum}{\centering\chapnumfont \thechapter}%
}
\chapterstyle{these}
\makepsmarks{these}{%
  \nouppercaseheads
  \clearplainmark{toc}
  \clearmark{part}\clearmark{chapter}\clearmark{section}\clearmark{subsection}
  \createmark{part}{left}{nonumber}{\partname\ }{. \ }
  \createmark{chapter}{right}{shownumber}{\@chapapp\ }{. \ }
}
\makeevenhead{these}{}{\itshape\small\leftmark}{}
\makeoddhead{these}{}{\itshape\small\rightmark}{}
\pagestyle{these}

\let\backtemp\backmatter
\renewcommand{\backmatter}{\markboth{}{}\backtemp}

\renewcommand*{\thepart}{\arabic{part}}
\setsecheadstyle{\itshape{}\large}
\renewcommand*{\thesection}{\arabic{section}}
\setsubsecheadstyle{\itshape\normalsize}
\renewcommand*{\thesubsection}{\Alph{subsection}}
\setsecnumformat{\csname the#1\endcsname.\quad}


%% TOC style
\renewcommand{\cftchapterbreak}{\addpenalty{-1000}} 
\renewcommand*{\cftpartname}{Partie }
\renewcommand\cftpartaftersnum{.}
\renewcommand{\cftchapterleader}{\hfill}
%\renewcommand\partnumberlinebox[2]{#2}

%% Bibliography
\RequirePackage[authoryear]{natbib}
\RequirePackage{multibib}
\newcites{antiques,modernes}{Auteurs antiques,Auteurs modernes}
\renewcommand{\@memb@bchap}{\section*{\bibname}\prebibhook}
\renewcommand{\prebibhook}{\small\markboth{Bibliographie}{\bibname}}

%% To move to the third and fourth cover
\newcommand{\thirdcover}{%
  \clearpage\pagestyle{empty}\cleartooddpage%
  \ifx \back@cover@layout \undefined%
  \else \back@cover@layout \fi%
}
\newcommand{\fourthcover}{\pagestyle{empty}\cleartoevenpage\setlength{\parindent}{0pt}
}

%% Abstract
\renewcommand{\abstract}{\textbf{\large\thetitle}\framed\abstractname\par\medskip\small}
\renewcommand{\endabstract}{\endframed}
    

%% Helping pagination 
%\raggedbottom
\midsloppy
\widowpenalty=20000
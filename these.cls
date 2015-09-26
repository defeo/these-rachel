\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{these}[2015/09/26, Rachel's thesis]

\PassOptionsToClass{a4paper}{memoir}
\PassOptionsToClass{twoside}{memoir}
\PassOptionsToClass{openany}{memoir}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions*
\LoadClass{memoir}

%% Fonts
%\RequirePackage[T1]{fontenc}
%\RequirePackage{textcomp}
%\renewcommand{\rmdefault}{pplx}
%\renewcommand{\sfdefault}{uop}  % Warning: Optima is not in texlive !
\RequirePackage[final,tracking=true]{microtype}
%\RequirePackage{xcolor}

%% Others


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
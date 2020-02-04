%%% ====================================================================
%%%  @LaTeX-file{
%%%     filename  = "examenDMS.cls",
%%%     author    = "André Montpetit"}
%%%  ====================================================================

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{examenDMS}[2016/03/30 Examen au DMS, UdeM]

\RequirePackage[utf8]{inputenc}
\RequirePackage{lmodern}
\RequirePackage[T1]{fontenc}
\RequirePackage[frenchb]{babel}

\newif\if@special
\@specialfalse
\DeclareOption{special}{\@specialtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass[twoside,11pt]{article}


\RequirePackage[vmargin={1.25cm,0.75cm},hmargin={2cm,1cm},includehead,includefoot]{geometry}


\RequirePackage{tabularx}
\RequirePackage{xcolor}
\RequirePackage{colortbl}

\RequirePackage{sectsty}
\allsectionsfont{\raggedright\sffamily}
\newcommand{\sectbox}[1]{\hspace*{-\parindent}%
\colorbox{gray!50}{%
\@tempdima=\linewidth%
\advance\@tempdima by-2.7pt%
\advance\@tempdima by-2\fboxsep%
\advance\@tempdima by-2\fboxrule%
\hspace*{2.7pt}\protect\parbox{\@tempdima}{%
\vspace*{\smallskipamount}%
\sffamily\Large #1%
\vspace*{\smallskipamount}}}\hspace*{-5pt}%
}
\sectionfont{\sectbox}

\RequirePackage[newitem,newenum]{paralist}

\RequirePackage{amssymb}
\RequirePackage{stmaryrd}

 \RequirePackage{amsmath}
\RequirePackage{mathtools}
\RequirePackage{amsthm}
\def\@thm#1#2#3{%
  \ifhmode\unskip\unskip\par\fi
  \normalfont
  \trivlist
  \let\thmheadnl\relax
  \let\thm@swap\@gobble
  \thm@notefont{\fontseries\bfdefault\upshape}%
  \thm@headpunct{.}% add period after heading
  \thm@headsep 5\p@ plus\p@ minus\p@\relax
  \thm@space@setup
  #1% style overrides
  \@topsep \thm@preskip               % used by thm head
  \@topsepadd \thm@postskip           % used by \@endparenv
  \def\@tempa{#2}\ifx\@empty\@tempa
    \def\@tempa{\@oparg{\@begintheorem{#3}{}}[]}%
  \else
    \refstepcounter{#2}%
    \def\@tempa{\@oparg{\@begintheorem{#3}{\csname the#2\endcsname}}[]}%
  \fi
  \@tempa
}

\newtheoremstyle{question}% name
  {3pt}%      Space above
  {3pt}%      Space below
  {\upshape}%         Body font
  {}%         Indent amount (empty = no indent, \parindent = para indent)
  {\bfseries}% Thm head font
  {\rule[-15pt]{0pt}{24pt}}%        Punctuation after thm head
  {\newline}%     Space after thm head: " " = normal interword space;
        %       \newline = linebreak
  {}%         Thm head spec (can be left empty, meaning `normal')

\theoremstyle{question}
\newtheorem{qst}{Question}

\if@special
  \RequirePackage{scalerel}
\fi


\RequirePackage{ifthen}
\newcounter{cnt}
\newcounter{limit}
%\newcommand*{\question}[3][0]{
%\setcounter{cnt}{0}
%\begin{qst}[#2]
%#3
%\end{qst}
%\newpage
%\whiledo {\value{cnt} < #1}
%{%
%  \null\newpage
%  \stepcounter {cnt}%
%}
%\ifthenelse{\isodd{\thepage}}%
%    {}%
%    {\null\newpage}%
%}
\newenvironment*{question}[2][0]{
\setcounter{cnt}{0}
\setcounter{limit}{#1}
\if@special
\fontsize{18}{22}\selectfont %grossit tout les caractères en 18 points avec un interligne de 22 points.
\bfseries
\fi
\qst[#2]
\if@special
\bfseries %met tout le texte en gras;
\mathversion{bold} %met toutes les formules en gras;
\fi}
{\endqst
\newpage
\whiledo {\value{cnt} < \value{limit}}
{%
  \null\newpage
  \stepcounter {cnt}%
}
\ifthenelse{\isodd{\thepage}}%
    {}%
    {\null\newpage}%
}

\RequirePackage{lastpage}
\newcommand*{\ps@examen}{%
 \renewcommand{\@oddhead}{\small\sffamily\sCOURS\hfil INITIALES: \rule{2cm}{.5pt}}
 \renewcommand{\@oddfoot}{\null\hfil\small\sffamily Page \thepage{} de \pageref{LastPage}}
 \renewcommand{\@evenhead}{\small\sffamily INITIALES: \rule{2cm}{.5pt}\hfill\sCOURS}
 \renewcommand{\@evenfoot}{\small\sffamily Page \thepage{} de \pageref{LastPage}\hfill}
}

\newcommand*{\dateEXAMEN}[1]{\def\dEXAMEN{#1}}
\newcommand*{\heureEXAMEN}[2]{\def\hEXAMEN{#1}  \def\hhEXAMEN{#2}}
\newcommand*{\sigleCOURS}[1]{\def\sCOURS{#1}}
\newcommand*{\titreCOURS}[1]{\def\tCOURS{\MakeUppercase{#1}}}
\newcommand*{\professeur}[2][Professeur]{\def \profword{\MakeUppercase{#1}} \def\prof{\MakeUppercase{#2}}}

\newcommand{\rems}{}
\newcommand{\directive}[1]{
 \ifx\@empty\rems
    \gdef\rems{\item #1}%
  \else
    \g@addto@macro\rems{\item #1}%
   \fi
   }

\renewcommand{\maketitle}{\bgroup
\sffamily
\thispagestyle{empty}
\setlength{\parindent}{0pt}
\setcounter{page}{-1}

{\centering
{\bfseries\Large DÉPARTEMENT DE MATHÉMATIQUES ET DE STATISTIQUE}\\[.5cm]
{\bfseries\large CAHIER D'EXAMEN}
\par}

\bigskip\bigskip
\begin{minipage}[t]{14.2cm}
\vspace*{-2.425in}
\section*{IDENTIFICATION DE L'ÉTUDIANT}

\begin{tabularx}{\linewidth}{|l|*{12}{X|}}
\hline
\bfseries NOM\rule[-.25cm]{0pt}{0.7cm} & \multicolumn{12}{c|}{} \\
\cline{1-13}
\bfseries PRÉNOM\rule[-.25cm]{0pt}{0.7cm} & \multicolumn{12}{c|}{} \\
\cline{1-13}
\bfseries MATRICULE\rule[-.25cm]{0pt}{0.7cm} &&&&&&&&&&&& \\
\cline{1-13}
\end{tabularx}

\section*{EXAMEN}
\begin{tabular}{@{}p{\linewidth}@{}}
DATE ET HEURE: \bfseries \dEXAMEN\ de \hEXAMEN\ à \hhEXAMEN \rule[-.25cm]{0pt}{0.7cm}\\
SIGLE DU COURS: \bfseries \sCOURS\rule[-.25cm]{0pt}{0.7cm}\\
TITRE DU COURS: \bfseries \tCOURS\rule[-.25cm]{0pt}{0.7cm}\\
\profword: \bfseries\prof\rule[-.25cm]{0pt}{0.7cm}
\end{tabular}

\section*{REMARQUES}

\begin{enumerate}[1.]
\item N'enlevez ni ne déchirez aucune feuille du cahier;
\item Rayez clairement tout travail inutile;
\item Tout plagiat, tout copiage ou toute fraude ainsi que toute tentative de commettre ces actes ou toute participation à ces actes à l’occasion d’un examen ou d’un travail est régi par les dispositions du Règlement disciplinaire en vigueur sur le plagiat ou la fraude concernant les étudiants.
\end{enumerate}
\end{minipage}\hspace*{\fill}%
\begin{minipage}[t]{3.2cm}
\sffamily
\begin{tabular}{|p{.85\linewidth}@{}|}
\hline
\rowcolor[gray]{.75}\multicolumn{1}{|c|}{\small\bfseries RÉSULTATS\rule[-.25cm]{0pt}{.7cm}}\\
\hline
$\hphantom{0}$1.\rule[-.25cm]{0pt}{0.7cm}\\
\hline
$\hphantom{0}$2.\rule[-.25cm]{0pt}{0.7cm}\\
\hline
$\hphantom{0}$3.\rule[-.25cm]{0pt}{0.7cm}\\
\hline
$\hphantom{0}$4.\rule[-.25cm]{0pt}{0.7cm}\\
\hline
$\hphantom{0}$5.\rule[-.25cm]{0pt}{0.7cm}\\
\hline
$\hphantom{0}$6.\rule[-.25cm]{0pt}{0.7cm}\\
\hline
$\hphantom{0}$7.\rule[-.25cm]{0pt}{0.7cm}\\
\hline
$\hphantom{0}$8.\rule[-.25cm]{0pt}{0.7cm}\\
\hline
$\hphantom{0}$9.\rule[-.25cm]{0pt}{0.7cm}\\
\hline
10.\rule[-.25cm]{0pt}{0.7cm}\\
\hline
11.\rule[-.25cm]{0pt}{0.7cm}\\
\hline
12.\rule[-.25cm]{0pt}{0.7cm}\\
\hline
13.\rule[-.25cm]{0pt}{0.7cm}\\
\hline
14.\rule[-.25cm]{0pt}{0.7cm}\\
\hline
15.\rule[-.25cm]{0pt}{0.7cm}\\
\hline
\textbf{Total:}\rule[-.25cm]{0pt}{0.7cm}\\
\hline
\end{tabular}
\end{minipage}

\ifx\@empty\rems
\else
\begin{enumerate}[1.]\addtocounter{enumi}{3}
\rems
\end{enumerate}
\fi

\vspace*{\fill}
\hspace*{\fill}\textsf{Signature:} \rule{.45\textwidth}{.4pt}
\pagebreak

\null\thispagestyle{empty}
\newpage
\egroup}


\pagestyle{examen}

\endinput

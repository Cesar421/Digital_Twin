%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% EURODYN 2026 class for LaTeX files                  v1.0 12-10-2025  %%
%%                                                                      %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{eurodyn2026}[EURODYN 2026 paper class]

\DeclareOption{10pt}{\OptionNotUsed}
\DeclareOption{11pt}{\OptionNotUsed}
\DeclareOption{twocolumn}{\OptionNotUsed}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\DeclareOption{dvips}{%
\PassOptionsToPackage{dvips}{hyperref}}
\DeclareOption{pdftex}{%
\PassOptionsToPackage{pdftex}{hyperref}}
\DeclareOption{dvipdfm}{%
\PassOptionsToPackage{dvipdfm}{hyperref}}
\DeclareOption{dvips}{%
\PassOptionsToPackage{dvips}{graphicx}}
\DeclareOption{pdftex}{%
\PassOptionsToPackage{pdftex}{graphicx}}
\DeclareOption{dvipdfm}{%
\PassOptionsToPackage{dvipdfm}{graphicx}}

\ProcessOptions\relax

\pagenumbering{gobble}

\LoadClass[a4paper,12pt]{article}

\RequirePackage{hyperref}
\RequirePackage{calc}
\RequirePackage{url}
\RequirePackage{graphicx}
\RequirePackage{newtxtext,newtxmath}
\RequirePackage{booktabs}
\RequirePackage[backend=biber,style=numeric-comp, sorting=none]{biblatex}
\RequirePackage{titlesec}
\RequirePackage{mfirstuc}

\defbibheading{bibliography}{%
  \section*{REFERENCES}
}

%% Title
\renewcommand{\maketitle}{%
  \newpage
  \thispagestyle{plain}
  \pagenumbering{gobble}
  \begin{minipage}[t][26mm][t]{155mm}
    \begin{flushright}
      \scriptsize
      EURODYN 2026\\
      XIII International Conference on Structural Dynamics \\
      M. Beer, C. Papadimitriou, H. Jensen, J. Chen, M. Broggi, J. Behrensdorf (eds.) \\
      Hannover, Germany,  27.09.--01.10 2026
    \end{flushright}
  \end{minipage}
  \begin{center}%
    {%3
      \fontsize{14}{16}\selectfont
      \bfseries
      \MakeUppercase{\@title}
      \par
    }%3
    \vspace{18pt}%
    {%4
      \fontsize{12}{14}\selectfont
      \bfseries\@author
      \par
    }%4
    \vspace{14pt}%
    {%5
      \fontsize{11}{12}\selectfont
      \def\and{\\\vspace{14pt}}
      \normalfont\@address
      \par
    }%5
  \end{center}
  \vspace{18pt}%
  \noindent\textbf{Keywords:\space}\@keywords
  \par
  \vspace{18pt}%
  \noindent\textbf{Abstract.\space}{\textit\@abstract}
  \par
  \vfill
  \newpage
}% End of \@maketitle

\def\author{\@ifnextchar[{\@getshortauthor}{\@getauthor}}
  \def\@getauthor#1{\gdef\@author{#1}\gdef\@shortauthor{#1}}
  \def\@getshortauthor[#1]#2{\gdef\@shortauthor{#1}\gdef\@author{#2}}

  \newcommand{\address}[1]{\gdef\@address{#1}}

  \newcommand{\keywords}[1]{\gdef\@keywords{#1}}

  \renewcommand{\abstract}[1]{\gdef\@abstract{#1}}

  \newcommand{\heading}[1]{\gdef\@heading{#1}}

  \def\ps@myheadings{%
    \def\@oddfoot{\normalfont\hfil\thepage\hfil}
    \let\@evenfoot\@oddfoot
    \def\@evenhead{%
      \parbox[t][11.5pt][t]{\textwidth}{%
        \centering
        \normalfont
        \fontsize{10}{10}\selectfont
        \@heading\\
        \vspace{-.2cm}
        \rule{\textwidth}{1pt}%
      }
    }%
    \let\@oddhead\@evenhead
    \let\@mkboth\@gobbletwo
    \let\sectionmark\@gobble
    \let\subsectionmark\@gobble
  }

  % Section formatting
  \titleformat{\section}
  [block]
  {\normalfont\bfseries\MakeUppercase}
  {\thesection}
  {1em}
  {}

  \titlespacing{\section}{0pt}{12pt}{6pt}

  % subsection formatting
  \titleformat{\subsection}
  [block]
  {\normalfont\bfseries}
  {\thesubsection}
  {1em}
  {\makefirstuc}

  \titlespacing{\subsection}{0pt}{12pt}{6pt}

  \renewcommand{\@makecaption}[2]{%
    \vskip\abovecaptionskip
    \sbox\@tempboxa{\normalsize\fontsize{10}{12}\selectfont #1: #2}%
    \ifdim \wd\@tempboxa >\hsize
    \normalsize\fontsize{10}{12}\selectfont #1: #2\par
    \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
    \fi
  \vskip\belowcaptionskip}

  \setlength{\oddsidemargin}{0mm}
  \setlength{\topmargin}{-10mm}
  \setlength{\textheight}{240mm}
  \setlength{\textwidth}{160mm}
  \setlength{\textfloatsep}{12pt}
  \setlength{\abovedisplayskip}{6pt}
  \setlength{\belowdisplayskip}{6pt}
  \setlength{\parindent}{5mm}
  \setlength{\abovecaptionskip}{6pt}
  \setlength{\belowcaptionskip}{6pt}
  \setlength{\itemsep}{0pt}

  \AtBeginDocument{%
    \pagestyle{myheadings}
    \maketitle
    \let\maketitle\relax
  }

  \endinput

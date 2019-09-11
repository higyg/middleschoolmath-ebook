% Current Version: 1.0
% Author: https://latex888.taobao.com/
% Homepage: 
% Email: latex888@qq.com

% --- Class structure: identification part
\ProvidesClass{tiku}[2019/08/03 v1.0]

\NeedsTeXFormat{LaTeX2e} 


\RequirePackage{kvoptions}
\RequirePackage{ifthen}
\RequirePackage{ifxetex}

\RequirePackage{etoolbox}
\RequirePackage{calc}
\RequirePackage{probsoln}


\SetupKeyvalOptions{family=tiku, prefix=tiku@, setkeys=\kvsetkeys}
\newcommand{\tikuset}[1]{\kvsetkeys{tiku}{#1}}

\DeclareStringOption[final]{style}

\DeclareVoidOption{final}{\tikuset{style= final}
\PassOptionsToPackage{final}{probsoln}}

\DeclareVoidOption{draft}{\tikuset{style= draft}
\PassOptionsToPackage{draft}{probsoln}
\PassOptionsToPackage{final}{graphicx}}


%\DeclareStringOption[exam]{examstyle}
%\DeclareVoidOption{exam}{\tikuset{examstyle=exam}}
%\ifdefstring{\tiku@examstyle}{exam}{
%\PassOptionsToPackage{b4paper,twocolumn,landscape,hmargin={3.5cm,1cm},vmargin={1.5cm,1.5cm},footskip=0.75cm,headsep=0.25cm}{geometry}
%}{\relax}



% \PassOptionsToClass{11pt}{article}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}}
\ProcessOptions\relax
\ProcessKeyvalOptions*\relax
\LoadClass[UTF8,10pt]{ctexart}



\RequirePackage[a4paper,scale=.8,centering]{geometry}

\RequirePackage{amsmath,amsthm,amssymb,bbding}

\linespread{1.35}


% indentation, table and figure package
\RequirePackage{indentfirst}
\RequirePackage{booktabs}
\RequirePackage{multicol}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{fancyvrb}
\RequirePackage{abstract}

\graphicspath{{image/}{figure/}{figures/}{ItemBankfigures/}}

% caption settings 
\RequirePackage[font=small,labelfont={bf}]{caption} 
\captionsetup[table]{skip=3pt}
\captionsetup[figure]{skip=3pt}

% list/itemize/enumerate setting
\RequirePackage[shortlabels,inline]{enumitem}
\setlist{nolistsep}
\setlist[enumerate,2]{label=(\arabic*),leftmargin=1em}
\newlist{choices}{enumerate}{3}
\setlist[choices]{noitemsep,label=\Alph*.}
\newlist{questions}{enumerate}{3}
\setlist[questions]{noitemsep}
\setlist[questions,1]{label=\arabic*.}
\setlist[questions,2]{label=(\arabic*)}


\RequirePackage{tkz-euclide}
\usetkzobj{all}
\RequirePackage{multido}
\graphicspath{{ItemBankfigures/}}

\punctstyle{banjiao}
\xeCJKsetcharclass{`①}{`⑩}{1}
\renewcommand*{\le}{\leqslant}
\renewcommand*{\ge}{\geqslant}
\setlength\lineskip{6pt}









\RequirePackage[colorlinks,linkcolor=blue,anchorcolor=black,citecolor=blue]{hyperref}

\providecommand*\input@path{}
\newcommand\addinputpath[1]{
\expandafter\def\expandafter\input@path
\expandafter{\input@path{#1}}}
\addinputpath{ItemBankBody/}




% define the hyperref color 
\RequirePackage{xcolor}
\definecolor{winered}{rgb}{0.5,0,0}




% add the \email cmd 
\newcommand\email[1]{\href{mailto:#1}{\nolinkurl{#1}}}

\PassOptionsToPackage{no-math}{fontspec}
% \RequirePackage[UTF8, scheme=plain]{ctex}
\RequirePackage[T1]{fontenc}
\RequirePackage{newtxtext}
\RequirePackage{newtxmath}




%\AtBeginEnvironment{verbatim}{\microtypesetup{activate=false}}



\def\gmu{}
\renewcommand\maketitle{\par
  \begingroup
\begin{center}
{\kaishu\zihao{-3}\gmu~\@title}
    \vskip 1.5em%
    {\large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author\\
      \end{tabular}\par}%
	\vskip 1.5em%
\end{center}
  \endgroup
}



\DeclareSymbolFont{CMletters}     {OML}{cmm} {m}{it}%
\DeclareSymbolFont{CMsymbols}     {OMS}{cmsy}{m}{n}%
\DeclareSymbolFont{CMlargesymbols}{OMX}{cmex}{m}{n}%

% \let\sum\relax
% \DeclareMathSymbol{\sum}{\mathop}{CMlargesymbols}{"50}%
% \let\int\relax
% \DeclareMathSymbol{\int}{\mathop}{CMlargesymbols}{"5A}%

\let\intop\relax\let\sumop\relax\let\ointop\relax\let\prodop\relax
\DeclareMathSymbol{\sumop}{\mathop}{CMlargesymbols}{"50}
\DeclareMathSymbol{\intop}{\mathop}{CMlargesymbols}{"52}
\DeclareMathSymbol{\ointop}{\mathop}{CMlargesymbols}{"49}
\DeclareMathSymbol{\prodop}{\mathop}{CMlargesymbols}{"59}

% \let\partial\relax
% \DeclareMathSymbol{\partial}{\mathord}{CMletters}{"40}%
% \let\in\relax
%\DeclareMathSymbol{\in}{\mathrel}{CMsymbols}{"32}%
% \let\pi\relax
% \DeclareMathSymbol{\pi}{\mathord}{CMletters}{"19}


%%%%%%%%%%%%%%%%%%%%%%%%
%括号不断开,不放行首
\newcommand{\kh}{\unskip\nobreak\hfill\relpenalty=700\makebox[9.1mm][l]{(\qquad)}}

% 两个选项时 \xx{1}{2}
% 三个选项时 \xx{1}{2}{3}
% ...
% 五个选项时 \xx{1}{2}{3}{4}{5}

% \usepackage{ifthen}
% \usepackage{enumitem}

\newlength{\testxxla}
\newlength{\testxxlb}
\newlength{\testxxlc}
\newlength{\testxxld}
\newlength{\testxxle}
\newlength{\lhalf}
\newlength{\ltrisect}
\newlength{\lquarter}
\newlength{\lfifth}
\newlength{\lmax}

%-----------------------------------------------------------------------------%
% 无标签的两选项，输出方式：一行二选项
%-----------------------------------------------------------------------------%
\newcommand{\testtwo}[2]
{%\par\noindent%
    \settowidth{\testxxla}{A.~#1~~~}
    \settowidth{\testxxlb}{B.~#2~~~}
	 \ifthenelse{\lengthtest{\testxxla>\testxxlb}}{\setlength{\lmax}{\testxxla}}{\setlength{\lmax}{\testxxlb}}
	\setlength{\lhalf}{0.47\linewidth}%
	\ifthenelse{\lengthtest{\lmax>\lhalf}}
    {
        \begin{enumerate}[label=\Alph*.,parsep=0ex,itemsep=0ex,leftmargin=6mm, topsep=0ex]
            \item #1
            \item #2
        \end{enumerate}
    }
	{
	\makebox[\lhalf][l]{A.~#1~~~}%
	\makebox[\lhalf][l]{B.~#2~~~}%
	}
}
%-----------------------------------------------------------------------------%
% 四选项，根据选项的长度自动判断输出方式：一行一选项，一行二选项，一行四选项
%-----------------------------------------------------------------------------%
\newcommand{\testxxfour}[4]
{
    % \par
    \settowidth{\testxxla}{A.~#1~~~}
    \settowidth{\testxxlb}{B.~#2~~~}
    \settowidth{\testxxlc}{C.~#3~~~}
    \settowidth{\testxxld}{D.~#4~~~}
    \ifthenelse{\lengthtest{\testxxla>\testxxlb}}{\setlength{\lmax}{\testxxla}}{\setlength{\lmax}{\testxxlb}}
    \ifthenelse{\lengthtest{\testxxlc>\lmax}}{\setlength{\lmax}{\testxxlc}}{}
    \ifthenelse{\lengthtest{\testxxld>\lmax}}{\setlength{\lmax}{\testxxld}}{}
    \setlength{\lhalf}{0.47\linewidth}
    \setlength{\lquarter}{0.23\linewidth}
    \ifthenelse{\lengthtest{\lmax>\lhalf}}
    {%\vspace*{-4mm}
        \begin{enumerate}[label=\Alph*.,parsep=0ex,itemsep=0ex,leftmargin=6mm, topsep=0ex]
            \item #1
            \item #2
            \item #3
            \item #4
        \end{enumerate}
    }
    {
        \ifthenelse{\lengthtest{\lmax>\lquarter}}
        {
            \noindent%
            \makebox[\lhalf][l]{A.~#1~~~}%
            \makebox[\lhalf][l]{B.~#2~~~}%
            \par\noindent%
            \makebox[\lhalf][l]{C.~#3~~~}%
            \makebox[\lhalf][l]{D.~#4~~~}%
        }%
        {
            \noindent%
            \makebox[\lquarter][l]{A.~#1~~~}%
            \makebox[\lquarter][l]{B.~#2~~~}%
            \makebox[\lquarter][l]{C.~#3~~~}%
            \makebox[\lquarter][l]{D.~#4~~~}%
        }
    }
}
%-----------------------------------------------------------------------------%
% 五选项，根据选项的长度自动判断输出方式：一行一选项，一行二选项，一行四选项
%-----------------------------------------------------------------------------%
\newcommand{\testxxfive}[5]
{
    \par
    \settowidth{\testxxla}{A.~#1~~~}
    \settowidth{\testxxlb}{B.~#2~~~}
    \settowidth{\testxxlc}{C.~#3~~~}
    \settowidth{\testxxld}{D.~#4~~~}
    \settowidth{\testxxle}{E.~#5~~~}
    \ifthenelse{\lengthtest{\testxxla>\testxxlb}}{\setlength{\lmax}{\testxxla}}{\setlength{\lmax}{\testxxlb}}
    \ifthenelse{\lengthtest{\testxxlc>\lmax}}{\setlength{\lmax}{\testxxlc}}{}
    \ifthenelse{\lengthtest{\testxxld>\lmax}}{\setlength{\lmax}{\testxxld}}{}
    \ifthenelse{\lengthtest{\testxxle>\lmax}}{\setlength{\lmax}{\testxxle}}{}
    \setlength{\lhalf}{0.47\linewidth}
    \setlength{\ltrisect}{0.31\linewidth}
    \setlength{\lquarter}{0.23\linewidth}
    \setlength{\lfifth}{0.18\linewidth}
    \ifthenelse{\lengthtest{\lmax>\lhalf}}
    {
        \begin{enumerate}[label=\Alph*.,parsep=0ex,itemsep=0ex,leftmargin=6mm, topsep=0ex]
            \item #1
            \item #2
            \item #3
            \item #4
            \item #5
        \end{enumerate}
    }
    {
        \ifthenelse{\lengthtest{\lmax>\ltrisect}}
        {\kh
            \noindent%
            \makebox[\lhalf][l]{A.~#1~~~}%
            \makebox[\lhalf][l]{B.~#2~~~}%
            \par\noindent%
            \makebox[\lhalf][l]{C.~#3~~~}%
            \makebox[\lhalf][l]{D.~#4~~~}%
            \par\noindent%
            \makebox[\lhalf][l]{E.~#5~~~}%
            \makebox[\lhalf][l]{}%
        }
        {
            \ifthenelse{\lengthtest{\lmax>\lquarter}}
            {\kh
                \noindent%
                \makebox[\ltrisect][l]{A.~#1~~~}%
                \makebox[\ltrisect][l]{B.~#2~~~}%
                \makebox[\ltrisect][l]{C.~#3~~~}%
                \par\noindent%
                \makebox[\ltrisect][l]{D.~#4~~~}%
                \makebox[\ltrisect][l]{E.~#5~~~}%
                \makebox[\ltrisect][l]{}%
            }
            {
                \ifthenelse{\lengthtest{\lmax>\lfifth}}
                {
                    \noindent%
                    \makebox[\lquarter][l]{A.~#1~~~}%
                    \makebox[\lquarter][l]{B.~#2~~~}%
                    \makebox[\lquarter][l]{C.~#3~~~}%
                    \makebox[\lquarter][l]{D.~#4~~~}%
                    \par\noindent%
                    \makebox[\lquarter][l]{E.~#5~~~}%
                    \makebox[\lquarter][l]{}%
                    \makebox[\lquarter][l]{}%
                    \makebox[\lquarter][l]{}%
                }
                {
                    \noindent%
                    \makebox[\lfifth][l]{A.~#1~~~}%
                    \makebox[\lfifth][l]{B.~#2~~~}%
                    \makebox[\lfifth][l]{C.~#3~~~}%
                    \makebox[\lfifth][l]{D.~#4~~~}%
                    \makebox[\lfifth][l]{E.~#5~~~}%
                }
            }
        }
    }
}
%-----------------------------------------------------------------------------%
% 三选项，根据选项的长度自动判断输出方式：一行一选项，一行二选项，一行三选项
%-----------------------------------------------------------------------------%
\newcommand{\testxxthree}[3]
{
    \par
    \settowidth{\testxxla}{A.~#1~~~}
    \settowidth{\testxxlb}{B.~#2~~~}
    \settowidth{\testxxlc}{C.~#3~~~}
    \ifthenelse{\lengthtest{\testxxla>\testxxlb}}{\setlength{\lmax}{\testxxla}}{\setlength{\lmax}{\testxxlb}}
    \ifthenelse{\lengthtest{\testxxlc>\lmax}}{\setlength{\lmax}{\testxxlc}}{}
    \setlength{\lhalf}{0.47\linewidth}
    \setlength{\ltrisect}{0.31\linewidth}
    \ifthenelse{\lengthtest{\lmax>\lhalf}}
    {
        \begin{enumerate}[label=\Alph*.,parsep=0ex,itemsep=0ex,leftmargin=6mm, topsep=0ex]
            \item #1
            \item #2
            \item #3
        \end{enumerate}
    }
    {
        \ifthenelse{\lengthtest{\lmax>\ltrisect}}
        {
            \noindent%
            \makebox[\lhalf][l]{A.~#1~~~}%
            \makebox[\lhalf][l]{B.~#2~~~}%
            \par\noindent%
            \makebox[\lhalf][l]{C.~#3~~~}%
        }%
        {
            \noindent%
            \makebox[\ltrisect][l]{A.~#1~~~}%
            \makebox[\ltrisect][l]{B.~#2~~~}%
            \makebox[\ltrisect][l]{C.~#3~~~}%
        }
    }
}



\newcommand{\xx@i}[2]{\testtwo{#1}{#2}}
\newcommand{\xx@ii}[3]{\testxxthree{#1}{#2}{#3}}
\newcommand{\xx@iii}[4]{\testxxfour{#1}{#2}{#3}{#4}}
\newcommand{\xx@iv}[5]{\testxxfive{#1}{#2}{#3}{#4}{#5}}
\newcommand{\xx@iii@helper}[4]{%
	\@ifnextchar\bgroup
	{\xx@iv{#1}{#2}{#3}{#4}}{\xx@iii{#1}{#2}{#3}{#4}}}
\newcommand{\xx@ii@helper}[3]{%
	\@ifnextchar\bgroup
	{\xx@iii@helper{#1}{#2}{#3}}{\xx@ii{#1}{#2}{#3}}}
\newcommand{\xx}[2]{%
	\@ifnextchar\bgroup
	{\xx@ii@helper{#1}{#2}}{\xx@i{#1}{#2}}}

\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\fancyfoot[CE,CO]{-- \thepage~--}

\AtBeginDocument{%
\maketitle
}

\iffalse
\AtEndDocument{%
\clearpage
\renewcommand*{\solutionname}{答案}
\showanswers
\section*{参考答案}
\begin{enumerate}
\foreachproblem{%
\item\hideanswers%
\thisproblem%
\par
\showanswers\thisproblem
}
\end{enumerate}
}
\fi

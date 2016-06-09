%% -*- Mode: LaTeX Memoir; tab-width: 4;

%% dlutthesis.cls    The LaTeX Class File for DLUT Doctor Thesis
%%
%% Created by Dazhi Jiang, 2016-05-27 13:23:39 +0800 (Fri, 27 May 2016)
%% Copyright (c) 2016 Dazhi Jiang All Rights Reserved.

%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%% * Usage
%%   - Available keys
%%
%%   - Short outlines
%%     - Initialisation
%%     - Packages
%%     - The 'dlut' keys
%%     - Document Settings
%%       - Fonts
%%       - Page Layout
%%       - Page Styles
%%       - Titles
%%         - Main title page
%%         - Plagiarism declaration
%%       - Headings
%%         - Chapter headings
%%         - Section headings
%%         - Subsection headings
%%       - ToC
%%         - ToC configuration
%%         - English ToC
%%       - Floats
%%       - Graphics
%%         - pgf/tikz
%%         - pgfplots


%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%% * Change Log
%%   @ 2016-06-08 11:08:20 +0800 (Wed, 08 Jun 2016)
%%     - Set up CFT
%%   @ 2016-06-06 08:53:17 +0800 (Mon, 06 Jun 2016)
%%     - Define the 'dlut' section/subsection/etc. heading style
%%   @ 2016-06-03 16:13:59 +0800 (Fri, 03 Jun 2016)
%%     - Define the 'dlut' chapter heading style
%%   @ 2016-06-02 14:26:34 +0800 (Thu, 02 Jun 2016)
%%     - Merge the plagiarism declaration page
%%   @ 2016-06-01 20:45:10 +0800 (Wed, 01 Jun 2016)
%%     - Create the title page
%%   @ 2016-05-31 05:34:09 +0800 (Tue, 31 May 2016)
%%     - Define page styles
%%   @ 2016-05-30 21:29:55 +0800 (Mon, 30 May 2016)
%%     - Define page layout
%%   @ 2016-05-27 22:23:17 +0800 (Fri, 27 May 2016)
%%     - Define fonts
%%   @ 2016-05-27 13:23:39 +0800 (Fri, 27 May 2016)
%%     - Create the initial file
%%


%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%% A. Initialization
%% Created by Dazhi Jiang, 2016-05-27 13:23:39 +0800 (Fri, 27 May 2016)
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{dlutthesis}[2016/05/27 v0.0.1 Dalian University of Technology Template]
\def\version{v0.0.1}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions\relax
\LoadClass[a4paper]{memoir}

%% ! DLUTThesis relies on the memoir class
\@ifclassloaded{memoir}{\let\enddlutthesis\relax}{\let\enddlutthesis\endinput
  \PackageError{DLUTThesis}{The DLUTThesis package only works with the memoir class}{\@ehd}}
\enddlutthesis

%% END: Initialization
%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%% B. Packages
%% Created by Dazhi Jiang, 2016-05-31 13:38:18 +0800 (Tue, 31 May 2016)

%% * PGF key
\RequirePackage{pgfkeys}  %% Load Package 'pgfkeys'
\RequirePackage{pgfopts}  %% Load Package 'pgfopts'

%% * IF*
\RequirePackage{ifthen}  %% Load Package 'ifthen'
\RequirePackage{ifpdf}  %% Load Package 'ifpdf'
\RequirePackage{ifxetex}  %% Load Package 'ifxetex'

%% * Before 'ctex'
\RequirePackage{xltxtra}

%% * CTeX
\RequirePackage[fontset = adobe,
				UTF8,
				scheme = chinese,
				zihao = -4]{ctex}

%% * Paragraph style
% \RequirePackage{indentfirst}

%% * Other font packages
\RequirePackage{CJKnumb}

%% * ToC
% \RequirePackage{titletoc}
\RequirePackage{letltxmacro}

%% * Graphic packages
% \RequirePackage{graphics}							% Graphy style
\RequirePackage[usenames, dvipsnames]{color}		% Color
\RequirePackage{graphicx}
\graphicspath{{Figs/pdf/}{Figs/png/}}  %% Specify the figure directories

%% !!! Comment
%%     The package 'xcolor' has to be loaded before the package 'pstricks'.
\RequirePackage[svgnames]{xcolor}

%%   - PGF/Tikz package
\RequirePackage{pgf}
\RequirePackage{tikz}
\RequirePackage{pgfplots}
\RequirePackage{pgfplotstable}

%%   - Load the tikz libraries
\usetikzlibrary{%
	arrows,%
	calc,%
	fit,%
	patterns,%
	plotmarks,%
	external,%
}

%%   - Load the pgfplots libraries
\usepgfplotslibrary{dateplot,%
					units,%
					groupplots}

%% * MISC
\RequirePackage{ulem}  %% Underlining command: \uline
\renewcommand{\ULthickness}{.75pt} %% Default: .4pt
\RequirePackage{pdfpages} %% For loading the plagiarism declaration


%% END: Packages
%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%% C. The 'dlut' keys
%% Created by Dazhi Jiang, 2016-05-31 14:40:32 +0800 (Tue, 31 May 2016)

%% * The '\dlutset' command sets the dlut keys
\def\dlutset#1{\pgfkeys{/dlut/.cd,#1}}

%% * The '\dlut@opt@set' command is only called at preamble to set the class
%%   options
\def\dlut@opt@set#1{\pgfkeys{/dlutopt/.cd,#1}}

%% END: The 'dlut' keys
%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%% D. Commands
%% Created by Dazhi Jiang, 2016-06-01 20:43:54 +0800 (Wed, 01 Jun 2016)
\newcommand\fwdistleft[2][1cm]{{\hb@xt@ #1{#2\hss}}}
\newcommand\fwdistcenter[2][1cm]{{\hb@xt@ #1{\hss#2\hss}}}
\newcommand\fwdistright[2][1cm]{{\hb@xt@ #1{\hss#2}}}
\newcommand\fwulleft[2][1cm]{\uline{\hb@xt@ #1{#2\hss}}}
\newcommand\fwulcenter[2][1cm]{\uline{\hb@xt@ #1{\hss#2\hss}}}
\newcommand\fwulright[2][1cm]{\uline{\hb@xt@ #1{\hss#2}}}

%% END: Commands
%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%% Outlines
%% 0. Import dlutthesis.cfg
%% 1. Font options
%% 2. Page layout
%% 3. Page styles
%% 4. Titles
%% 5. Headings
%% 6. ToC
%% 7. Floats
%% 8. Graphics


%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%% 0. Import dlutthesis.cfg
%% Created by Dazhi Jiang,

%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%% 1. Font options
%% Created by Dazhi Jiang, 2016-05-29 21:30:05 +0800 (Sun, 29 May 2016)

%% 1.1 xeCJK options
\xeCJKsetup{CheckSingle = true, AutoFakeBold = true}

%% 1.2 Font settings
%% 1.2.1 English fonts
\setmainfont[Mapping=tex-text]{Times New Roman}
\setsansfont[Mapping=tex-text]{Arial}
\setmonofont{Consolas}
%% 1.2.2 CJK fonts
%%   Declare new font family
\setCJKfamilyfont{xkai}{STXingkai}
\newcommand{\xkai}{\CJKfamily{xkai}}

%% END: Font options
%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%% 2. Page layout
%% Created by Dazhi Jiang, 2016-05-29 21:29:51 +0800 (Sun, 29 May 2016)

\settrimmedsize{297mm}{210mm}{*} % a4paper: 297mm * 210mm%
\setlength{\trimtop}{0pt}
\setlength{\trimedge}{\stockwidth}
\addtolength{\trimedge}{-\paperwidth}
\settypeblocksize{218mm}{160mm}{*}
\setulmargins{41.5mm}{*}{*}
\setlrmargins{27mm}{*}{*}
\setheadfoot{2\onelineskip}{13.5mm}
\setheaderspaces{*}{11mm}{*}
\setlength{\footnotesep}{\onelineskip}
\checkandfixthelayout
% \fixpdflayout

%% END: Page Layout
%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%% 3. Page Styles
%% Created by Dazhi Jiang, 2016-05-29 21:30:14 +0800 (Sun, 29 May 2016)
%%   * \markboth takes the effect for the twosides documents, while \markright
%%     is used for the oneside documents.

%% * DLUT thesis page style
\copypagestyle{dlut}{ruled}
\makeevenhead{dlut}{} {\songti\small \@title} {}
\makeoddhead{dlut} {} {\songti\small 大连理工大学博士学位论文} {}
\makeevenfoot{dlut}{} {\songti\footnotesize -~\thepage~-} {}
\makeoddfoot{dlut} {} {\songti\footnotesize -~\thepage~-} {}
\setlength{\headwidth}{\textwidth}
\makeheadrule{dlut}{\headwidth}{0.75pt}
\renewcommand*{\tocmark}{\markboth{\contentsname}{\contentsname}}
\renewcommand*{\bibmark}{\markboth{\bibname}{\bibname}}

%% * Display the header and footer at the beginning page of a chapter
\aliaspagestyle{chapter}{dlut}

%% * Load DLUT style
\pagestyle{dlut}

%% * Uppercase Roman letters for the page numbers in the front matter
\addtodef*{\@memfront}{}{\pagenumbering{Roman}}

%% END: Page Styles
%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%% 4. Titles
%% Created by Dazhi Jiang, 2016-05-31 05:43:46 +0800 (Tue, 31 May 2016)

%% # DONE:30 x 2016-06-01 2016-05-31 Define the title page
%% * IFs for elements in the title page
\newif\if@dlut@titlepage@thesis@exist
\newif\if@dlut@titlepage@title@exist
\newif\if@dlut@titlepage@etitle@exist
\newif\if@dlut@titlepage@author@exist
\newif\if@dlut@titlepage@authorid@exist
\newif\if@dlut@titlepage@supervisor@exist
\newif\if@dlut@titlepage@major@exist
\newif\if@dlut@titlepage@date@exist
% \newif\if@dlut@titlepage@university@exist

%% * Declare the style switchers for title page
\newif\if@dlut@titlepage@style@dlut

%% * Clear title page style
\let\@dlut@maketitle@orig\maketitle
\newcommand*{\@dlut@titlepage@style@clear}{%
	\@dlut@titlepage@style@dlutfalse
	\def\maketitle{\@dlut@maketitle@orig}
}

%% # TODO:0 2016-06-03 Simplify the keys

%% * Define title-page-related keys
\pgfkeys{%
    /dlut/.cd,
    %% - Elements for title page
    thesis/.code={\thesis{#1}\@dlut@titlepage@thesis@existtrue},
    title/.code={\title{#1}\@dlut@titlepage@title@existtrue},
    etitle/.code={\etitle{#1}\@dlut@titlepage@etitle@existtrue},
    author/.code={\author{\fwulleft[60.8mm]{{\quad}#1}}\@dlut@titlepage@author@existtrue},
    authorid/.code={\authorid{\fwulleft[60.8mm]{{\quad}#1}}\@dlut@titlepage@authorid@existtrue},
    supervisor/.code={\supervisor{\fwulleft[60.8mm]{{\quad}#1}}\@dlut@titlepage@supervisor@existtrue},
    major/.code={\major{\fwulleft[60.8mm]{{\quad}#1}}\@dlut@titlepage@major@existtrue},
    date/.code={\date{\fwulleft[60.8mm]{{\quad}#1}}\@dlut@titlepage@date@existtrue},
    % university/.code={\university{#1}\@dlut@titlepage@university@existtrue},
    %% - Title page layout
    titlepage/thesis/font/.code={\@dlut@titlepage@element@font@define{thesis}{#1}},
    titlepage/thesis/pre/.code={\@dlut@titlepage@element@pre@define{thesis}{#1}},
    titlepage/thesis/post/.code={\@dlut@titlepage@element@post@define{thesis}{#1}},
    titlepage/title/font/.code={\@dlut@titlepage@element@font@define{title}{#1}},
    titlepage/title/pre/.code={\@dlut@titlepage@element@pre@define{title}{#1}},
    titlepage/title/post/.code={\@dlut@titlepage@element@post@define{title}{#1}},
    titlepage/etitle/font/.code={\@dlut@titlepage@element@font@define{etitle}{#1}},
    titlepage/etitle/pre/.code={\@dlut@titlepage@element@pre@define{etitle}{#1}},
    titlepage/etitle/post/.code={\@dlut@titlepage@element@post@define{etitle}{#1}},
    titlepage/author/font/.code={\@dlut@titlepage@element@font@define{author}{#1}},
    titlepage/author/pre/.code={\@dlut@titlepage@element@pre@define{author}{#1}},
    titlepage/author/post/.code={\@dlut@titlepage@element@post@define{author}{#1}},
    titlepage/authorid/font/.code={\@dlut@titlepage@element@font@define{authorid}{#1}},
    titlepage/authorid/pre/.code={\@dlut@titlepage@element@pre@define{authorid}{#1}},
    titlepage/authorid/post/.code={\@dlut@titlepage@element@post@define{authorid}{#1}},
    titlepage/supervisor/font/.code={\@dlut@titlepage@element@font@define{supervisor}{#1}},
    titlepage/supervisor/pre/.code={\@dlut@titlepage@element@pre@define{supervisor}{#1}},
    titlepage/supervisor/post/.code={\@dlut@titlepage@element@post@define{supervisor}{#1}},
    titlepage/major/font/.code={\@dlut@titlepage@element@font@define{major}{#1}},
    titlepage/major/pre/.code={\@dlut@titlepage@element@pre@define{major}{#1}},
    titlepage/major/post/.code={\@dlut@titlepage@element@post@define{major}{#1}},
    titlepage/date/font/.code={\@dlut@titlepage@element@font@define{date}{#1}},
    titlepage/date/pre/.code={\@dlut@titlepage@element@pre@define{date}{#1}},
    titlepage/date/post/.code={\@dlut@titlepage@element@post@define{date}{#1}},
    % titlepage/university/font/.code={\@dlut@titlepage@element@font@define{university}{#1}},
    % titlepage/university/pre/.code={\@dlut@titlepage@element@pre@define{university}{#1}},
    % titlepage/university/post/.code={\@dlut@titlepage@element@post@define{university}{#1}},
    %% - Title page style
    titlepagestyle/.is choice,
    titlepagestyle/default/.code={\@dlut@titlepage@style@clear},
    titlepagestyle/dlut/.code={\@dlut@titlepage@style@clear %
							   \@dlut@titlepage@style@dluttrue %
							   \@dlut@titlepage@style@set},
    titlepagestyle/.default=dlut,
}

%% * Define the elements of the title page
%%   - Prototype used to define the element command
\DeclareRobustCommand{\@dlut@titlepage@element@define}[1]{%
	\@namedef{#1}##1{%
		\expandafter\expandafter\expandafter\gdef\@nameuse{@dlut@titlepage@#1}{##1}}
}
%%   - Prototype used to define the element font
\DeclareRobustCommand{\@dlut@titlepage@element@font@define}[2]{%
	\@namedef{@dlut@titlepage@#1@font}{\normalfont #2}%
}
%%   - Prototype used to define the text before the main element
\DeclareRobustCommand{\@dlut@titlepage@element@pre@define}[2]{%
	\@namedef{@dlut@titlepage@#1@pre}{#2}%
}
%%   - Prototype used to define the text after the main element
\DeclareRobustCommand{\@dlut@titlepage@element@post@define}[2]{%
	\@namedef{@dlut@titlepage@#1@post}{#2}%
}
%%   - Prototype used to define the layout of the elements
\DeclareRobustCommand{\@dlut@titlepage@element@group@define}[1]{%
	\@namedef{@dlut@titlepage@group@#1}{%
		\@nameuse{@dlut@titlepage@#1@pre}
		{\@nameuse{@dlut@titlepage@#1@font} \@nameuse{@dlut@titlepage@#1}}
		\@nameuse{@dlut@titlepage@#1@post}
	}
}
%%     !!! Comment
%%     The definition of \@nameuse is
%%         \def\@nameuse#1{\csname #1\endcsname}
%%     The 1st \expandafter saves the 2nd one, while the 3rd one saves \gdef.
%%     Thus, the 2nd \expandafter and \gdef are saved, while \@nameuse is
%%     expanded to its definition. Then the command becomes
%%         \expandafter\gdef\csname @#1\endcsname
%%     This will allow the final expanded result is \@#1 with #1 replacing by
%%     the corresponding text.

%%   - Main title
\let\title@orig\title
\renewcommand{\title}[1]{%
	\title@orig{#1}%
	\let\@dlut@titlepage@title\@title%
}
\@dlut@titlepage@element@group@define{title}

%%   - Author
\let\author@orig\author
\renewcommand{\author}[1]{%
	\author@orig{#1}%
	\let\@dlut@titlepage@author\@author%
}
\@dlut@titlepage@element@group@define{author}

%%   - Date
\let\date@orig\date
\renewcommand{\date}[1]{%
	\date@orig{#1}%
	\let\@dlut@titlepage@date\@date%
}
\@dlut@titlepage@element@group@define{date}

%%   - Thesis type
\@dlut@titlepage@element@define{thesis}
%%     as \def\thesis#1{\gdef\@thesis{#1}}
%%   - Layout
\@dlut@titlepage@element@group@define{thesis}

%%   - etitle, english title
\@dlut@titlepage@element@define{etitle}
%%     as \def\etitle#1{\gdef\@etitle{#1}}
%%   - Layout
\@dlut@titlepage@element@group@define{etitle}

%%   - authorid, author ID
\@dlut@titlepage@element@define{authorid}
%%     as \def\authorid#1{\gdef\@authorid{#1}}
%%   - Layout
\@dlut@titlepage@element@group@define{authorid}

%%   - Supervisor, the name of your supervisor
\@dlut@titlepage@element@define{supervisor}
%%     as \def\supervisor#1{\gdef\@supervisor{#1}}
%%   - Layout
\@dlut@titlepage@element@group@define{supervisor}

%%   - Major
\@dlut@titlepage@element@define{major}
%%     as \def\major#1{\gdef\@major{#1}}
%%   - Layout
\@dlut@titlepage@element@group@define{major}


%%   - University, the name of your University
% \@dlut@titlepage@element@define{university}
% %      as \def\university#1{\gdef\@university{#1}}
% %%   - Layout
% \@dlut@titlepage@element@group@define{university}

%% * Set up the title page style
%%   - Single column
\newenvironment{alwayssingle}{%
	\@restonecolfalse
	\if@twocolumn \@restonecoltrue\onecolumn
	\else \newpage
	\fi}
{\if@restonecol\twocolumn\else\newpage\fi}

\newcommand{\@dlut@titlepage@style@set}{%
	%% - DLUT style II: better for 10pt
	\if@dlut@titlepage@style@dlut
		\dlutset{%
            titlepage/thesis/font={\huge\songti\bfseries}, %% 小一、宋体、粗体
            titlepage/thesis/pre={\vspace{-3.2mm}}, %% * version at the top
            titlepage/thesis/post={\\},
			titlepage/title/font={\LARGE\heiti\sffamily}, %% 小二、黑体、无衬线
			titlepage/title/pre={\vspace{19.6mm}},
			titlepage/title/post={\\},
			titlepage/etitle/font={\zihao{3}\bfseries}, %% 三号、粗体
			titlepage/etitle/pre={\vspace{6mm}},
			titlepage/etitle/post={\\},
			titlepage/author/font={\large},
			titlepage/author/pre={},
			titlepage/author/post={},
			titlepage/authorid/font={\large},
			titlepage/authorid/pre={},
			titlepage/authorid/post={},
            titlepage/supervisor/font={\large},
            titlepage/supervisor/pre={},
            titlepage/supervisor/post={},
            titlepage/major/font={\large},
            titlepage/major/pre={},
            titlepage/major/post={},
			titlepage/date/font={\large},
			titlepage/date/pre={},
			titlepage/date/post={},
			% titlepage/university/font={\normalfont},
			% titlepage/university/pre={},
			% titlepage/university/post={\unskip,~\ignorespaces},
		}
		\renewcommand{\maketitle}{%
			\begin{alwayssingle}
				\thispagestyle{empty}
				\begin{center}
                    \mbox{}\\
                    %% - Thesis
                    \@dlut@titlepage@group@thesis
                    %% - Main title
    				\@dlut@titlepage@group@title
                    %% - English title
    				\@dlut@titlepage@group@etitle
                    \vspace{62.2mm}
                    {\large\songti
                    \begin{tabular}{p{0.6cm}p{6em}@{\extracolsep{0.5em}}lc}
                        ~ & 作 \hfill 者 \hfill 姓 \hfill 名：& \@dlut@titlepage@group@author & \\[2mm]
                        ~ & 学 \hfill 号：& \@dlut@titlepage@group@authorid & \\[2mm]
                        ~ & 指 \hfill 导 \hfill 教 \hfill 师：& \@dlut@titlepage@group@supervisor & \\[2mm]
                        ~ & 学 \hfill 科 \hfill 、\hfill 专 \hfill 业：& \@dlut@titlepage@group@major & \\[2mm]
                        ~ & 答 \hfill 辩 \hfill 日 \hfill 期：& \@dlut@titlepage@group@date & \\
                    \end{tabular}
                    }
                    % \begin{tabular}{p{0.6cm}p{6.4em}@{\extracolsep{0.5em}}lc}
                    %     \vspace{-0.41cm}
                    %     ~ & 作 \hfill 者 \hfill 姓 \hfill 名：& \fixedunderlineleft[6.08cm]{\@cauthor} & \\
                    %     \vspace{-0.41cm}
                    %     ~ & 学 \hfill 号：& \fixedunderlineleft[6.08cm]{\@cauthorno} & \\
                    %     \vspace{-0.41cm}
                    %     ~ & 指 \hfill 导 \hfill 教 \hfill 师：& \fixedunderlineleft[6.08cm]{\@csupervisor} & \\
                    %     \vspace{-0.41cm}
                    %     ~ & 学 \hfill 科 \hfill 、\hfill 专 \hfill 业：& \fixedunderlineleft[6.08cm]{\@csubject} & \\
                    %     \vspace{-0.41cm}
                    %     ~ & 答 \hfill 辩 \hfill 日 \hfill 期：& \fixedunderlineleft[6.08cm]{\@cdate} & \\
                    %     \vspace{-0.41cm}
                    % \end{tabular}
					%% - University
					% \@dlut@titlepage@group@university
                    \\ \vspace{21.4mm}
                    {\Large\xkai 大连理工大学\\}
                    \vspace{2.3mm}
                    {\normalsize\songti Dalian University of Technology}
				\end{center}
			\end{alwayssingle}
		}
	\fi
}

%% # DONE:40 x 2016-06-02 2016-06-01 Plagiarism declaration
\newcommand{\makedeclaration}{%
    \begin{alwayssingle}
        \thispagestyle{empty}
        \includepdf[pages=-,fitpaper]{Figs/pdf/Declaration}
    \end{alwayssingle}
}

%% END: Titles
%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%% 5. Headings
%% Created by Dazhi Jiang, 2016-06-02 15:20:11 +0800 (Thu, 02 Jun 2016)

%% # DONE:60 x 2016-06-03 2016-06-02 Define the chapter headings

%% * The '\@dlut@chapter@heading' macro saves the current chapter heading style,
%%   default value, 'default'.
\def\@dlut@chapter@heading{default}    % Initial chapter heading style: default
%% !!! A few comment
%% The 'chapterheading' key saves the name of the current chapter style and can
%% be later used by another key, e.g., 'headstyle'. This ensures that the
%% default/original value of chapter style can be restored in case of unexpected
%% changes in other commands, such as commands for setting up the head styles

%% * Define the chapter heading keys
\pgfkeys{%
	/dlut/.cd,
	%% - Chapter heading style
	chapterheading/.is choice,
	chapterheading/dlut/.code={\chapterstyle{dlut}
							   \addtodef{\appendix}{}{\chapterstyle{dlutappendix}}},
	chapterheading/default/.code={\chapterstyle{default}},
	chapterheading/.default=default,
	chapterheading/.append code={\def\@dlut@chapter@heading{#1}},
}

%% * Define the chapter heading style
%%   - The 'dlut' style
\makechapterstyle{dlut}{%
	%% - Initialisation, default
	\chapterstyle{default}
	%% - Set up dimensions
	\setlength\beforechapskip{-\baselineskip}
	\setlength\afterchapskip{\baselineskip}
	%% - No chapter name
	\renewcommand*{\printchaptername}{}
	%% - No space between chapter name and chapter number
	\renewcommand*{\chapternamenum}{}
	%% - Font for the chapter number
	\renewcommand*{\chapnumfont}{\normalfont\large\heiti} %% 小三、黑体
	%% - Chapter number @mainmatter
	\renewcommand*{\printchapternum}{\chapnumfont \thechapter\quad}
	%% - Chapter number @othermatter, \centring
	\renewcommand*{\printchapternonum}{\centering}
	%% - Nothing following the number
	\renewcommand*{\afterchapternum}{}
	%% - Font for the chapter title, the same as the chapter number
	\renewcommand*{\chaptitlefont}{\chapnumfont}
}

%%   - The appendix heading style for DLUT
\makechapterstyle{dlutappendix}{%
	%% - Initialisation, dlut
	\chapterstyle{dlut}
	%% - Set the chapter name font (\chapnumfont)
	\renewcommand*{\chapnamefont}{\chapnumfont}
	%% - Centring the heading
	\renewcommand*{\printchaptername}{\centering \chapnamefont \@chapapp}
}

%% # DONE:50 x 2016-06-05 2016-06-03 The chapter number of appendix is not displayed.
%%     Put \backmatter after the appendix

%% # DONE:20 x 2016-06-06 2016-06-02 Define the section/subsection/... headings
%% * Define the chapter heading keys
\pgfkeys{%
	/dlut/.cd,
	%% - Other heading styles
	sectionheading/.is choice,
	sectionheading/dlut/.code={\headstyles{dlut}
							   \chapterstyle{dlut}},
	sectionheading/default/.code={\headstyles{default}},
	sectionheading/.default=dlut,
	%% - Section numbering depth
	secnumdepth/.code={\setsecnumdepth{#1}},
	maxsecnumdepth/.code={\maxsecnumdepth{#1}},
}

%% * Define the chapter heading style
%%   - The 'dlut' style
\makeheadstyles{dlut}{%
	%% - The default heading style
	\defaultsecheads
	%% - Section heading style
	\setsecheadstyle{\normalfont\zihao{4}\heiti\raggedright}
	%% !!! Any positive value can guarantee the indentation of the following text
	\setbeforesecskip{.5em plus 0.5ex minus .2ex}
    \setaftersecskip{.5em plus .2ex}
	%% - Subsection heading style
	\setsubsecheadstyle{\normalfont\heiti\raggedright}
	\setbeforesubsecskip{.5em plus 0.5ex minus .2ex}
	\setaftersubsecskip{.5em plus .2ex}
	%% - Subsubsection heading style
	\setsubsubsecheadstyle{\normalfont\heiti\raggedright}
	\setbeforesubsubsecskip{.5em plus 0.5ex minus .2ex}
	\setaftersubsubsecskip{.5em plus .2ex}
	%% - Paragraph heading style
	\setbeforeparaskip{.2em plus 0.5ex minus .2ex}
	%% - Subparagraph heading style
	\setbeforesubparaskip{.2em plus 0.5ex minus .2ex}
}

%% * The default head style
\newcommand*{\defaultsecheads}{
  \defaultsecnum
  \setsecheadstyle{\normalfont\Large\bfseries\raggedright}
    \setsecindent{\z@}
    \setbeforesecskip{-3.5ex plus -1ex minus -.2ex}
    \setaftersecskip{2.3ex plus .2ex}
  \setsubsecheadstyle{\normalfont\large\bfseries\raggedright}
    \setsubsecindent{\z@}
    \setbeforesubsecskip{-3.25ex plus -1ex minus -.2ex}
    \setaftersubsecskip{1.5ex plus .2ex}
  \setsubsubsecheadstyle{\normalfont\bfseries\raggedright}
    \setsubsubsecindent{\z@}
    \setbeforesubsubsecskip{-3.25ex plus -1ex minus -.2ex}
    \setaftersubsubsecskip{1.5ex plus .2ex}
  \setparaheadstyle{\normalfont\bfseries}
    \setparaindent{\z@}
    \setbeforeparaskip{3.25ex plus 1ex minus .2ex}
    \setafterparaskip{-1em}
  \setsubparaheadstyle{\normalfont\bfseries}
    \setsubparaindent{\z@}
    \setbeforesubparaskip{3.25ex plus 1ex minus .2ex}
    \setaftersubparaskip{-1em}
}




%% END: Headings
%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%% 6. ToC
%% Created by Dazhi Jiang, 2016-06-06 09:50:59 +0800 (Mon, 06 Jun 2016)

%% * Set the default TOC depth
\maxtocdepth{subsection}    % include subsections in ToC

%% * Change the title texts of ToC, LoF and LoT
\ctexset{%
	contentsname = {目　　录},
	listfigurename = {图目录},
	listtablename = {表目录}
}

%% * The looking of CFT
%%   - Add dots after chapter title text
\renewcommand*{\cftchapterdotsep}{\cftdotsep}

%%   - The dot seperator
\renewcommand{\cftdotsep}{0.4}

%%   - CFT numbering space
\setpnumwidth{1.75em}
\setrmarg{1.8em}

%%   - Chapter
%%     - Vertical space before every chapter line
\setlength{\cftbeforechapterskip}{.1em}
%%     - The chapter text font
\renewcommand*{\cftchapterfont}{\normalfont}
%%     - The chapter dots
\renewcommand{\cftchapterleader}{%
			  \normalfont\cftdotfill{\cftchapterdotsep}}
%%     - The page number font
\renewcommand*{\cftchapterpagefont}{\normalfont}

%%   - Section
%%     - Indentation, 两倍字宽
\setlength{\cftsectionindent}{2 \ccwd}

%%   - Subsection
%%     - Indentation, 四倍字宽
\setlength{\cftsubsectionindent}{4 \ccwd}

%%   - Figure
%%     - Indentation, 两倍字宽
\setlength{\cftfigureindent}{2 \ccwd}
\setlength{\cftfigurenumwidth}{2.5em}

%%   - Table
%%     - Indentation, 两倍字宽
\setlength{\cfttableindent}{2 \ccwd}
\setlength{\cfttablenumwidth}{2.5em}

%% * English ToC
%%   - Create a new table of ENGLISH contents
\newlistof{tableofencontents}{toe}{\encontentsname}
\newcommand*{\encontentsname}{TABLE OF CONTENTS}

%% * Add a new argument, the english title, to the \chapter macro
\LetLtxMacro{\@dlut@chapter@orig}{\@chapter}
\def\@chapter[#1]#2#3{%
	\@dlut@chapter@orig[#1]{#2} %% #2 has to be surrounded by braces, e.g. {#2}
	\phantomsection%
	\ifanappendix
	  \addcontentsline{toe}{chapter}{%
	    \cftenappendixname~\protect\chapternumberline{\thechapter} #3}
	\else
	  \addcontentsline{toe}{chapter}{\protect\chapternumberline{\thechapter} #3}
	\fi%
}
%%   - The leading name of appendix in ToE.
\newcommand*{\cftenappendixname}{The Appendix}

%% * Add a new argument, the english title, to the lower section macro
\LetLtxMacro{\@dlut@M@sect@orig}{\M@sect}
\def\M@sect#1#2#3#4#5#6[#7][#8]#9{%
	\@dlut@M@sect@orig{#1}{#2}{#3}{#4}{#5}{#6}[#7][#8]{#9}
	\@dlut@toe@sect{#1}
}

%%   - The second argument of the below macro is the token of the english title
\def\@dlut@toe@sect#1#2{%
	\phantomsection%
	\addcontentsline{toe}{#1}{%
		\protect\numberline{\csname the#1\endcsname} #2}%
}

%% # DONE:10 x 2016-06-07 2016-06-05 Remove ToC from ToC (and LoF, LoT, etc.).
%%     This can be done by using the star version of CFT commands, see the main
%%     TeX files.

%% # DONE:0 x 2016-06-08 2016-06-03 Redefine the chapter name of appendix
%% * The leading name of appendix in ToC, LoF and LoT.
\renewcommand*{\cftappendixname}{附录}
%% * The leading name of figure in ToC, LoF and LoT.
\renewcommand*{\cftfigurename}{图}
%% * The leading name of table in ToC, LoF and LoT.
\renewcommand*{\cfttablename}{表}

%% END: ToC
%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%% 4. Flotats
%% Created by Dazhi Jiang,

%% # TODO: 2016-06-08 Set up the format of floats

%% END: Floats
%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%% 8. Graphics
%% Created by Dazhi Jiang, 2016-06-09 08:18:38 +0800 (Thu, 09 Jun 2016)

%% * PSTricks
%%   - Define IFs for PSTricks
\newif\if@dlut@pstricks@load
\newif\if@dlut@pstricks@fig
\@dlut@pstricks@figfalse

%%   - Define package option keys for PSTricks options
\pgfkeys{%
	/dlutopt/.cd,
	%% - Options for PSTricks
	pstricks/.is if=@dlut@pstricks@load,
	pstricks/.default=false,
	pstricks/.initial=false,
	pstricks/.append code={\@dlut@pstricks@load},
	pstricks/figure/.is if=@dlut@pstricks@fig,
	pstricks/figure/.default=false,
	pstricks/figure/.initial=false,
	pstricks/package/.code={#1},
}

\newcommand{\@dlut@pstricks@load}{%
	\if@dlut@pstricks@load
		\RequirePackage{pstricks}
		\RequirePackage{pst-node}
		\RequirePackage{pst-tree}
		\RequirePackage{pst-plot}
		\RequirePackage{pst-text}
		\RequirePackage{pstricks-add}
		\RequirePackage[active,tightpage]{preview}
		\PreviewEnvironment{pspicture}
		\setlength\PreviewBorder{0.1pt}
	\fi
}


%% * PGF/TikZ
%%   - Externalising
%%     - 'IF' for externalising
\newif\if@dlut@pgf@externalexpensive
\let\@dlut@pgf@externalexpensivetrue@orig=\@dlut@pgf@externalexpensivetrue

%%   - Command for switching on the externalising library
%%   ! Use \@dlut@pgf@externalexpensivetrue to externalise expensive figures
\def\@dlut@pgf@externalexpensivetrue{%
	\if@dlut@pstricks@fig
		\@dlut@pgf@externalexpensivefalse
	\else
	%% - Load \usepgfplotslibrary{external}, if it hasn't been loaded yet
	\@dlut@pgf@externalexpensivetrue@orig
	\tikzexternalize[
		prefix=Figs/pdf/pgf-ex-,
		export=false, %% needs to be activated individually
		mode=list and make,
		verbose IO=false,
		% export=true, %% FASTER FOR DEBUGGING
	]
	%% !!!
	%% Changed by Dazhi Jiang - 2010-09-20
	%% The following line is commented since the new definition of
	%% \tikzexternalize in PGF 2.0 cvs
	% {pgfplots}
	\tikzifexternalizing{%
		\nofiles
	}{}%
	\fi
}%


%% END: Graphics
%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%% 4. Spacing
%% Created by Dazhi Jiang,

%% END: Spacing
%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


%% Tmp

%% # TODO:10 2016-06-05 Make a key to control the indentation
%% * Indentation after the chapter
\indentafterchapter

%% * Floating parameters
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}

\endinput

%%
%% End of file `dlutthesis.cls'.

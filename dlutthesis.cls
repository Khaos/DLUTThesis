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
%%       - ToC


%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%% * Change Log
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
%% END: Initialization
%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%% B. Packages
%% Created by Dazhi Jiang, 2016-05-31 13:38:18 +0800 (Tue, 31 May 2016)

%% * PGF key
\RequirePackage{pgfkeys}  % Load Package 'pgfkeys'
\RequirePackage{pgfopts}  % Load Package 'pgfopts'

%% * IF*
\RequirePackage{ifthen}  % Load Package 'ifthen'
\RequirePackage{ifpdf}  % Load Package 'ifpdf'
\RequirePackage{ifxetex}  % Load Package 'ifxetex'

%% * Before 'ctex'
\RequirePackage{xltxtra}

%% * CTeX
\RequirePackage[fontset = adobe, UTF8, scheme = chinese, zihao = -4]{ctex}

%% * Paragraph style
\RequirePackage{indentfirst}

%% * Other font packages
\RequirePackage{CJKnumb}

%% END: Packages
%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%% C. The 'dlut' keys
%% Created by Dazhi Jiang, 2016-05-31 14:40:32 +0800 (Tue, 31 May 2016)

%% !!! A few comment
%% The 'chapterstyle' key saves the name of the current chapter style and can
%% be later used by another key, e.g., 'headstyle'. This ensures that the
%% default/original value of chapter style can be restored in case of unexpected
%% changes in other commands, such as commands for setting up the head styles

%% * The '\@dlut@chapter@style' macro saves the current chapter style, default
%%   value, 'default'
\def\@dlut@chapter@style{default}    % Initial chapter style: default

%% * The '\dlutset' command sets the dlut keys
\def\dlutset#1{\pgfkeys{/dlut/.cd,#1}}

%% * The '\dlut@opt@set' command is only called at preamble to set the class
%%   options
\def\dlut@opt@set#1{\pgfkeys{/dlutopt/.cd,#1}}

%% END: The 'dlut' keys
%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%% Outlines
%% 0. Import dlutthesis.cfg
%% 1. Font options
%% 2. Page layout
%% 3. Page styles
%% 4. Titles


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

%% END: Page Styles
%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%% 4. Titles
%% Created by Dazhi Jiang, 2016-05-31 05:43:46 +0800 (Tue, 31 May 2016)
%% # TODO: 2016-05-31 Define the title page

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

%% * Define title-page-related keys
\pgfkeys{%
    /dlut/.cd,
    %% - Elements for title page
    thesis/.code={\thesis{#1}\@dlut@titlepage@thesis@existtrue},
    title/.code={\title{#1}\@dlut@titlepage@title@existtrue},
    etitle/.code={\etitle{#1}\@dlut@titlepage@etitle@existtrue},
    author/.code={\author{#1}\@dlut@titlepage@author@existtrue},
    authorid/.code={\authorid{#1}\@dlut@titlepage@authorid@existtrue},
    supervisor/.code={\supervisor{#1}\@dlut@titlepage@supervisor@existtrue},
    major/.code={\major{#1}\@dlut@titlepage@major@existtrue},
    date/.code={\date{#1}\@dlut@titlepage@date@existtrue},
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
    titlepagestyle/.default=default,
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




%%   - Place
\@dlut@titlepage@element@define{place}
% \newcommand{\thesis}{{A thesis submitted for the major of}}
\@dlut@titlepage@element@group@define{place}


%% END: Titles
%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


%% Tmp
%% * Floating parameters
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}


\endinput

%%
%% End of file `dlutthesis.cls'.

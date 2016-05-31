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
\def\@dlut@chapter@style{default}	% Initial chapter style: default

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
\newif\if@dlut@titlepage@submittedtext@isdefined
\newif\if@dlut@titlepage@title@isdefined
\newif\if@dlut@titlepage@titleen@isdefined
\newif\if@dlut@titlepage@author@isdefined
\newif\if@dlut@titlepage@authorid@isdefined
\newif\if@dlut@titlepage@supervisor@isdefined
\newif\if@dlut@titlepage@collegeordept@isdefined
\newif\if@dlut@titlepage@date@isdefined
% \newif\if@dlut@titlepage@university@isdefined
% \newif\if@dlut@titlepage@universityen@isdefined

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

%% -*- Mode: LaTeX Memoir; tab-width: 4;

%% dlutthesis.cls    The LaTeX Class File for DLUT Doctor Thesis
%%
%% Created by Dazhi Jiang, 2016-05-27 13:23:39 +0800 (Fri, 27 May 2016)
%% Copyright (c) 2016 Dazhi Jiang All Rights Reserved.

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{dlutthesis}[2016/05/27 v0.0.1 Dalian University of Technology Template]
\def\version{v0.0.1}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions\relax
\LoadClass[a4paper]{memoir}


%% dlutthesis.cls segments
%% 0. Import dlutthesis.cfg
%% 1. Font options
%% 2. Page layout
%% 3. Page styles
%% 4. ToC

%% 1. Import and configure LaTeX packages.
%% 2. Define general-purpose LaTeX commands.
%% 3. Configure the imported packages, also extend LaTeX command in dlutthesis
%% 4. Draw the dlutthesis

%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%% 0. Import dlutthesis.cfg
%% Created by Dazhi Jiang,

%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%% 1. Font options
%% Created by Dazhi Jiang, 2016-05-29 21:30:05 +0800 (Sun, 29 May 2016)
%% 1.1 Before 'ctex'
\RequirePackage{xltxtra}

%% 1.2 CTeX
\RequirePackage[fontset = adobe, UTF8, scheme = chinese, zihao = -4]{ctex}

\RequirePackage{indentfirst}

%% 1.3 xeCJK options
\xeCJKsetup{CheckSingle = true, AutoFakeBold = true}

%% 1.4 Font settings
%% 1.4.1 English fonts
\setmainfont[Mapping=tex-text]{Times New Roman}
\setsansfont[Mapping=tex-text]{Arial}
\setmonofont{Consolas}
%% 1.4.2 CJK fonts
%%   Declare new font family
\setCJKfamilyfont{xkai}{STXingkai}

%% 1.5 Other font packages
\RequirePackage{CJKnumb}

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

\pagestyle{dlut}

%% END: Page Styles
%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%% 4. ToC
%% Created by Dazhi Jiang, 2016-05-30 21:57:32 +0800 (Mon, 30 May 2016)

%% * Set the default TOC depth
\maxtocdepth{subsection}    % include subsections in ToC


%% END: ToC
%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


%% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%% 4. Spacing
%% Created by Dazhi Jiang,


%% END: Spacing
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

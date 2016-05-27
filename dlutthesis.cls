%% -*- Mode: LaTeX Memoir; tab-width: 4;

%% dlutthesis.cls    The LaTeX Class File for DLUT Doctor Thesis
%%
%% Created by Dazhi Jiang, 2016-05-27 13:23:39 +0800 (Fri, 27 May 2016)
%% Copyright (c) 2016 Dazhi Jiang All Rights Reserved.

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{dlutthesis}[2016/05/27 v0.0.1 Dalian University of Technology Template]
\def\version{v0.0.1}
% \newif\ifdlut@bachelor\dlut@bachelorfalse
% \newif\ifdlut@master\dlut@masterfalse
% \newif\ifdlut@doctor\dlut@doctorfalse
% \newif\ifdlut@review\dlut@reviewfalse
% \newif\ifdlut@submit\dlut@submitfalse
% \DeclareOption{bachelor}{\dlut@bachelortrue}
% \DeclareOption{master}{\dlut@mastertrue}
% \DeclareOption{doctor}{\dlut@doctortrue}
% \DeclareOption{review}{\dlut@reviewtrue}
% \DeclareOption{submit}{\dlut@submittrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions\relax
\LoadClass[a4paper]{memoir}
% \ifdlut@bachelor\relax\else
%   \ifdlut@master\relax\else
%     \ifdlut@doctor\relax\else
%       \ClassError{dlutthesis}%
%       		{You have to specify one of thesis options: bachelor, master or doctor.}{}
%     \fi
%   \fi
% \fi

%% dlutthesis.cls segments
%% 0. Import dlutthesis.cfg
%% 1. Import and configure LaTeX packages.
%% 2. Define general-purpose LaTeX commands.
%% 3. Configure the imported packages, also extend LaTeX command in dlutthesis
%% 4. Draw the dlutthesis

%% ==================================================
%% 0. Import dlutthesis.cfg
%% ==================================================

\RequirePackage[UTF8, heading = true]{ctex}

\endinput

%%
%% End of file `dlutthesis.cls'.

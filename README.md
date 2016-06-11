# 大连理工大学博士论文模版

## 安装

## 使用说明

### 图表

#### pgf/tikz

本模板默认载入pgf系列宏包（其中包括pgf、tikz、pgfplots与pgfplotstable四个宏包）。这些
宏包提供了丰富的图形命令以满足论文写作中的作图需求。由于博士论文中往往插图较多，而这些插
图又多以pgf/tikz宏包来完成，那么如果不进行特殊的处理的话，则在写作进行当中，每次编译都
会将大量的时间消耗在绘图过程中。为了减少由此带来的影响，本模板提供了图形的预绘制接口，从
而加快写作中的编译过程。这部分接口基于pgf中的external库，详细使用方法以及在本模板中的调
用方式请参考

- [pgf文档](http://mirrors.ctan.org/graphics/pgf/base/doc/pgfmanual.pdf)
中Externalization Graphics一章，
- 文档类定义文件[dlutthesis.cls](https://github.com/Khaos/DLUTThesis/blob/master/dlutthesis.cls)中相关代码。

对于一般用户，可以忽略具体的实现细节，直接使用预绘制接口，使用方法如下：

1. 在主文档preamble部分指定主文档名称，例如

    ```latex
    \dlutset{pgf/externalmainfile=DLUTThesis}
    ```

2. 正文部分需要插入tikz图形的部分，以如下格式插入图形

    ```latex
    \begin{figure}[!htbp]
    	\centering
    	\dlutset{pgf/makenextfig=pdf-filename}
    	\input{tikz-filename.tikz}
    	\caption{...}
    	\label{fig:id}
    \end{figure}%
    ```

3. 预绘制图形（以xelatex命令为例）

    ```shell
    xelatex -shell-escape -halt-on-error -interaction=batchmode -jobname "pdf-filename" "DLUTThesis"
    ```

4. 主文档中插入图形

    ```shell
    xelatex -shell-escape DLUTThesis.tex
    ```


## 参考文献

- [大连理工大学研究生院 -- 论文模版](http://gs.dlut.edu.cn/info/1099/7743.htm)
- [dlutlatextemplate](http://code.google.com/p/dlutlatextemplate/)  根据大连理工大学研究生院提供的Word学位论文模版制作的LaTeX模版

## LICENSE

Copyright [2016] [Dazhi Jiang]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

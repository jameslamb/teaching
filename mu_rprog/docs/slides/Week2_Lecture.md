---
title       : ECON 6931 - R Programming
subtitle    : Week 2
author      : James Lamb
job         : Data Scientist | Uptake
logo        : 
framework   : io2012  # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [bootstrap]            # {mathjax, quiz}
mode        : selfcontained # {selfcontained, standalone, draft}
lib_cdn     : "https://cdn.rawgit.com/ramnathv/slidifyLibraries/master/inst/libraries"
knit        : slidify::knit2slides
--- .toc_slide &twocol

<script src="assets/js/footer_bubbles.js"></script>

<footer>
  <hr></hr>
  <span style="float:right">ECON 6931 - R Programming</span>
</footer>

<h2>Contents</h2>

*** =left

<b class="toc_header"> I. Using External Packages </b>
<ol class="toc" type="none">
    <li> Loading Installed Packages <span style="float:right"> 5 </span></li>
    <li> Installing from CRAN       <span style="float:right"> 6 </span></li>
    <li> Installing from GitHub     <span style="float:right"> 7 </span></li>
    <li> library() vs. require()    <span style="float:right"> 8 </span></li>
    <li> Namespacing Calls          <span style="float:right"> 9 </span></li>
</ol>

<b class="toc_header"> II. Fitting Regressions in R </b>
<ol class = "toc" type="none">
    <li> OLS with lm()                       <span style="float:right"> 11  </span></li>
    <li> Getting Stuff from the Model Object <span style="float:right"> 12 </span></li>
    <li> Diagnostic Plots                    <span style="float:right"> 13 </span></li>
    <li> Logistic Regression                 <span style="float:right"> 14 </span></li>
    <li> Predicting On New Data              <span style="float:right"> 15 </span></li>
</ol>

*** =right

<b class="toc_header"> III. Subsetting </b>
<ol class = "toc" type="none">
    <li> Subsetting Vectors    <span style="float:right"> 17 </span></li>
    <li> Subsetting Dataframes <span style="float:right"> 18 </span></li>
    <li> Lists                 <span style="float:right"> 19 </span></li>
    <li> Using Logical Vectors <span style="float:right"> 20 </span></li>
</ol>

<b class="toc_header"> IV. Working with Files </b>
<ol class = "toc" type="none">
    <li> Disk vs. RAM                <span style="float:right"> 22 </span></li>
    <li> Structured: Delimited files <span style="float:right"> 23 </span></li>
    <li> Semi-structured: JSON files <span style="float:right"> 24 </span></li>
    <li> Unstructured: Text files    <span style="float:right"> 25 </span></li> 
</ol>

--- .toc_slide &twocol

<footer>
  <hr></hr>
  <span style="float:right"> ECON 6931 - R Programming </span>
</footer>

<h2>Contents</h2>

*** =left

<b class="toc_header"> V. Introduction to data.table </b>
<ol class="toc" type="none">
    <li> A Fast Data Frame...        <span style="float:right"> 27 </span></li>
    <li> With Beautiful Syntax... <span style="float:right"> 28 </span></li>
    <li> That's Super Fun to Use  <span style="float:right"> 29 </span></li>
</ol>

<b class="toc_header"> VI. User-defined Functions </b>
<ol class = "toc" type="none">
    <li> UDF Examples                  <span style="float:right"> 31 </span></li>
    <li> Functions That Return Stuff   <span style="float:right"> 32 </span></li>
    <li> Functions That Return Nothing <span style="float:right"> 33 </span></li>
    <li> Brief Review of Scoping       <span style="float:right"> 34 </span></li>
    <li> Sourcing Helper Functions     <span style="float:right"> 35 </span></li>
</ol>

*** =right

<b class="toc_header"> VII. Debugging Strategies </b>
<ol class = "toc">
    <li> Print Debugging        <span style="float:right"> 37 </span></li>
    <li> Building an MWE        <span style="float:right"> 38 </span></li>
    <li> Built-in Docs with "?" <span style="float:right"> 39 </span></li>
    <li> Package Vignettes      <span style="float:right"> 40 </span></li>
    <li> Looking at Source Code <span style="float:right"> 41 </span></li>
    <li> Googling Around        <span style="float:right"> 42 </span></li>
</ol>

--- .section_slide

<h2>Section I.</h2>
<hr></hr>
</br></br></br>
<h2>Installing and Using External Packages</h2>

--- .content_slide

<footer>
  <hr>
    <script>FooterBubbles(1,5)</script>I. Using External Packages<span style="float:right">ECON 6931 - R Programming</span>
</footer>

<h2>Loading Installed Packages</h2>

--- .content_slide

<footer>
  <hr>
    <script>FooterBubbles(2,5)</script>I. Using External Packages<span style="float:right">ECON 6931 - R Programming</span>
</footer>

<h2>Installing from CRAN</h2>

--- .content_slide

<footer>
  <hr>
    <script>FooterBubbles(3,5)</script>I. Using External Packages<span style="float:right">ECON 6931 - R Programming</span>
</footer>

<h2>Installing from GitHub</h2>

--- .content_slide

<footer>
  <hr>
    <script>FooterBubbles(4,5)</script>I. Using External Packages<span style="float:right">ECON 6931 - R Programming</span>
</footer>

<h2>library() vs. require()</h2>

--- .content_slide

<footer>
  <hr>
    <script>FooterBubbles(5,5)</script>I. Using External Packages<span style="float:right">ECON 6931 - R Programming</span>
</footer>

<h2>Namespacing Calls</h2>

--- .section_slide

<h2>Section II.</h2>
<hr></hr>
</br></br></br>
<h2>Regression Analysis in R</h2>

--- .content_slide

<footer>
  <hr>
    <script>FooterBubbles(1,5)</script>II. Fitting Regressions in R<span style="float:right">ECON 6931 - R Programming</span>
</footer>

<h2>OLS with lm()</h2>

--- .content_slide

<footer>
  <hr>
    <script>FooterBubbles(2,5)</script>II. Fitting Regressions in R<span style="float:right">ECON 6931 - R Programming</span>
</footer>

<h2>Getting Stuff From the Model Object</h2>

--- .content_slide

<footer>
  <hr>
    <script>FooterBubbles(3,5)</script>II. Fitting Regressions in R<span style="float:right">ECON 6931 - R Programming</span>
</footer>

<h2>Diagnostic Plots</h2>

--- .content_slide

<footer>
  <hr>
    <script>FooterBubbles(4,5)</script>II. Fitting Regressions in R<span style="float:right">ECON 6931 - R Programming</span>
</footer>

<h2>Logistic Regression</h2>

--- .content_slide

<footer>
  <hr>
    <script>FooterBubbles(5,5)</script>II. Fitting Regressions in R<span style="float:right">ECON 6931 - R Programming</span>
</footer>

<h2>Predicting On New Data</h2>

--- .section_slide

<h2>Section III.</h2>
<hr></hr>
</br></br></br>
<h2>Subsetting</h2>

--- .content_slide

<footer>
  <hr>
    <script>FooterBubbles(1,4)</script>III. Subsetting<span style="float:right">ECON 6931 - R Programming</span>
</footer>

<h2>Subsetting Vectors</h2>

--- .content_slide

<footer>
  <hr>
    <script>FooterBubbles(2,4)</script>III. Subsetting<span style="float:right">ECON 6931 - R Programming</span>
</footer>

<h2>Subsetting Dataframes</h2>

--- .content_slide

<footer>
  <hr>
    <script>FooterBubbles(3,4)</script>III. Subsetting<span style="float:right">ECON 6931 - R Programming</span>
</footer>

<h2>Subsetting Lists</h2>

--- .content_slide

<footer>
  <hr>
    <script>FooterBubbles(4,4)</script>III. Subsetting<span style="float:right">ECON 6931 - R Programming</span>
</footer>

<h2>Using Logical Vectors</h2>

--- .section_slide

<h2>Section IV.</h2>
<hr></hr>
</br></br></br>
<h2>Working with Files</h2>

--- .content_slide

<footer>
  <hr>
    <script>FooterBubbles(1,4)</script>IV. Working with Files<span style="float:right">ECON 6931 - R Programming</span>
</footer>

<h2>Disk vs. RAM</h2>

--- .content_slide

<footer>
  <hr>
    <script>FooterBubbles(2,4)</script>IV. Working with Files<span style="float:right">ECON 6931 - R Programming</span>
</footer>

<h2>Structured: Delimited Files</h2>

--- .content_slide

<footer>
  <hr>
    <script>FooterBubbles(3,4)</script>IV. Working with Files<span style="float:right">ECON 6931 - R Programming</span>
</footer>

<h2>Semi-Structured: JSON Files</h2>

--- .content_slide

<footer>
  <hr>
    <script>FooterBubbles(4,4)</script>IV. Working with Files<span style="float:right">ECON 6931 - R Programming</span>
</footer>

<h2>Unstructured: Text files</h2>

--- .section_slide

<h2>Section V.</h2>
<hr></hr>
</br></br></br>
<h2>Introduction to data.table</h2>

--- .content_slide

<footer>
  <hr>
    <script>FooterBubbles(1,3)</script>V. Introduction to data.table<span style="float:right">ECON 6931 - R Programming</span>
</footer>

<h2>A Fast Data Frame...</h2>

--- .content_slide

<footer>
  <hr>
    <script>FooterBubbles(2,3)</script>V. Introduction to data.table<span style="float:right">ECON 6931 - R Programming</span>
</footer>

<h2>With a Beautiful Syntax</h2>

--- .content_slide

<footer>
  <hr>
    <script>FooterBubbles(3,3)</script>V. Introduction to data.table<span style="float:right">ECON 6931 - R Programming</span>
</footer>

<h2>That is Super Fun to Use</h2>

--- .section_slide

<h2>Section VI.</h2>
<hr></hr>
</br></br></br>
<h2>User-defined Functions</h2>

--- .content_slide

<footer>
  <hr>
    <script>FooterBubbles(1,5)</script>VI. User-defined Functions<span style="float:right">ECON 6931 - R Programming</span>
</footer>

<h2>UDF Examples</h2>

--- .content_slide

<footer>
  <hr>
    <script>FooterBubbles(2,5)</script>VI. User-defined Functions<span style="float:right">ECON 6931 - R Programming</span>
</footer>

<h2>Functions That Return Stuff</h2>

--- .content_slide

<footer>
  <hr>
    <script>FooterBubbles(3,5)</script>VI. User-defined Functions<span style="float:right">ECON 6931 - R Programming</span>
</footer>

<h2>Functions That REturn Nothing</h2>

--- .content_slide

<footer>
  <hr>
    <script>FooterBubbles(4,5)</script>VI. User-defined Functions<span style="float:right">ECON 6931 - R Programming</span>
</footer>

<h2>Brief Review of Scoping</h2>

--- .content_slide

<footer>
  <hr>
    <script>FooterBubbles(5,5)</script>VI. User-defined Functions<span style="float:right">ECON 6931 - R Programming</span>
</footer>

<h2>Sourcing Helper Functions</h2>

--- .section_slide

<h2>Section VII.</h2>
<hr></hr>
</br></br></br>
<h2>Debugging Strategies</h2>

--- .content_slide

<footer>
  <hr>
    <script>FooterBubbles(1,6)</script>VII. Debugging Strategies<span style="float:right">ECON 6931 - R Programming</span>
</footer>

<h2>Print Debugging</h2>

--- .content_slide

<footer>
  <hr>
    <script>FooterBubbles(2,6)</script>VII. Debugging Strategies<span style="float:right">ECON 6931 - R Programming</span>
</footer>

<h2>Building an MWE</h2>

--- .content_slide

<footer>
  <hr>
    <script>FooterBubbles(3,6)</script>VII. Debugging Strategies<span style="float:right">ECON 6931 - R Programming</span>
</footer>

<h2>Built-in Docs with "?"</h2>

--- .content_slide

<footer>
  <hr>
    <script>FooterBubbles(4,6)</script>VII. Debugging Strategies<span style="float:right">ECON 6931 - R Programming</span>
</footer>

<h2>Package Vignettes</h2>

--- .content_slide

<footer>
  <hr>
    <script>FooterBubbles(5,6)</script>VII. Debugging Strategies<span style="float:right">ECON 6931 - R Programming</span>
</footer>

<h2>Looking at Source Code</h2>

--- .content_slide

<footer>
  <hr>
    <script>FooterBubbles(6,6)</script>VII. Debugging Strategies<span style="float:right">ECON 6931 - R Programming</span>
</footer>

<h2>Googling Around</h2>


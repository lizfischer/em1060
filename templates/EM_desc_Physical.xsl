<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="tei" version="1.0" xmlns="http://www.w3.org/1999/xhtml"
  xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output doctype-public="-//W3C//DTD XHTML 1.1//EN"
    doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd" encoding="iso8859-1" indent="yes"
    method="html"/>
	


<!-- WEBSITE STRUCTURE ============================== -->
<!-- ========================================================== -->
<xsl:template match="/tei:TEI">
<html xml:lang="en" xmlns="http://www.w3.org/1999/xhtml">
      <xsl:comment>NOTE: THIS FILE HAS BEEN GENERATED FROM A TEI XML ORIGINAL</xsl:comment>
      <head>
      <!-- Making a title for the website. -->
        <title>
          <!-- Take first title from file -->
		<xsl:value-of select="//tei:msIdentifier/tei:settlement"/><xsl:text>, </xsl:text>
		<xsl:value-of select="//tei:msIdentifier/tei:repository"/>, 
		<xsl:value-of select="//tei:msIdentifier/tei:collection"/>
        	      <xsl:value-of select="normalize-space(tei:msIdentifier/tei:collection[node()])"/><xsl:text> </xsl:text>
        	<xsl:value-of select="//tei:msIdentifier/tei:idno"/> 
        	
        	<xsl:value-of select="//tei:msIdentifier/tei:altIdentifier/tei:settlement[node()]"/> 
        	<xsl:value-of select="//tei:msIdentifier/tei:altIdentifier/tei:repository[node()]"/> 
        	<xsl:value-of select="//tei:msIdentifier/tei:altIdentifier/tei:idno"/> - 
        	
		<xsl:value-of select="//tei:title[1]"/>
        </title>
	<link rel="stylesheet" href="../styles/menu.css" type="text/css" />
      	<link rel="stylesheet" href="../styles/desc.css" type="text/css" />
      	<link rel="icon" type="image/x-icon" href="../favicon.ico" />
       	<SCRIPT language="Javascript1.2" src="../java/menu_desc.js" type="text/javascript"></SCRIPT>
    <!-- <SCRIPT language="Javascript1.2" src="../java/password.js" type="text/javascript"></SCRIPT> --> 
      </head>
      
    	<body>
		<!-- Output first title as level 1 heading-->
<div id="masthead">
<img class="em-logo" src="../images/logos/titlepage.jpg" alt="The Production and Use of English Manuscripts 1060 to 1220"/>
<div id="masthead_print">
Edited by Orietta Da Rold, Takako Kato, Mary Swan and Elaine Treharne<br/>
(University of Leicester, 2010; last update 2013)<br/> 
http://www.le.ac.uk/ee/em1060to1220, ISBN 095323195X
</div>
</div>
    				
    	  
    	  <!-- from here Google thingy -->
      <div id="searchBox">
         

<form action="http://www.le.ac.uk/english/em1060to1220/SearchResults.htm" id="searchbox_001739443377901823203:50sw0v5k-mk">
  <input type="hidden" name="cx" value="001739443377901823203:50sw0v5k-mk" />
  <input type="hidden" name="cof" value="FORID:11" />
  
  <div id="google-search"><input type="text" name="q" size="32%" /></div>
  <div class="google-button"><input class="right_small" type="submit" name="sa" value="Search our e-book" /></div>
</form>
<script type="text/javascript" src="../java/brand.js"></script>

</div>
      
      <div id="content_desc">
         	
         
         <!-- to here-->
           <!-- Apply any other templates -->
           <xsl:apply-templates/>
    		</div>
      </body>
</html>
</xsl:template>

  <!-- Do not display teiHeader, etc. -->
  <xsl:template match="tei:teiHeader |tei:msIdentifier"/>
  
  <!-- Pass through text and body, etc. -->
  <xsl:template match="tei:text | tei:body ">
    <xsl:apply-templates/>
  </xsl:template>

  <!-- Match any msDesc, but put the heading to the left upper corner, and the left column -->
<xsl:template match="tei:msDesc">
	
<p class="right"><a name="top"/>
<a href="../index.htm">The Production and Use of English Manuscripts 1060 to 1220</a></p>
<p class="author"><xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:author"/></p>

	<h1 class="ident">
      <xsl:call-template name="makeIdentifier"/>
	</h1>

  <!-- ============================================== -->
  <!-- NAVIGATION BAR, LEFT-->
<div id="left_desc">
<h1 class="left"><a class="right_nav" href="#top">
<xsl:value-of select="//tei:msIdentifier/tei:settlement"/>,
<xsl:value-of select="//tei:msIdentifier/tei:repository"/>,
<xsl:value-of select="normalize-space(tei:msIdentifier/tei:collection[node()])"/><xsl:text> </xsl:text>
<xsl:value-of select="//tei:msIdentifier/tei:idno"/>
<xsl:value-of select="//tei:msIdentifier/tei:note"/>


        	<xsl:value-of select="//tei:msIdentifier/tei:altIdentifier/tei:settlement[node()]"/> 
        	<xsl:value-of select="//tei:msIdentifier/tei:altIdentifier/tei:repository[node()]"/> 
        	<xsl:value-of select="//tei:msIdentifier/tei:altIdentifier/tei:collection[node()]"/> 
	<xsl:value-of select="//tei:msIdentifier/tei:altIdentifier/tei:idno"/>
</a>
</h1>
	
<ul class="toc">
      <xsl:apply-templates mode="toc"/>
</ul>
<p class="right_nav"> 
	<a href="../index.htm">
	<img width="60%" border="0" position="right" src="../images/logos/em.jpg" 
		alt="The Production and Use of English Manuscripts: 1060 to 1220"/>
	</a>
</p>

<p class="right_nav">&#169; 2010-13 The Production and Use of <br/>
  English Manuscripts 1060 to 1220 |<br/>
  Ed. by ODR, TK, MS &amp; ET,
  ISBN 095323195X |<br/> 
</p>
<p class="right_nav">
Back to <a href="../catalogue/mss.htm">List of MSS and Descriptions</a>
</p>
  
</div>

		
	<xsl:apply-templates/>
</xsl:template>
	
<!-- Manuscript description heading  ==========================  -->
<!-- =========================================================== -->
  <xsl:template match="tei:msDesc/tei:head">
    <h2>
      <xsl:apply-templates select="tei:title"/>
    </h2>
    <h3>Date: 
    	<xsl:apply-templates select="tei:date" /><br/>
    	<span class="date_note"><xsl:apply-templates select="note"/></span>
    </h3>
  </xsl:template>

<!-- I. -->
<!-- msContents, summary then all msItems  =========================-->
<!-- =============================================================== -->
  <xsl:template match="tei:msContents">
    <xsl:apply-templates select="tei:summary"/>
    <h3>Manuscript Items:</h3>
  		

<!-- Use <p n="marker"> for divisions in the ms ================================== -->
<!-- =========================================================== -->
  <ol>
	<xsl:apply-templates select="tei:p[@n='marker']|tei:msItem|tei:note[@type='marker']"/>
  </ol>
  </xsl:template>

  <xsl:template match="tei:p[@n='marker']">
    <strong><xsl:apply-templates/></strong>
  </xsl:template>
	
  <xsl:template match="tei:note[@type='marker']">: <xsl:apply-templates/></xsl:template>
	
	
  <!-- Do not display NOTES TO TK, etc. -->
  <xsl:template match="tei:note[@type='TK']"/>
  
<!-- Summary - make ID and then output ======================= -->
<!-- ========================================================== -->
  <xsl:template match="tei:msContents/tei:summary">
    <h3><xsl:call-template name="makeID"/>Summary:</h3>
    <p>
      <xsl:apply-templates/>
    </p>
  </xsl:template>


<!-- msItem ================================================ -->
<!-- =========================================================== -->
<!--  msItem - make ID then output -->
  <xsl:template match="tei:msItem">
    <li class="msItem">
      <xsl:call-template name="makeID"/>
      <span class="itemHeading">Item</span>: 
      <!-- <xsl:if test="@n"> (<xsl:value-of select="@n"/>)</xsl:if> 
       <xsl:if test="@rend"> (<xsl:value-of select="@rend"/>)</xsl:if>-->

      <xsl:text>   </xsl:text>
      <xsl:apply-templates select="tei:locus"/> <!-- <xsl:apply-templates select="tei:alt"/> -->
    	<ul>
        <!-- Apply only set templates inside msItem -->
            <xsl:apply-templates select="tei:p[@type='marker']"/>
        <xsl:apply-templates select="tei:title"/>
        <xsl:apply-templates select="tei:date"/>
        <xsl:apply-templates select="tei:rubric[@type='initial']"/>
        <xsl:apply-templates select="tei:rubric[@type='medial']"/>
	<xsl:apply-templates select="tei:incipit"/>
        <xsl:apply-templates select="tei:explicit"/>
        <xsl:apply-templates select="tei:rubric[@type='final']"/>
         <xsl:apply-templates select="tei:colophon"/>
        <xsl:apply-templates select="tei:q"/>
        <xsl:apply-templates select="tei:quote"/>
        <xsl:apply-templates select="tei:textLang"/>
        <xsl:apply-templates select="tei:filiation"/>
        <xsl:apply-templates select="tei:note"/>
         <xsl:apply-templates select="tei:decoNote"/>     	
        <xsl:apply-templates select="tei:listBibl"/>
      </ul>
    </li>
  </xsl:template>

  <!--  Each of the items, only if there (do not provide empty
  elements if there is nothing to put in them)  -->
  
  <!-- 
	<xsl:template match="tei:msItem/tei:alt[node()]">
	    [<xsl:apply-templates/>]
	</xsl:template>
  -->
  
		<xsl:template match="tei:msItem/tei:p[node()][@type='marker']">
	    <p>
	      <span class="itemHeading">
	      <xsl:apply-templates/></span>
	    </p>
		</xsl:template>
  
  
<!-- to display the Cameron number, from here: -->
  <xsl:template match="tei:msItem/tei:title[node()][@type='uniform']">
    <p></p>
    <span class="itemHeading">Title</span>
    <xsl:if test="@xml:id"> 
      (<a href="../catalogue/IndexTexts.htm#{@xml:id}"><xsl:value-of
      select="@xml:id"/></a>)</xsl:if>: <xsl:apply-templates/></xsl:template>
  
  <xsl:template match="tei:title[node()][@type='sub']">: <xsl:apply-templates/></xsl:template>
  
   <xsl:template match="tei:msItem/tei:title[node()][@type='supplied']">
    <p></p>
    <span class="itemHeading">Title</span>
    <xsl:if test="@xml:id"> 
      (<a href="../catalogue/IndexTexts.htm#{@xml:id}"><xsl:value-of
      select="@xml:id"/></a>)</xsl:if>: <xsl:apply-templates/></xsl:template>
  <!-- to display the Cameron number, to here: -->
  
  
  <!--
	<xsl:template match="tei:msItem/tei:title[node()][@type='supplied']">
	    <p></p>
	      <span class="itemHeading">Title</span> (supplied): 
	      <xsl:apply-templates/></xsl:template>
  -->
  <xsl:template match="tei:msItem/tei:title[node()][@type='other']">
    <p>
      <span class="itemHeading">Title</span>: 
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  
	<xsl:template match="tei:msItem/tei:title[node()][@type='ms']">
	    <p>
	      <span class="itemHeading">Title</span> (manuscript): 
	      <xsl:apply-templates/>
	    </p>
	</xsl:template>
	<xsl:template match="tei:msItem/tei:title/tei:locus[node()]">
			<span class="small">(<xsl:apply-templates/>) </span>
	</xsl:template>
	<!-- LOocus within decoNote within msItem, enter ":" after the folio or page number ====================== -->
	<xsl:template match="tei:msItem/tei:decoNote/tei:list/tei:item/tei:locus[node()]">
			<span class="small"><xsl:apply-templates/>: </span>
	</xsl:template>
		<!-- We no longer provide short titles -->
		<xsl:template match="tei:msItem/tei:title[@type='short']"/>
	
	<xsl:template match="tei:msItem/tei:rubric[@type='initial']">
	    <p>
	      <span class="itemHeading">Rubric</span> (initial): 
	    	<xsl:apply-templates/>
	    </p>
	</xsl:template>
	<xsl:template match="tei:msItem/tei:rubric/tei:locus[node()]">
			<span class="small">(<xsl:apply-templates/>) </span>
	</xsl:template>
	<xsl:template match="tei:msItem/tei:incipit[node()][@xml:lang='en']">
	    <p>
	      <span class="itemHeading">Incipit</span>: 
	      <xsl:apply-templates/>
	    </p>
	</xsl:template>
	 <xsl:template match="tei:msItem/tei:incipit[node()][@xml:lang='lt']">
	    <p>
	      <span class="itemHeading">Incipit</span> (Latin): 
	      <xsl:apply-templates/>
	    </p>
	 </xsl:template>
	<xsl:template match="tei:msItem/tei:incipit[node()][@xml:lang='fr']">
	    <p>
	      <span class="itemHeading">Incipit</span> (French): 
	      <xsl:apply-templates/>
	    </p>
	</xsl:template>
	<xsl:template match="tei:msItem/tei:incipit/tei:locus[node()]">
			<span class="small">(<xsl:apply-templates/>) </span>
	</xsl:template>

	<xsl:template match="tei:msItem/tei:rubric[node()][@type='medial']">
	    <p>
	      <span class="itemHeading">Rubric</span> (medial): 
	      <xsl:apply-templates/>
	    </p>
	</xsl:template>
	<xsl:template match="tei:msItem/tei:incipit/tei:locus[node()]">
			<span class="small">(<xsl:apply-templates/>) </span>
	</xsl:template>
	
	
	<xsl:template match="tei:msItem/tei:explicit[node()][@xml:lang='en']">
	    <p>
	      <span class="itemHeading">Explicit</span>: 
	      <xsl:apply-templates/>
	    </p>
	</xsl:template>
	<xsl:template match="tei:msItem/tei:explicit[node()][@xml:lang='lt']">
	    <p>
	      <span class="itemHeading">Explicit</span> (Latin): <xsl:apply-templates/>
	    </p>
	</xsl:template>
	<xsl:template match="tei:msItem/tei:explicit[node()][@xml:lang='fr']">
	    <p>
	      <span class="itemHeading">Explicit</span> (French): 
	      <xsl:apply-templates/>
	    </p>
	</xsl:template>
	<xsl:template match="tei:msItem/tei:explicit/tei:locus[node()]">
			<span class="small">(<xsl:apply-templates/>) </span>
	</xsl:template>
	
		<xsl:template match="tei:msItem/tei:rubric[@type='final'][node()]">
	    <p>
	      <span class="itemHeading">Rubric</span> (final): 
	    	<xsl:apply-templates/>
	    </p>
	</xsl:template>
	<xsl:template match="tei:msItem/tei:rubric/tei:locus[node()]">
			<span class="small">(<xsl:apply-templates/>) </span>
	</xsl:template>
	
	
	
	<xsl:template match="tei:msItem/tei:colophon[node()][@xml:lang='en']">
	<p>
	      <span class="itemHeading">Colophon: </span>
	      <xsl:apply-templates/>
	    </p>
	</xsl:template>
	<xsl:template match="tei:msItem/tei:colophon[node()][@xml:lang='lt']">
	    <p>
	      <span class="itemHeading">Colophon (Latin): </span>
	      <xsl:apply-templates/>
	    </p>
	</xsl:template>
	<xsl:template match="tei:msItem/tei:colophon[node()][@xml:lang='fr']">
	    <p>
	      <span class="itemHeading">Colophon (French): </span>
	      <xsl:apply-templates/>
	    </p>
	</xsl:template>
	<xsl:template match="tei:msItem/tei:colophon/tei:locus[node()]">
			<span class="small">(<xsl:apply-templates/>) </span>
	</xsl:template>
	
	<xsl:template match="tei:msItem/tei:quote[node()]">
	    <p>
	      <span class="itemHeading">Addition</span>: 
	      <xsl:apply-templates/>
	    </p>
	</xsl:template>
  
    	<xsl:template match="tei:msItem/tei:quote/tei:locus[node()]">
			<span class="small">(<xsl:apply-templates/>) </span>
    	</xsl:template>
  
  	<xsl:template match="tei:msItem/tei:quote/tei:p/tei:locus[node()]">
			<span class="small">(<xsl:apply-templates/>) </span>
	</xsl:template>
  
<!-- Where you want to list few additions in one msItem, use <locus> as the heading, within the <list> for listing the additions. -->
	<xsl:template match="tei:msItem/tei:quote/tei:list/tei:item/tei:locus">	
	
	<span class="itemHeading">
      	<xsl:apply-templates/>
	</span><xsl:text>: </xsl:text> 
	
	</xsl:template>
	
	<xsl:template match="tei:msItem/tei:textLang[node()]">
	    <p>
	      <span class="itemHeading">Text Language</span>: 
	      <xsl:apply-templates/>
	    </p>
	</xsl:template>
	
	<xsl:template match="tei:msItem/tei:filiation[node()]">
	    <p>
	      <span class="itemHeading">Other versions of the text</span>: 
	      <xsl:apply-templates/>
	    </p>
	</xsl:template>
	
	<!-- Output notes in various aspects of the Item. -->
	<xsl:template match="tei:msItem/tei:note[node()][@type='date']">
	    <p>
	      <span class="itemHeading">Date</span>: 
	      <xsl:apply-templates/>
	    </p>
	</xsl:template>
	
	<xsl:template match="tei:msItem/tei:note[node()][@type='hand']">
	    <p>
	      <span class="itemHeading">Hand</span>: 
	      <xsl:apply-templates/>
	    </p>
	</xsl:template>

  <xsl:template match="tei:note[node()][@type='footnote']">
    (<xsl:apply-templates/>)
  </xsl:template>



	<xsl:template match="tei:msItem/tei:note[node()][@type='main']">
	    <p>
	      <span class="itemHeading">Note</span>: 
	      <xsl:apply-templates/>
	      <xsl:if test="@resp"> <xsl:text> </xsl:text><xsl:text> </xsl:text>
	      			<span class="resp">[<xsl:value-of select="@resp"/>]</span></xsl:if>
	    </p>
	</xsl:template>
	
	<xsl:template match="tei:msItem/tei:decoNote[node()]">
	  	<p>
	      <span class="itemHeading">Decoration</span>: 
	      <xsl:apply-templates/>
	  	</p>
	</xsl:template>
  
  

<!-- II. -->
<!-- PhysDesc ================================================= -->
<!-- ==============================================================  -->
  <xsl:template match="tei:physDesc">
    <h3><xsl:call-template name="makeID"/>Physical Description:</h3>
    <xsl:apply-templates/>
  </xsl:template>

<!-- II. 1. -->
<!-- objectDesc ==================================================== -->
<!-- ============================================================= -->

<!-- Object 1: Form: include @form if there is one -->
  <xsl:template match="tei:objectDesc">
    <h4><xsl:call-template name="makeID_noNO"/>Object Description:</h4>
      <xsl:if test="@form">
         <p class="totheright"><span class="itemHeading">Form: </span><xsl:value-of select="@form"/></p>
      </xsl:if>
      <xsl:apply-templates/>
  </xsl:template>


<!-- Object 2: Support: under supportDesc -->
  <xsl:template match="tei:support">
    <p class="totheright">
      <span class="itemHeading">Support: </span>
      <xsl:apply-templates/>
    </p>
  </xsl:template>
	
  <xsl:template match="tei:support/tei:p">
  <p class="totheright">
  	<xsl:apply-templates/>
  	</p>
  </xsl:template>
	
<xsl:template match="tei:supportDesc//tei:list">
  	<blockquote><ul>
      <xsl:apply-templates/>
  	</ul></blockquote>
 </xsl:template>


<!-- Object 3: Extent -->
  <xsl:template match="tei:extent">
    <p class="totheright">
      <span class="itemHeading">Extent: </span>
      <xsl:apply-templates/>
    </p>
  </xsl:template>

	  <!-- General purpose dimensions template -->
	  <xsl:template match="tei:dimensions">
	    	<blockquote><ul>
	  	<xsl:value-of select="tei:height"/> mm
	  	<xsl:text> x </xsl:text>
	    <xsl:value-of select="tei:width"/> mm
	    <xsl:if test="@scope| @type"> (dimensions of <xsl:value-of select="@scope"/> - size of <xsl:value-of select="@type"/>)</xsl:if>
	  </ul></blockquote>
	  </xsl:template>

<!-- Object 4: Foliation and/or Pagination: foliation  -->
  <xsl:template match="tei:foliation">
    <p class="totheright">
      <span class="itemHeading">Foliation and/or Pagination: </span>
      <xsl:apply-templates/>
    </p>
  </xsl:template>

  <xsl:template match="tei:foliation/tei:p">
    	<p class="totheright">
      <xsl:apply-templates/>
    </p>
  </xsl:template>


 <!-- Object 5: Collation -->
  <xsl:template match="tei:collation">
    <p class="totheright"><span class="itemHeading">Collation: </span>
      <xsl:apply-templates/>
    </p>
  </xsl:template>

  <xsl:template match="tei:collation/tei:p[@n='description']">
    	<p class="totheright">
      <xsl:apply-templates/>
    </p>
  </xsl:template>
	
<!-- Quire structure: -->
<xsl:template match="tei:collation//tei:p[@n='quires']">
    <ul>
      <span class="itemHeading">Quires: </span>
      <xsl:apply-templates/>
    </ul>
	</xsl:template>
	
  <!-- If the quire structure needs to be explained in several blocks, then 
  	use <date> as the heading for the quire structures, and
  	use <list> for listing the quire structure. -->
	
	
<xsl:template match="tei:collation//tei:date">
	<p class="totheright_2">
	  	    <!-- Generate date ID first -->
 <xsl:if test="@xml:id">
        <xsl:attribute name="id">
          <xsl:value-of select="@xml:id"/>
        </xsl:attribute>	
 </xsl:if>
	<span class="itemHeading">
      <xsl:apply-templates/>
	</span>
	</p>
	</xsl:template>
  
  <!-- Note within the list within the collation -->
	<xsl:template match="tei:collation//tei:list/tei:note">
  	<blockquote>
      <xsl:apply-templates/>
  	</blockquote>
	</xsl:template>

  <!-- Signatures -->
  <xsl:template match="tei:signatures">
    <ul>
      <span class="itemHeading">Signatures: </span>
      <xsl:apply-templates/>
    </ul>
  </xsl:template>

  <!--  Catchwords -->
  <xsl:template match="tei:catchwords">
    <ul>
      <span class="itemHeading">Catchwords: </span>
      <xsl:apply-templates/>
    </ul>
  </xsl:template>
	
  <!-- Diagram: if a paragraph of explanation is required, see below  -->
  <xsl:template match="tei:collation/tei:p[node()][@n='diagram']">
    <ul><span class="itemHeading">Diagram: </span>
      <xsl:apply-templates/>
    </ul>
  </xsl:template>
	
<!-- Condition -->
  
  <xsl:template match="tei:objectDesc/tei:supportDesc/tei:condition[node()]">
    <p class="totheright">
      <span class="itemHeading">Condition: </span>
      <xsl:apply-templates/>
    </p>
 </xsl:template>
  <xsl:template match="tei:condition/tei:p">
    <p class="totheright_2">
      <xsl:apply-templates/>
    </p>
  </xsl:template>
 <!-- Object 6: Summary -->
  <xsl:template match="tei:objectDesc/tei:supportDesc/tei:p[@n='summary']">
    <p class="totheright"><span class="itemHeading">Note: </span>
      <ul><xsl:apply-templates/></ul>
    </p>
  </xsl:template>

<!-- Object 7: layoutDesc ================================================-->
  <!--  Output Layout description  -->
  <xsl:template match="tei:objectDesc/tei:layoutDesc">
    <xsl:apply-templates select="tei:layoutDesc"/>
  <p class="totheright">
      <span class="itemHeading">Layout description: </span>
    <ol>
      <xsl:apply-templates select="tei:layout"/>
    </ol>
  
    <ul>
      <xsl:apply-templates select="tei:p"/>
  </ul>
  </p>
  </xsl:template>
  
 
  <xsl:template match="tei:layoutDesc/tei:layout">
   
        <li class="msItem">
        <span class="itemHeading">Layout: </span>  
        </li>
   
    
      <ul>
        <xsl:if test="@xml:id">
          <li>
            <span class="itemHeading">Layout type: </span>
            <xsl:value-of select="@xml:id"/>
          </li>
        </xsl:if>
        <xsl:if test="@columns">
          <li>
            <span class="itemHeading">Columns: </span>
            <xsl:value-of select="@columns"/>
          </li>
        </xsl:if>
        <xsl:if test="@writtenLines">
          <li>
            <span class="itemHeading">Written Lines: </span>
            <xsl:value-of select="@writtenLines"/>
          </li>
        </xsl:if>
        <xsl:apply-templates/>
      </ul>
 
  </xsl:template>

  <!-- Paragraphs in layout become items  -->
  <xsl:template match="tei:layout/tei:p[@n='description']">
    <li>
      <xsl:apply-templates/>
    </li>
  </xsl:template>
  <!-- Paragraph inside layout -->
  <xsl:template match="tei:layout/tei:p[@n='comment']">
    <li>
      <span class="itemHeading">Overview: </span>
      <xsl:apply-templates/>
    </li>
  </xsl:template>
  <!-- Dimensions in a list item -->
  <xsl:template match="tei:layout/tei:dimensions">
    <li>
      <span class="itemHeading">Dimensions: </span>
      <xsl:value-of select="tei:height"/>
      <xsl:text> x </xsl:text>
      <xsl:value-of select="tei:width"/>
      <xsl:if test="@rend | @type"> <xsl:value-of select="@rend"/>; <xsl:value-of select="@type"/></xsl:if>
    </li>
  </xsl:template>

  <!-- Layout locus match: for general locus output, see below under locus.  -->
  <xsl:template match="tei:layout/tei:locus">
    <li>
      <span class="itemHeading">Locus: </span>
      <xsl:apply-templates/>
    </li>
  </xsl:template>

<!-- II. 2. -->
<!-- handDesc ==================================================== -->
<!-- ============================================================= -->

 
<!-- handDesc with hands attribute -->
<xsl:template match="tei:handDesc">
    <h4><xsl:call-template name="makeID_noNO"/>Hand description:</h4>
	  	<xsl:if test="@hands">
	      <ul>
	        <span class="itemHeading">Number of hands: </span>
	        <xsl:value-of select="@hands"/>
	      </ul>
	    </xsl:if>
    <xsl:apply-templates/>
  </xsl:template>

   <!-- Special scribal paragraph in handDesc -->
  <xsl:template match="tei:handDesc/tei:p[@n='scribal']">
    <ul>
      <span class="itemHeading">Summary: </span>
      <xsl:apply-templates/>
    </ul>
  </xsl:template>
	
   <!-- Special paragraph on 'methods of correction' in handDesc -->
   <xsl:template match="tei:handDesc/tei:p[@n='mocorrection']">
    <ul>
      <span class="itemHeading">Methods of Alteration: </span>
      <xsl:apply-templates/>
    </ul>
   </xsl:template>
	
   <!-- List of corrections, display the type too -->
    <xsl:template match="tei:p[@n='mocorrection']/tei:list/tei:item">
	    <li>
	    	<span class="corr_hand"><xsl:value-of select="@type"/></span><xsl:text> </xsl:text>
	      <xsl:apply-templates/>
	    </li>
    </xsl:template>
 <!-- handNote with attributes pulled out -->
 <xsl:template match="tei:handNote">
 <ul>
   
<!-- Generate handNote ID first -->
 <xsl:if test="@xml:id">
        <xsl:attribute name="id">
          <xsl:value-of select="@xml:id"/>
        </xsl:attribute>	
 </xsl:if>
 	
<xsl:if test="@n">
<span class="itemHeading">Hand: </span>
<xsl:value-of select="@n"/>
</xsl:if>

 <ul>
 <xsl:if test="@scope">
<li>
<span class="itemHeading">Scope: </span>
<xsl:value-of select="@scope"/>
</li>
</xsl:if>

 <xsl:if test="@scribe">
<li>
<span class="itemHeading">Scribe: </span>
<xsl:value-of select="@scribe"/>
</li>
</xsl:if>

 <xsl:if test="@script">
<li>
<span class="itemHeading">Script: </span>
<xsl:value-of select="@script"/>
</li>
 </xsl:if>
 
 <xsl:if test="@rend">
<li>
<span class="itemHeading">Ker reference: </span>
<xsl:value-of select="@rend"/>
</li>
 </xsl:if>
 	
<xsl:apply-templates/>
</ul>
 </ul>        
</xsl:template>

<!-- Paragraph inside handNote -->
  <xsl:template match="tei:handNote/tei:p[@n='desc']">
    <li>
      <span class="itemHeading">Description: </span>
      <xsl:apply-templates/>
    </li>
  </xsl:template>

  <xsl:template match="tei:handNote/tei:p[@n='desc']/tei:locus">
      <xsl:apply-templates/>.
  </xsl:template>
	
  <xsl:template match="tei:handNote/tei:date">
    <li>
      <span class="itemHeading">Date: </span>
      <xsl:apply-templates/>
    </li>
  </xsl:template>

  <xsl:template match="tei:handNote/tei:place">
    <li>
      <span class="itemHeading">Place: </span>
      <xsl:apply-templates/>
    </li>
  </xsl:template>
	
<!-- Individual letters etc. explained -->	
	<xsl:template match="tei:handNote/tei:p[@n='char']">
      <li><span class="itemHeading">Summary of the characteristics of the hand: </span>
      <xsl:apply-templates/>
      </li>
	</xsl:template>
	
	<xsl:template match="tei:s">
		  <li class="s">
		  	<xsl:apply-templates/>
		  </li>
	</xsl:template>
	
	<!-- Italicise letters -->
	<xsl:template match="tei:c">
	    <span class="c">
	      <xsl:apply-templates/>
	    </span>
	</xsl:template>
	
	<xsl:template match="tei:handNote/tei:p[@n='abbreviations']">
	    <li>
	      <span class="itemHeading">Abbreviations: </span>
	      <xsl:apply-templates/>
	    </li>
	</xsl:template>
	
	<xsl:template match="tei:handNote/tei:p[@n='punctuation']">
	    <li>
	      <span class="itemHeading">Punctuation: </span>
	      <xsl:apply-templates/>
	    </li>
	</xsl:template>

	<xsl:template match="tei:handNote/tei:p[@n='ligature']">
	    <li>
	      <span class="itemHeading">Ligatures: </span>
	      <xsl:apply-templates/>
	    </li>
	</xsl:template>
	
	<xsl:template match="tei:handNote/tei:p[@n='nota']">
	    <li>
	      <span class="itemHeading">Litterae Notabiliores: </span>
	      <xsl:apply-templates/>
	    </li>
	</xsl:template>
	
	<xsl:template match="tei:handNote/tei:p[@n='language']">
	    <li>
	      <span class="itemHeading">Language: </span>
	      <xsl:apply-templates/>
	    </li>
	</xsl:template>
	
	<xsl:template match="tei:handNote/tei:p[@n='corrections']">
	    <li>
	      <span class="itemHeading">Correcting technique: </span>
	      <xsl:apply-templates/>
	    </li>
	</xsl:template>
	
	<xsl:template match="tei:handNote/tei:p[@n='othermss']">
	    <li>
	      <span class="itemHeading">Other manuscripts: </span>
	      <xsl:apply-templates/>
	    </li>
	</xsl:template>
	<xsl:template match="tei:p[@n='othermss']/tei:list/tei:item">
	  <li class="othermss">
	  	<xsl:apply-templates/>
	  </li>
	</xsl:template>


<!-- II. 3. -->
<!-- decoDesc ==================================================== -->
<!-- ============================================================= -->
  <xsl:template match="tei:decoDesc">
    <h4><xsl:call-template name="makeID_noNO"/>Decoration Description: </h4>
    <ul>
      <xsl:apply-templates/>
    </ul>
  </xsl:template>

  <xsl:template match="tei:decoDesc/tei:decoNote">
    <p>
      <span class="itemHeading"><!-- Decoration Note --><xsl:value-of select="@type"/><xsl:value-of select="@subtype"/>:</span>
      <xsl:apply-templates/>
    </p>
  </xsl:template>


<!-- II. 4. -->
<!-- Additions ==================================================== -->
<!-- ============================================================= -->
  <xsl:template match="tei:additions">
    <h4><xsl:call-template name="makeID_noNO"/>Additions: </h4>
    <ul>
      <xsl:apply-templates/>
    </ul>
  </xsl:template>
	
	<xsl:template match="tei:additions//tei:date">
	<strong><xsl:apply-templates/></strong><xsl:text>: </xsl:text>
	</xsl:template>


<!-- II. 5. -->
<!-- bindingDesc ==================================================== -->
<!-- ============================================================= -->
  <xsl:template match="tei:bindingDesc">
    <h4><xsl:call-template name="makeID_noNO"/>Binding Description: </h4>
    <ul>
      <xsl:apply-templates/>
    </ul>
  </xsl:template>


<!-- II. 6. -->
<!-- Accompanying Material ========================================== -->
<!-- ============================================================= -->
  <xsl:template match="tei:accMat">
    <h4><xsl:call-template name="makeID_noNO"/>Accompanying Material: </h4>
    <ul>
      <xsl:apply-templates/>
    </ul>
  </xsl:template>


<!-- III. -->
<!-- History  ==================================================== -->
<!-- ============================================================= -->
  <xsl:template match="tei:history">
    <h3><xsl:call-template name="makeID"/>History:</h3>
    <xsl:apply-templates/>
  </xsl:template>

  <!-- Paragraph inside origin -->
  <xsl:template match="tei:origin">
    <ul>
      <span class="itemHeading">Origin: </span>
      <xsl:apply-templates/>
    </ul>
  </xsl:template>

  <!-- Provenance -->
  <xsl:template match="tei:provenance">
    <ul>
      <span class="itemHeading">Provenance: </span>
      <xsl:apply-templates/>
    </ul>
  </xsl:template>

  <!-- Acquisition -->
  <xsl:template match="tei:acquisition">
    <ul>
      <span class="itemHeading">Acquisition: </span>
      <xsl:apply-templates/>
    </ul>
  </xsl:template>


<!-- IV. -->
<!-- Additional Information ========================================== -->
<!-- ============================================================= -->

  <xsl:template match="tei:additional">
    <h3><xsl:call-template name="makeID"/>Additional Information:</h3>
    <xsl:apply-templates/>
  </xsl:template>

  <!--  adminInfo -->
  <xsl:template match="tei:adminInfo">
    <h4><xsl:call-template name="makeID_noNO"/>Administration Information: </h4>
    <ul>
      <xsl:apply-templates/>
    </ul>
  </xsl:template>

  <!-- Surrogates -->
  <xsl:template match="tei:surrogates">
	<h4><xsl:call-template name="makeID_noNO"/>Surrogates: </h4>
	<p><ul class="msItemBiblio">
      <xsl:apply-templates/>
     </ul></p>
  </xsl:template>


<!-- IV.3 -->
<!-- Bibliography =============================================== -->
<!-- ============================================================= -->
	
<!-- Each bibl entry becomes a list item -->
  <xsl:template match="tei:surrogates/tei:bibl">
    <p>
      <xsl:apply-templates/>
    </p>
  </xsl:template>

  <!-- General listBibl match -->
  <xsl:template match="tei:msItem/tei:listBibl">
    <p>
      <span class="itemHeading">Bibliography: </span>
      <ul class="msItemBiblio">
        <xsl:apply-templates/>
      </ul>
    </p>
  </xsl:template>

  <!--  Additional/Bibliography-->
  <xsl:template match="tei:additional/tei:listBibl">
    <h4><xsl:call-template name="makeID"/><xsl:call-template name="makeID_noNO"/>Bibliography: </h4>
  	<p>
  	<ul class="msItemBiblio">
        <xsl:apply-templates/>
             </ul>
  	</p>
  </xsl:template>

  <!-- General listBibl/bibl match -->
  <xsl:template match="tei:listBibl/tei:bibl">
    <p>
      <xsl:if test="@xml:id">
        <xsl:attribute name="id">
          <xsl:value-of select="@xml:id"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:apply-templates/>
    </p>
  </xsl:template>

<!-- GENERAL: DISPLAY ======================================== -->
<!-- ========================================================== -->
<!-- General purpose tei paragraph to html paragraph -->
  <xsl:template match="tei:p">
    <p>
      <xsl:apply-templates/>
    </p>
  </xsl:template>

  <!-- General purpose tei phr to html paragraph: 
  	Use <phr> for places where <p> is not allowed, but want to describe in multiple paragraphs. -->
  <xsl:template match="tei:phr">
    <p>
      <xsl:apply-templates/>
    </p>
  </xsl:template>
	
  <!-- General purpose locus match, if there is an xml:id, create the ID. -->
  <xsl:template match="tei:locus">
    <span class="locus">
          <xsl:if test="@xml:id">
        <xsl:attribute name="id">
          <xsl:value-of select="@xml:id"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:apply-templates/>
    </span>
  </xsl:template>

  <!-- General list -->
  <xsl:template match="tei:list">
    <ul>
      <xsl:apply-templates/>
    </ul>
  </xsl:template>
	
  <!-- General item -->
  <xsl:template match="tei:item">
    <li>
      <xsl:apply-templates/>
    </li>
  </xsl:template>
	
  <!-- Display quotation marks where a <q> element is tagged -->
  <xsl:template match="tei:q">'<xsl:apply-templates/>'</xsl:template>

  <!-- Display quotation marks where an <orig> element is tagged.
         Used where we want to distinguish the usual quotes from other scholarly material and quotes from the readings in the manuscript.
  -->
  <xsl:template match="tei:orig">'<xsl:apply-templates/>'</xsl:template>
	
  <!-- Phrase Level -->	
	<!--Superscript-->
  	<xsl:template match="tei:hi[@rend='sup']">
    <span class="sup">
      <xsl:apply-templates/>
    </span>
  	</xsl:template>
	
  <xsl:template match="tei:expan">
    <span class="expanded">
      <xsl:apply-templates/>
    </span>
  </xsl:template>
	
  <xsl:template match="tei:lb">
    <xsl:text> |  </xsl:text>
  </xsl:template>

  <xsl:template match="tei:pb">
    <xsl:text> ||  </xsl:text>
  </xsl:template>

  <!-- The quote will be in <blockquote>, and the lb and pb WITHIN the quote will have actual line breaks.  -->
<xsl:template match="tei:phr[@type='bq']">
     <blockquote>
      <xsl:apply-templates/>
     </blockquote>
</xsl:template>
	
 <xsl:template match="tei:phr/tei:lb">
     | <br/>
  </xsl:template>

  <xsl:template match="tei:phr/tei:pb">
     || <br />
  </xsl:template>

<xsl:template match="tei:name[@type='work']">
     <span class="italics">
      <xsl:apply-templates/>
     </span>
</xsl:template>


<!-- Italics -->
<xsl:template match="tei:hi[@rend='it'] | tei:hi[@rend='italic'] | tei:hi[@rend='title']">
    <span class="italics">
      <xsl:apply-templates/>
    </span>
</xsl:template>



<!-- TRANSCRIPTION ========================================== -->
<!-- ========================================================== -->
<!-- Letters, highlighted -->
 <xsl:template match="tei:hi[@rend='deco']">
    <span class="deco">
      <xsl:apply-templates/>
    </span>
  </xsl:template>

  <xsl:template match="tei:hi[@rend='emph']">
    <span class="emph">
      <xsl:apply-templates/>
    </span>
  </xsl:template>

	

<!-- Colours for the coloured letters -->
  <xsl:template match="tei:hi[@rend='red']">
    <span class="red">
      <xsl:apply-templates/>
    </span>
  </xsl:template>

  <xsl:template match="tei:hi[@rend='blue']">
    <span class="blue">
      <xsl:apply-templates/>
    </span>
  </xsl:template>
	
  <xsl:template match="tei:hi[@rend='green']">
    <span class="green">
      <xsl:apply-templates/>
    </span>
  </xsl:template>

  <xsl:template match="tei:hi[@rend='purple']">
    <span class="purple">
      <xsl:apply-templates/>
    </span>
  </xsl:template>

<xsl:template match="tei:hi[@rend='metallicred']">
    <span class="metallicred">
      <xsl:apply-templates/>
    </span>
  </xsl:template>
	
  <xsl:template match="tei:hi[@rend='mixed']">
    <span class="mixed">
      <xsl:apply-templates/>
    </span>
  </xsl:template>
	
<!-- Styles within the list of errors -->
  <xsl:template match="tei:handDesc//tei:list/tei:item/tei:q">
  	<blockquote>
      <xsl:apply-templates/>
  	</blockquote>
  </xsl:template>
  
<!-- HOVER THE MOUSE AND POP UPS:
making a title attribute means if you hover the mouse, the attribute value will be displayed as a tooltip -->
  
  <xsl:template match="tei:unclear">
    [<span class="unclear">
      <xsl:if test="@reason">
        <xsl:attribute name="title">
          <xsl:text>unclear: </xsl:text><xsl:value-of select="@reason"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:apply-templates/>
    </span>]<xsl:text>&#160;</xsl:text><span class="PrintOnly"><xsl:text>(unclear:
</xsl:text><xsl:value-of select="@reason"/><xsl:text>) </xsl:text></span>
  </xsl:template>

  <xsl:template match="tei:supplied">
    [<span class="supplied">
      <xsl:if test="@reason">
        <xsl:attribute name="title">
          <xsl:text>supplied: </xsl:text><xsl:value-of select="@reason"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:apply-templates/>
    </span>]<xsl:text>&#160;</xsl:text><span class="PrintOnly"><xsl:text>(supplied:
</xsl:text><xsl:value-of select="@reason"/><xsl:text>) </xsl:text></span>
  </xsl:template>
  
  <!-- Deletions -->
  <xsl:template match="tei:del">
    <span class="del">
    	  <xsl:if test="@rend">
        <xsl:attribute name="title"><xsl:text>deletion: </xsl:text><xsl:value-of select="@rend"/></xsl:attribute>
      </xsl:if>
    	<xsl:apply-templates/>
    </span><xsl:text>&#160;</xsl:text><span class="PrintOnly"><xsl:text>(deletion:
</xsl:text><xsl:value-of select="@rend"/><xsl:text>) </xsl:text></span>
  </xsl:template> 

  <!-- Additions -->
  <xsl:template match="tei:add">
    <span class="add">
    	  <xsl:if test="@rend">
        <xsl:attribute name="title">
        	          <xsl:text>addition: </xsl:text><xsl:value-of select="@rend"/>
        	  </xsl:attribute>
      </xsl:if>
      <xsl:apply-templates/>
    </span><xsl:text>&#160;</xsl:text><span class="PrintOnly"><xsl:text>(addition:
</xsl:text><xsl:value-of select="@rend"/>) </span>
  </xsl:template> 


<!-- KEYWORDS ===========================-->
<!-- ========================================================== -->
<xsl:template match="tei:name">
    <span class="name">
      <xsl:apply-templates/>
    </span>
</xsl:template>

<xsl:template match="tei:term">
    <span class="term">
      <xsl:apply-templates/>
    </span>
</xsl:template>

<xsl:template match="tei:material">
    <span class="material">
      <xsl:apply-templates/>
    </span>
</xsl:template>

<xsl:template match="tei:date[@type='key']">
    <span class="date_key">
      <xsl:apply-templates/>
    </span>
</xsl:template>


<!-- GENERAL: FUNCTION  ===========================-->
<!-- ========================================================== -->
<!-- HOVER THE MOUSE AND POP UPS:
	making a title attribute means if you hover the mouse, the attribute value will be displayed as a tooltip -->

  <!-- sic -->
  <xsl:template match="tei:sic">
    <span class="sic">
    	  <xsl:if test="@type">
        <xsl:attribute name="title"><xsl:value-of select="@type"/></xsl:attribute>
      </xsl:if>
    	<xsl:apply-templates/></span>
  </xsl:template> 

<!-- Ref from here-->
  <xsl:template match="tei:ref">
    <a href="{@target}">
      <xsl:apply-templates/>
    </a>
  </xsl:template>
	
  <xsl:template match="tei:ref[@type='mss']">
    <a href="{@target}.htm">
      <xsl:apply-templates/>
    </a>
  </xsl:template>

  <xsl:template match="tei:ref[@type='item']">
     <xsl:variable name="msID" select="ancestor-or-self::tei:msDesc/@xml:id"/>
    	<a href="{concat('#',$msID)}-msItem-{@target}">
    	<xsl:apply-templates/>
    	</a>
  </xsl:template>

<!-- In order to use <ref type="scribe" target="#EM.SC.0375">  -->
  <xsl:template match="tei:ref[@type='scribe']">
     <xsl:variable name="msID" select="ancestor-or-self::tei:msDesc/@xml:id"/>
    	<a href="{@target}">
    	<xsl:apply-templates/>
    	</a>
  </xsl:template>
  
  <!-- Ref up to here -->

  
<!--  Make the identifier. N.B. a named template not a matching one  -->
  <xsl:template name="makeIdentifier">
    <span class="identifier">
    	  <!--     
      <xsl:value-of select="normalize-space(tei:msIdentifier/tei:country)"/>
      <xsl:text>, </xsl:text> -->
      <xsl:value-of select="normalize-space(tei:msIdentifier/tei:settlement)"/>
      <xsl:text>, </xsl:text>
      <xsl:value-of select="normalize-space(tei:msIdentifier/tei:repository)"/>
      <xsl:text>, </xsl:text>
      <xsl:value-of select="normalize-space(tei:msIdentifier/tei:collection)"/><xsl:text> </xsl:text>
      <xsl:value-of select="normalize-space(tei:msIdentifier/tei:idno)"/>
    	
    	<xsl:value-of select="//tei:msIdentifier/tei:altIdentifier/tei:settlement[node()]"/> 
      <xsl:value-of select="//tei:msIdentifier/tei:altIdentifier/tei:repository[node()]"/> 
      <xsl:value-of select="//tei:msIdentifier/tei:altIdentifier/tei:idno"/>
    	
      <!-- <xsl:text>.</xsl:text> -->
    	<xsl:value-of select="tei:msIdentifier/tei:note"/>
    </span>
  </xsl:template>
  
  <xsl:template match="tei:note[@type='TK']"/>
  <!--  do NOT display note type="TK">-->

 <!-- Make an ID attribute  -->
  <xsl:template name="makeID">
    <xsl:variable name="msID" select="ancestor-or-self::tei:msDesc/@xml:id"/>
    <xsl:variable name="elementName" select="name()"/>
    <xsl:variable name="pos" select="position()"/>
    <xsl:attribute name="id">
      <xsl:value-of select="concat($msID, '-',$elementName,'-',$pos)"/>
    </xsl:attribute>
  </xsl:template>

 <!--  Make an ID attribute without number -->
  <xsl:template name="makeID_noNO">
    <xsl:variable name="msID" select="ancestor-or-self::tei:msDesc/@xml:id"/>
    <xsl:variable name="elementName" select="name()"/>
    <xsl:attribute name="id">
      <xsl:value-of select="concat($msID, '-',$elementName)"/>
    </xsl:attribute>
  </xsl:template>


<!-- TABLE OF CONTENTS -->
<!-- =================================== -->
<!-- default rule for toc mode is to not put out anything -->
  <xsl:template match="node()" mode="toc" priority="-1"/>

  <!-- Summary, create a toc entry. -->
  <xsl:template match="tei:summary" mode="toc">
    <xsl:variable name="msID" select="ancestor-or-self::tei:msDesc/@xml:id"/>
    <xsl:variable name="elementName" select="name()"/>
    <xsl:variable name="pos" select="position()"/>
     <xsl:apply-templates mode="toc" select="tei:summary"/>
  	<div id="menutitle" class="menutitle">
      <a class="noline" href="{concat('#',$msID,'-',$elementName,'-',$pos)}">Summary</a>
    </div>
  </xsl:template>


  <!-- msItems, create a toc entry. -->
  <xsl:template match="tei:msContents" mode="toc">
    <xsl:apply-templates mode="toc" select="tei:summary"/>
    <div id="menutitle" class="menutitle" onclick="SwitchMenu('sub1')">MS Items</div>
  	<span class="submenu" id="sub1">
  	<xsl:apply-templates mode="toc" select="tei:msItem"/>
  	</span>
  </xsl:template>

<!-- Originally only for short version. To make links to the titles of the item
  <xsl:template match="tei:summary/tei:phr/tei:title[node()][@type='uniform']">
	      <span class="Cameron"><xsl:apply-templates/></span>
  </xsl:template>
-->
  
  <!--Each msItem, create a toc entry, and name the punctuate-list template -->
  <xsl:template match="tei:msItem" mode="toc">
    <xsl:variable name="msID" select="ancestor-or-self::tei:msDesc/@xml:id"/>
    <xsl:variable name="elementName" select="name()"/>
    <xsl:variable name="pos" select="position()"/>

    	<!-- For those descriptions with short titles under manuscript Items. 
    		<a href="{concat('#',$msID,'-',$elementName,'-',$pos)}">
    		<xsl:value-of select="tei:title[@type='short'][node()]"/> -
    		<xsl:value-of select="tei:locus"/></a>-->

    	<a href="{concat('#',$msID,'-',$elementName,'-',$pos)}">
    	  <span class="short"><xsl:value-of select="tei:title[@type='short'][node()]"/></span>
    	  <xsl:text> </xsl:text><xsl:value-of
    	  select="tei:locus"/></a>
    <xsl:call-template name="punctuate-list"/>
  </xsl:template>

  <!-- objectDesc, create a toc entry. -->
  <xsl:template match="tei:objectDesc" mode="toc">
    <xsl:variable name="msID" select="ancestor-or-self::tei:msDesc/@xml:id"/>
    <xsl:variable name="elementName" select="name()"/>
    <xsl:variable name="pos" select="position()"/>
  	     <xsl:apply-templates mode="toc" select="tei:objectDesc"/>
      <a href="{concat('#',$msID,'-',$elementName)}">Object Description</a>
  </xsl:template>
	
  <!-- handDesc, create a toc entry. -->
  <xsl:template match="tei:handDesc" mode="toc">
    <xsl:variable name="msID" select="ancestor-or-self::tei:msDesc/@xml:id"/>
    <xsl:variable name="elementName" select="name()"/>
    <xsl:variable name="pos" select="position()"/>
  	     <xsl:apply-templates mode="toc" select="tei:handDesc"/>
      <a href="{concat('#',$msID,'-',$elementName)}">Hand Description</a>
  </xsl:template>

  <!-- decoDesc, create a toc entry. -->
  <xsl:template match="tei:decoDesc" mode="toc">
    <xsl:variable name="msID" select="ancestor-or-self::tei:msDesc/@xml:id"/>
    <xsl:variable name="elementName" select="name()"/>
    <xsl:variable name="pos" select="position()"/>
  	<xsl:apply-templates mode="toc" select="physDesc/tei:decoDesc"/>
      <a href="{concat('#',$msID,'-',$elementName)}">Decoration Description</a>
  </xsl:template>

  <!-- Additions, create a toc entry. -->
  <xsl:template match="tei:additions" mode="toc">
    <xsl:variable name="msID" select="ancestor-or-self::tei:msDesc/@xml:id"/>
    <xsl:variable name="elementName" select="name()"/>
    <xsl:variable name="pos" select="position()"/>
  	     <xsl:apply-templates mode="toc" select="tei:additions"/>
      <a href="{concat('#',$msID,'-',$elementName)}">Additions</a>
  </xsl:template>

  <!-- bindingDesc, create a toc entry. -->
  <xsl:template match="tei:bindingDesc" mode="toc">
    <xsl:variable name="msID" select="ancestor-or-self::tei:msDesc/@xml:id"/>
    <xsl:variable name="elementName" select="name()"/>
    <xsl:variable name="pos" select="position()"/>
  	     <xsl:apply-templates mode="toc" select="tei:bindingDesc"/>
      <a href="{concat('#',$msID,'-',$elementName)}">Binding Description</a>
  </xsl:template>

  <!-- accMat, create a toc entry. -->
  <xsl:template match="tei:accMat" mode="toc">
    <xsl:variable name="msID" select="ancestor-or-self::tei:msDesc/@xml:id"/>
    <xsl:variable name="elementName" select="name()"/>
    <xsl:variable name="pos" select="position()"/>
  	     <xsl:apply-templates mode="toc" select="tei:accMat"/>
      <a href="{concat('#',$msID,'-',$elementName)}">Accompanying Material</a>
  </xsl:template>
	
<!-- physDesc, sub-headings, create a toc entry.-->
<xsl:template match="tei:physDesc" mode="toc">

    <div id="menutitle" class="menutitle" onclick="SwitchMenu('sub2')">Physical Description</div>
  	<div id="submenu">
	<span class="submenu" id="sub2">
		<xsl:apply-templates mode="toc" select="tei:objectDesc"/><br/>
		<xsl:apply-templates mode="toc" select="tei:handDesc"/>

		<br/>
		<xsl:apply-templates mode="toc" select="tei:decoDesc"/><br/>
		<xsl:apply-templates mode="toc" select="tei:additions"/><br/>
		<xsl:apply-templates mode="toc" select="tei:bindingDesc"/><br/>
		<xsl:apply-templates mode="toc" select="tei:accMat"/>
		</span></div>
  	</xsl:template>
  
  <!-- History, create a toc entry. -->
  <xsl:template match="tei:history" mode="toc">
    <xsl:variable name="msID" select="ancestor-or-self::tei:msDesc/@xml:id"/>
    <xsl:variable name="elementName" select="name()"/>
    <xsl:variable name="pos" select="position()"/>
  	<div id="menutitle" class="menutitle">
      <a class="noline" href="{concat('#',$msID,'-',$elementName,'-',$pos)}">History</a>
    </div>
  </xsl:template>
	
<!--  Additional, create a toc entry.  -->
  <xsl:template match="tei:additional" mode="toc">
    <xsl:variable name="msID" select="ancestor-or-self::tei:msDesc/@xml:id"/>
    <xsl:variable name="elementName" select="name()"/>
    <xsl:variable name="pos" select="position()"/>
  	<div id="menutitle" class="menutitle">
      <a class="noline" href="{concat('#',$msID,'-',$elementName,'-',$pos)}">Additional Information</a>
    </div>
  </xsl:template>

  <!-- adminInfo, create a toc entry. -->
  <xsl:template match="tei:adminInfo" mode="toc">
    <xsl:variable name="msID" select="ancestor-or-self::tei:msDesc/@xml:id"/>
    <xsl:variable name="elementName" select="name()"/>
    <xsl:variable name="pos" select="position()"/>
  	     <xsl:apply-templates mode="toc" select="tei:adminInfo"/>
      <a href="{concat('#',$msID,'-',$elementName)}">Administration Information</a>
  </xsl:template>

  <!-- Surrogates, create a toc entry. -->
  <xsl:template match="tei:surrogates" mode="toc">
    <xsl:variable name="msID" select="ancestor-or-self::tei:msDesc/@xml:id"/>
    <xsl:variable name="elementName" select="name()"/>
    <xsl:variable name="pos" select="position()"/>
  	     <xsl:apply-templates mode="toc" select="tei:surrogates"/>
      <a href="{concat('#',$msID,'-',$elementName)}">Surrogates</a>
  </xsl:template>
	
  <!-- Bibliography , create a toc entry.  -->
  <xsl:template match="tei:listBibl" mode="toc">
    <xsl:variable name="msID" select="ancestor-or-self::tei:msDesc/@xml:id"/>
    <xsl:variable name="elementName" select="name()"/>
    <xsl:variable name="pos" select="position()"/>

      <a href="{concat('#',$msID,'-',$elementName)}">Bibliography</a>
  </xsl:template>
	
<!-- Additional Information, sub-headings, create a toc entry.-->
<xsl:template match="tei:additional" mode="toc">
    <div id="menutitle" class="menutitle" onclick="SwitchMenu('sub3')">Additional Information</div>
	<div id="submenu">
	<span class="submenu" id="sub3">
  	<xsl:apply-templates mode="toc" select="tei:adminInfo"/><br/>
  	<xsl:apply-templates mode="toc" select="tei:surrogates"/><br/>
    	<xsl:apply-templates mode="toc" select="tei:listBibl"/>
  	</span>
</div>
</xsl:template>
	
  <!-- For the current element this is called from, provide '.' if it is
  the last item, an 'and' if it is penultimate, and otherwise a ','
    (used here for table of msitem contents) -->
  <xsl:template name="punctuate-list">
    <xsl:choose>
      <xsl:when test="position()=last()">
        <xsl:text>. </xsl:text>
      </xsl:when>
      <xsl:when test="position()=last()-1">
        <xsl:text> and </xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>, </xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>

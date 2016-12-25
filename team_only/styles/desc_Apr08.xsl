<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="tei" version="1.0" xmlns="http://www.w3.org/1999/xhtml"
  xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output doctype-public="-//W3C//DTD XHTML 1.1//EN"
    doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd" encoding="iso8859-1" indent="yes"
    method="xml"/>

  <xsl:template match="/tei:TEI">
    <html xml:lang="en" xmlns="http://www.w3.org/1999/xhtml">
      <xsl:comment>NOTE: THIS FILE HAS BEEN GENERATED FROM A TEI XML ORIGINAL</xsl:comment>
      <head>
        <title>
          <!-- Grab first title from file -->
<xsl:value-of select="//tei:msIdentifier/tei:settlement"/>, 
<xsl:value-of select="//tei:msIdentifier/tei:repository"/>, 
<xsl:value-of select="//tei:msIdentifier/tei:idno"/> - 
<xsl:value-of select="//tei:title[1]"/>
        </title>

      	<link rel="stylesheet" href="../styles/desc.css" type="text/css" />
      </head>
      
    	<body>

<!-- Output first title as  level 1 heading-->

    		<div id="content_desc">
        <!-- Go apply any other templates -->
        <xsl:apply-templates/>
    			</div>
      </body>
    </html>
  </xsl:template>


  <!-- Don't output teiHeader, etc. -->
  <xsl:template match="tei:teiHeader |tei:msIdentifier"/>

  <!-- Just pass through text and body, etc. -->
  <xsl:template match="tei:text | tei:body ">
    <xsl:apply-templates/>
  </xsl:template>

  <!-- Match any msDescription -->
	<xsl:template match="tei:msDescription">
		<p class="right">The Production and Use of English Manuscripts 1060 to 1220</p>
    <h1 class="ident">
      <xsl:call-template name="makeIdentifier"/>
    </h1>

<div id="left_desc">
			<h1 class="left">
<xsl:value-of select="//tei:msIdentifier/tei:settlement"/>, 
<xsl:value-of select="//tei:msIdentifier/tei:repository"/>, 
<xsl:value-of select="//tei:msIdentifier/tei:idno"/>  
			</h1>
	<ul class="toc">
      <xsl:apply-templates mode="toc"/>
	</ul>
<p class="right_nav"> <a href="../index.htm">
	<img width="60%" border="0" position="right" src="../images/logos/em.jpg" alt="The Production and Use of English Manuscripts: 1060 to 1220"/></a></p>
	<p class="right_nav">
Back to <a href="../catalogue/mssportal.htm">Portal to Mss</a></p>
	<p class="right_nav">&#169; The Production and Use |<br/>of English Manuscripts 1060 to 1220 | </p>
</div> 
		
	<xsl:apply-templates/>
  </xsl:template>

  <!-- Manuscript description heading    -->
  <xsl:template match="tei:msDescription/tei:head">
    <h2>
      <xsl:apply-templates select="tei:title"/>
    </h2>
    <h3>Date: 
    	<xsl:apply-templates select="tei:date" />
    	<span class="date_note"> 		<xsl:apply-templates select="tei:note"/>
    	</span></h3>
  </xsl:template>

  <!--  Output Summary then all msItems  -->
  <xsl:template match="tei:msContents">
    <xsl:apply-templates select="tei:summary"/>
    <h3>Manuscript Items:</h3>
    <ol>
      <xsl:apply-templates select="tei:msItem"/>
    </ol>
  </xsl:template>

  <!--  Summary  -->
  <xsl:template match="tei:msContents/tei:summary">
    <h3><xsl:call-template name="makeID"/>Summary:</h3>
    <p>
      <xsl:apply-templates/>
    </p>
  </xsl:template>

  <!--  Output each msItem -->
  <xsl:template match="tei:msItem">
    <li class="msItem">
      <xsl:call-template name="makeID"/>
      <span class="itemHeading">Item:</span>
      <xsl:text>   </xsl:text>
      <xsl:apply-templates select="tei:locus"/>
      <ul>

        <!-- Apply only set templates inside msItem -->
        <xsl:apply-templates select="tei:title"/>
        <xsl:apply-templates select="tei:rubric"/>
        <xsl:apply-templates select="tei:incipit"/>
        <xsl:apply-templates select="tei:explicit"/>
        <xsl:apply-templates select="tei:q"/>
        <xsl:apply-templates select="tei:textLang"/>
        <xsl:apply-templates select="tei:filiation"/>
        <xsl:apply-templates select="tei:note"/>
        <xsl:apply-templates select="tei:listBibl"/>
      </ul>
    </li>
  </xsl:template>


  <!--  Each of the items, only if there (moral: don't provide empty
    elements if you have nothing to put in them)  -->
  <xsl:template match="tei:msItem/tei:title[node()]">
    <p>
      <span class="itemHeading">Title: </span>
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  <xsl:template match="tei:msItem/tei:rubric[node()]">
    <p>
      <span class="itemHeading">Rubric: </span>
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  <xsl:template match="tei:msItem/tei:incipit[node()]">
    <p>
      <span class="itemHeading">Incipit: </span>
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  <xsl:template match="tei:msItem/tei:explicit[node()]">
    <p>
      <span class="itemHeading">Explicit: </span>
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  <xsl:template match="tei:msItem/tei:q[node()]">
    <p>
      <span class="itemHeading">Addition: </span>
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  <xsl:template match="tei:msItem/tei:textLang[node()]">
    <p>
      <span class="itemHeading">Text Language: </span>
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  <xsl:template match="tei:msItem/tei:filiation[node()]">
    <p>
      <span class="itemHeading">Other versions of the text: </span>
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  <xsl:template match="tei:msItem/tei:note[node()]">
    <p>
      <span class="itemHeading">Note: </span>
      <xsl:apply-templates/>
      <xsl:if test="@resp"> [<xsl:value-of select="@resp"/>]</xsl:if>
    </p>
  </xsl:template>





  <!-- PhysDesc -->
  <xsl:template match="tei:physDesc">
    <h3><xsl:call-template name="makeID"/>Physical Description:</h3>
    <xsl:apply-templates/>
  </xsl:template>

  <!-- objectDesc include @form if there  -->
  <xsl:template match="tei:objectDesc">
    <h4>Object Description:</h4>
      <xsl:if test="@form">
          <p class="totheright"><span class="itemHeading">Form: </span><xsl:value-of select="@form"/></p>

      </xsl:if>
      <xsl:apply-templates/>
  </xsl:template>

  <!-- general purpose tei  paragraph to html paragraph -->
  <xsl:template match="tei:p">
    <p>
      <xsl:apply-templates/>
    </p>
  </xsl:template>


  <!-- Support -->
  <xsl:template match="tei:supportDesc/tei:support/tei:p">
    <p class="totheright">
      <span class="itemHeading">Support: </span>
      <xsl:apply-templates/>
    </p>
  </xsl:template>

  <!-- Extent -->
  <xsl:template match="tei:extent">
    <p class="totheright">
      <span class="itemHeading">Extent: </span>
      <xsl:apply-templates/>
    </p>
  </xsl:template>

  <!-- General purpose dimensions template -->
  <xsl:template match="tei:dimensions">
    <xsl:value-of select="tei:height"/>
    <xsl:text> x </xsl:text>
    <xsl:value-of select="tei:width"/>
    <xsl:if test="@scope | @type"> (<xsl:value-of select="@scope"/>
      <xsl:value-of select="@type"/> )</xsl:if>
  </xsl:template>

  <!-- foliation was just one paragraph so made it into a list item  -->
  <xsl:template match="tei:foliation/tei:p">
    <p class="totheright">
      <span class="itemHeading">Foliation: </span>
      <xsl:apply-templates/>
    </p>
  </xsl:template>

  <!-- Put quotation marks where you've marked q element -->
  <xsl:template match="tei:q">&quot;<xsl:apply-templates/>&quot;</xsl:template>

  <!-- Collation was just one paragraph so made it a list item -->
  <xsl:template match="tei:collation/tei:p[@n='description']">
    <p class="totheright"><span class="itemHeading">Collation: </span>
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  <!-- Paragraph inside layout -->
  <xsl:template match="tei:collation/tei:p[@n='diagram']">
    
    <p class="totheright">
      <span class="itemHeading">Diagram: </span>
      <xsl:apply-templates/>
    </p>

  </xsl:template>


  <!-- Not sure if 'Formula' is the word other will understand.  Is it
  Quires?  Change to appropriate.-->

	<xsl:template match="tei:formula">
 
		<ul>
      <span class="itemHeading">Quires: </span>
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
  <!-- Signatures -->
  <xsl:template match="tei:signatures">
    <ul>
      <span class="itemHeading">Signatures: </span>
      <xsl:apply-templates/>
    </ul>
  </xsl:template>

	
	<!-- Condition was a single paragraph, so made it an item -->
  <xsl:template match="tei:condition/tei:p">
    <p class="totheright">
      <span class="itemHeading">Condition: </span>
      <xsl:apply-templates/>
    </p>
  
  </xsl:template>
  
  <!--  Output Layout description  -->
  <xsl:template match="tei:objectDesc/tei:layoutDesc">
    <xsl:apply-templates select="tei:layoutDesc"/>
    <h6>Layout description: </h6>
    <ol>
      <xsl:apply-templates select="tei:layout"/>
    </ol>
  </xsl:template>
  
  <!-- There was nothing but layout in layoutDesc, pulled out
    attributes as well. -->
 
  <xsl:template match="tei:layoutDesc/tei:layout">
   
        <li>
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
      <span class="itemHeading">Dimensions:</span>
      <xsl:value-of select="tei:height"/>
      <xsl:text> x </xsl:text>
      <xsl:value-of select="tei:width"/>
      <xsl:if test="@scope | @type"> (<xsl:value-of select="@scope"/>
        <xsl:value-of select="@type"/> )</xsl:if>
    </li>
  </xsl:template>

  <!-- General purpose locus match -->
  <xsl:template match="tei:locus">
    <span class="locus">
      <xsl:apply-templates/>
    </span>
  </xsl:template>

  <!-- layout locus match  -->
  <xsl:template match="tei:layout/tei:locus">
    <li>
      <span class="itemHeading">Locus:</span>
      <xsl:apply-templates/>
    </li>
  </xsl:template>

 
 
  <!-- Hand Desc with hands attribute -->
  <xsl:template match="tei:handDesc">
    <h4>Hand Description: </h4>

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
  
  <!-- Hand Note with attributes pulled out. -->
  <xsl:template match="tei:handNote">
    <ul>
      <xsl:if test="@n">
     
        <span class="itemHeading">Hand: </span>
        <xsl:value-of select="@n"/>
      
      </xsl:if>
      <ul>
        <xsl:if test="@xml:id">
          <li>
            <span class="itemHeading">ID: </span>
            <xsl:value-of select="@xml:id"/>
          </li>
        </xsl:if>
        
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
        <xsl:apply-templates/>
      </ul>
    </ul>
  </xsl:template>

  <!-- paragraph inside handNote -->

  <xsl:template match="tei:handNote/tei:p[@n='desc']">
    <li>
      <span class="itemHeading">Description: </span>
      <xsl:apply-templates/>
    </li>
  </xsl:template>
  <xsl:template match="tei:handNote/tei:p[@n='char']">
  
      <span class="itemHeading">Summary of the characteristics of the hand: </span>
      <xsl:apply-templates/>
  
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
  <xsl:template match="tei:decoDesc">
    
    <h4>Decoration Description: </h4>
    <ul>
      <xsl:apply-templates/>
    </ul>
  </xsl:template>


  <xsl:template match="tei:decoNote">
    <p>
      <span class="itemHeading">Decoration Note: </span>
      <xsl:apply-templates/>
    </p>
  </xsl:template>

  <xsl:template match="tei:additions">
    <h4>Additions: </h4>
    <ul>
      <xsl:apply-templates/>
    </ul>
  </xsl:template>

  <!-- Binding Description -->
  <xsl:template match="tei:bindingDesc">
    <h4>Binding Description: </h4>
    <ul>
      <xsl:apply-templates/>
    </ul>
  </xsl:template>

  <!-- accmat  -->
  <xsl:template match="tei:accMat">
    <h4>Accompanying Material: </h4>
    <ul>
      <xsl:apply-templates/>
    </ul>
  </xsl:template>


  <!-- history -->
  <xsl:template match="tei:history">
    <h3><xsl:call-template name="makeID"/>History:</h3>
    <xsl:apply-templates/>
  </xsl:template>

  <!-- paragraph inside origin -->
  <xsl:template match="tei:origin/tei:p">
    <ul>
      <span class="itemHeading">Origin: </span>
      <xsl:apply-templates/>
    </ul>
  </xsl:template>

  <!-- provenance -->
  <xsl:template match="tei:provenance/tei:p">
    <ul>
      <span class="itemHeading">Provenance: </span>
      <xsl:apply-templates/>
    </ul>
  </xsl:template>

  <!-- acquisition -->
  <xsl:template match="tei:acquisition/tei:p">
    <ul>
      <span class="itemHeading">Acquisition: </span>
      <xsl:apply-templates/>
    </ul>
  </xsl:template>

  <!--  additional -->
  <xsl:template match="tei:additional">
    <h3><xsl:call-template name="makeID"/>Additional Information:</h3>
    <xsl:apply-templates/>
  </xsl:template>

  <!--  admininfo -->
  <xsl:template match="tei:adminInfo">
    <ul>
      <span class="itemHeading">Administration Information: </span>
      <xsl:apply-templates/>
    </ul>
  </xsl:template>

  <!--  surrogates -->
  <xsl:template match="tei:surrogates/tei:p">
    <ul>
      <span class="itemHeading">Surrogates: </span>

      <xsl:apply-templates/>

    </ul>
  </xsl:template>

  <!-- each bibl becomes a list item -->
  <xsl:template match="tei:surrogates/tei:p/tei:bibl">
    <p>
      <xsl:apply-templates/>
    </p>
  </xsl:template>

  <!-- general listBibl match -->
  <xsl:template match="tei:listBibl">
    <p>
      <span class="itemHeading">Bibliography: </span>
      <ul class="msItemBiblio">
        <xsl:apply-templates/>
      </ul>
    </p>
  </xsl:template>

  <!-- general listBibl/bibl match -->
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



  <!-- Phrase Level -->
  <xsl:template match="tei:expan">
    <span class="expanded">
      <xsl:apply-templates/>
    </span>
  </xsl:template>
  <xsl:template match="tei:lb">
    <xsl:text> / </xsl:text>
  </xsl:template>
  <xsl:template match="tei:hi[@rend='it'] | tei:hi[@rend='italic']">
    <span class="italics">
      <xsl:apply-templates/>
    </span>
  </xsl:template>

  <xsl:template match="tei:hi[@rend='red'] | tei:hi[@rend='red']">
    <span class="red">
      <xsl:apply-templates/>
    </span>
  </xsl:template>

  <xsl:template match="tei:hi[@rend='green'] | tei:hi[@rend='green']">
    <span class="green">
      <xsl:apply-templates/>
    </span>
  </xsl:template>

  <xsl:template match="tei:hi[@rend='purple'] | tei:hi[@rend='purple']">
    <span class="purple">
      <xsl:apply-templates/>
    </span>
  </xsl:template>

  <xsl:template match="tei:hi[@rend='mixed'] | tei:hi[@rend='mixed']">
    <span class="mixed">
      <xsl:apply-templates/>
    </span>
  </xsl:template>
	

	
	
	<xsl:template match="tei:hi[@rend='sup']">
    <span class="super">
      <xsl:apply-templates/>
    </span>
  </xsl:template>
  
 

  <!-- making a title attribute means if you hover the mouse, you get
  the attribute value as a tooltip -->
  <xsl:template match="tei:unclear">
    <span class="unclear">
      <xsl:if test="@reason">
        <xsl:attribute name="title">
          <xsl:value-of select="@reason"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:apply-templates/>
    </span>
  </xsl:template>

  <!-- General Ref -->
  <xsl:template match="tei:ref">
    <a href="{@target}">
      <xsl:apply-templates/>
    </a>
  </xsl:template>


  <!-- general list -->
  <xsl:template match="tei:list">
    <ul>
      <xsl:apply-templates/>
    </ul>
  </xsl:template>
  <!-- general item -->
  <xsl:template match="tei:item">
    <li>
      <xsl:apply-templates/>
    </li>
  </xsl:template>

  


  <!--     Make the identifier, note a named template not a matching
    one  -->
  <xsl:template name="makeIdentifier">
    <span class="identifier">
      <xsl:value-of select="normalize-space(tei:msIdentifier/tei:country)"/>
      <xsl:text>, </xsl:text>
      <xsl:value-of select="normalize-space(tei:msIdentifier/tei:settlement)"/>
      <xsl:text>, </xsl:text>
      <xsl:value-of select="normalize-space(tei:msIdentifier/tei:repository)"/>
      <xsl:text>, </xsl:text>
      <xsl:value-of select="normalize-space(tei:msIdentifier/tei:idno)"/>
      <xsl:text>.</xsl:text>
    </span>
  </xsl:template>


  <!--     Make an ID attribute  -->
  <xsl:template name="makeID">
    <xsl:variable name="msID" select="ancestor-or-self::tei:msDescription/@xml:id"/>
    <xsl:variable name="elementName" select="name()"/>
    <xsl:variable name="pos" select="position()"/>
    <xsl:attribute name="id">
      <xsl:value-of select="concat($msID, '-',$elementName,'-',$pos)"/>
    </xsl:attribute>
  </xsl:template>

  <!-- default rule for toc mode is to not put out anything -->
  <xsl:template match="node()" mode="toc" priority="-1"/>

  <!-- History, create a toc entry. -->
  <xsl:template match="tei:history" mode="toc">
    <xsl:variable name="msID" select="ancestor-or-self::tei:msDescription/@xml:id"/>
    <xsl:variable name="elementName" select="name()"/>
    <xsl:variable name="pos" select="position()"/>
    <li>
      <a href="{concat('#',$msID, '-',$elementName,'-',$pos)}">History</a>
    </li>
  </xsl:template>

  <!-- msItems, create a toc entry. -->
  <xsl:template match="tei:msContents" mode="toc">
    <xsl:apply-templates mode="toc" select="tei:summary"/>
    <li>MS Items: <xsl:apply-templates mode="toc" select="tei:msItem"/></li>
  </xsl:template>

  <!-- Summary, create a toc entry. -->
  <xsl:template match="tei:summary" mode="toc">
    <xsl:variable name="msID" select="ancestor-or-self::tei:msDescription/@xml:id"/>
    <xsl:variable name="elementName" select="name()"/>
    <xsl:variable name="pos" select="position()"/>
    <li>
      <a href="{concat('#',$msID, '-',$elementName,'-',$pos)}">Summary</a>
    </li>
  </xsl:template>
  <!--Each msItem , create a toc entry, and call the punctuate-list
    template -->
  <xsl:template match="tei:msItem" mode="toc">
    <xsl:variable name="msID" select="ancestor-or-self::tei:msDescription/@xml:id"/>
    <xsl:variable name="elementName" select="name()"/>
    <xsl:variable name="pos" select="position()"/>
    <a href="{concat('#',$msID,'-',$elementName,'-',$pos)}">
      <xsl:value-of select="tei:locus"/>
    </a>
    <xsl:call-template name="punctuate-list"/>
  </xsl:template>

  <!-- physdesc, create a toc entry. -->
  <xsl:template match="tei:physDesc" mode="toc">
    <xsl:variable name="msID" select="ancestor-or-self::tei:msDescription/@xml:id"/>
    <xsl:variable name="elementName" select="name()"/>
    <xsl:variable name="pos" select="position()"/>
    <li>
      <a href="{concat('#',$msID, '-',$elementName,'-',$pos)}">Physical Description</a>
    </li>
  </xsl:template>
	
  <!-- additional , create a toc entry. -->
  <xsl:template match="tei:additional" mode="toc">
    <xsl:variable name="msID" select="ancestor-or-self::tei:msDescription/@xml:id"/>
    <xsl:variable name="elementName" select="name()"/>
    <xsl:variable name="pos" select="position()"/>
    <li>
      <a href="{concat('#',$msID, '-',$elementName,'-',$pos)}">Additional Information</a>
    </li>
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

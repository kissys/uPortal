<?xml version="1.0"?>
<!--xsl:stylesheet xmlns:xsl="http://www.w3.org/XSL/Transform/1.0"-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<!--xsl:output method="xml" indent="yes" xml-declaration="no"/-->
<!--xsl:output method="html"/-->
<!--xsl:strip-space elements="*"/-->

  <xsl:template match="layout">
    <wml>
    <template>
     <do type="prev" label="Back">
			<prev/>
     </do>
    </template>

     <xsl:if test="child::tab">
     <card id="toplevelcard">
      <xsl:attribute name="title"><xsl:value-of select="header/title"/></xsl:attribute>
       <do type="prev"><noop/></do>
       <p><b>List of tabs:</b></p>
       <xsl:for-each select="tab">
         <p align="center"><a>
            <xsl:attribute name="href">#tab_<xsl:value-of select="@ID"/></xsl:attribute>
            <xsl:value-of select="@name"/>
            </a>
         </p>
       </xsl:for-each>
     </card>
     <xsl:apply-templates select="tab"/>
     </xsl:if>

     <xsl:if test="child::channel">
     <xsl:apply-templates select="channel"/>
     </xsl:if>

    </wml>
  </xsl:template>

  <!-- Render the content of the active tab-->
  <xsl:template match="tab">
    <card> <xsl:attribute name="id">tab_<xsl:value-of select="@ID"/></xsl:attribute>
           <xsl:attribute name="title">Tab: <xsl:value-of select="@name"/></xsl:attribute>
     <p><b>List of channels:</b></p>
     <xsl:for-each select=".//channel">
       <p align="center" ><a>
            <xsl:attribute name="href">index.jsp?userLayoutRoot=<xsl:value-of select="@ID"/></xsl:attribute>
            <!--xsl:attribute name="href">rss.wml</xsl:attribute-->
            <xsl:value-of select="@name"/>
            </a>
       </p>
     </xsl:for-each>
    </card>
  </xsl:template>


  <!-- process a column within a tab-->
  <xsl:template match="column">
  </xsl:template>

  <!-- process a channel-->
  <xsl:template match="channel">
  <wml>
    <template>
     <do type="prev" label="Back">
      <go>
       <xsl:attribute name="href">index.jsp?userLayoutRoot=root</xsl:attribute>
      </go>
     </do>
    </template>

   <card>
     <xsl:attribute name="id">chan_<xsl:value-of select="@ID"/></xsl:attribute>
     <xsl:attribute name="title">Channel: <xsl:value-of select="@name"/></xsl:attribute>
     <!--xsl:if test="@minimized='false'"-->
      <xsl:copy-of select="."/>
     <!--/xsl:if-->
     <xsl:call-template name="channelHeader"/>
   </card>
  </wml>
  </xsl:template>


  <!-- create channel header-->
  <xsl:template name="channelHeader">

           <xsl:if test="@hasHelp='true'">
            <do type="help" label="Help">
             <go>
            <xsl:attribute name="href">index.jsp?userLayoutTarget=<xsl:value-of select="@ID"/>&amp;action=help</xsl:attribute>
              </go>
            </do>
           </xsl:if>
           <xsl:if test="@editable='true'">
            <do type="edit" label="Edit channel">
             <go>
            <xsl:attribute name="href">index.jsp?userLayoutTarget=<xsl:value-of select="@ID"/>&amp;action=edit</xsl:attribute>
             </go>
            </do>
           </xsl:if>
           <xsl:if test="@minimizable='true'">
            <do type="minimize" label="Minimize channel">
             <go>
            <xsl:attribute name="href">index.jsp?userLayoutTarget=<xsl:value-of select="@ID"/>&amp;action=minimize</xsl:attribute>
             </go>
            </do>
           </xsl:if>
           <xsl:if test="@removable='true'">
            <do type="remove" label="Remove">
             <go>
            <xsl:attribute name="href">index.jsp?userLayoutTarget=<xsl:value-of select="@ID"/>&amp;action=remove</xsl:attribute>
            </go>
            </do>
           </xsl:if>
	   <do type="home" label="Portal Home">
	     <go>
               <xsl:attribute name="href">index.jsp?userLayoutTarget=root</xsl:attribute>
            </go>
	   </do>
  </xsl:template>


  <xsl:template match="header">
  </xsl:template>


</xsl:stylesheet>

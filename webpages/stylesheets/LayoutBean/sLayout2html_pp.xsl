<?xml version="1.0"?>
<!--xsl:stylesheet xmlns:xsl="http://www.w3.org/XSL/Transform/1.0"-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<!--xsl:output method="xml" indent="yes" xml-declaration="yes"/-->
<xsl:output method="html"/>
<!--xsl:strip-space elements="*"/-->


  <xsl:template match="layout">
    <html>
      <head>
       <title><xsl:value-of select="header/title"/></title>
      </head>
      <body bgcolor="white" text="#000000">
      <xsl:apply-templates select="header"/>
      <ul>
      <xsl:for-each select="tab">
        <li>
          <!--a>
           <xsl:attribute name="href">index.jsp?userLayoutRoot=<xsl:value-of select="@ID"/></xsl:attribute-->
           <xsl:value-of select="@name"/>
          <!--/a-->
        </li>
        <ul>
         <xsl:for-each select=".//channel">
          <li>
           <a>
            <xsl:attribute name="href">index.jsp?userLayoutRoot=<xsl:value-of select="@ID"/></xsl:attribute>
            <xsl:value-of select="@name"/>
           </a>
          </li>
         </xsl:for-each>
        </ul>
      </xsl:for-each>
      </ul>
      <hr/>
      <!--xsl:apply-templates select="tab[position()=1]"/-->

      </body>
    </html>
  </xsl:template>

  <!-- Render the content of the active tab-->
  <xsl:template match="tab">
    <h2><xsl:value-of select="@name"/></h2>
    <xsl:for-each select="column">
      <hr/>
      <xsl:for-each select="channel">
        <xsl:apply-templates select="."/>
        <br/>
      </xsl:for-each>
    </xsl:for-each>

    <xsl:for-each select="channel">
     <xsl:apply-templates select="."/>
     <br/>
    </xsl:for-each>


  </xsl:template>


  <!-- process a column within a tab-->
  <xsl:template match="column">
  </xsl:template>

  <!-- process a channel-->
  <xsl:template match="channel">
  <table border="1" cellpadding="0" cellspacing="0" width="100%">
   <tr>
       <!-- draw the header -->
       <xsl:call-template name="channelHeader"/>
   </tr>
    <!-- draw channel content-->
   <tr><td colspan="2">
     <xsl:if test="@minimized='false'">
      <xsl:copy-of select="."/>
     </xsl:if>
    </td></tr>
  </table>
  </xsl:template>


  <!-- create channel header-->
  <xsl:template name="channelHeader">
          <td bgcolor="cccccc">
          <b><xsl:text disable-output-escaping="yes"> </xsl:text><xsl:value-of select="@name"/></b></td>
          <td nowrap="true" bgcolor="cccccc" valign="center" align="right">
           <xsl:if test="@hasHelp='true'">
            <a>
            <xsl:attribute name="href">index.jsp?userLayoutTarget=<xsl:value-of select="@ID"/>&amp;action=help</xsl:attribute>
            <img border="0" width="18" height="15" src="images/pp/help.gif" alt="Help"/>
            </a>
           </xsl:if>
           <xsl:if test="@editable='true'">
            <a>
            <xsl:attribute name="href">index.jsp?userLayoutTarget=<xsl:value-of select="@ID"/>&amp;action=edit</xsl:attribute>
            <img border="0" width="23" height="15" src="images/pp/edit.gif" alt="Edit"/>
            </a>
           </xsl:if>
           <xsl:if test="@removable='true'">
            <a>
            <xsl:attribute name="href">index.jsp?userLayoutTarget=<xsl:value-of select="@ID"/>&amp;action=remove</xsl:attribute>
            <img border="0" width="18" height="15" src="images/pp/remove.gif" alt="Remove"/>
            </a>
           </xsl:if>
            <a>
             <xsl:attribute name="href">index.jsp?userLayoutRoot=root</xsl:attribute>
             <img border="0" width="18" height="15" src="images/pp/home.gif" alt="Remove"/>
            </a>
          </td>
  </xsl:template>


  <xsl:template match="header">
	<img src="images/logo_75_teal.gif" alt="JASIG Portal"/>
  </xsl:template>

  <xsl:template match="title">
    <h1>
      <xsl:value-of select="." />
    </h1>
  </xsl:template>

  <xsl:template match="image">
    <a>
    <xsl:attribute name="href">
     <xsl:value-of select="link"/>
    </xsl:attribute>
    <img hspace="10">
        <xsl:attribute name="src">
         <xsl:value-of select="url"/>
        </xsl:attribute>
        <xsl:attribute name="alt">
         <xsl:value-of select="description"/>
        </xsl:attribute>
        <xsl:attribute name="width">
         <xsl:value-of select="width"/>
        </xsl:attribute>
        <xsl:attribute name="height">
         <xsl:value-of select="height"/>
        </xsl:attribute>
    </img>
    </a>
  </xsl:template>

</xsl:stylesheet>
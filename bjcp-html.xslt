<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
      <html>
        <head>
          <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
          <title>BJCP Style Guidelines</title>
        </head>
        <body>
          <xsl:for-each select="styleguide/class">
                <xsl:apply-templates select="category"></xsl:apply-templates>
          </xsl:for-each>
        </body>
      </html>
    </xsl:template>
    
    <xsl:template match="category">
        <xsl:variable name="id"><xsl:value-of select="@id"/></xsl:variable>
        <div class="style-category" id="{$id}">
        <h1>
          <xsl:value-of select="@id"/><xsl:text> </xsl:text><xsl:value-of select="name"/>
        </h1>
        <xsl:for-each select="notes">
          <p class="category-info">
            <xsl:apply-templates select="@* | node()"/>
          </p>
        </xsl:for-each>
        <xsl:apply-templates select="subcategory"/>
        </div>
    </xsl:template>
    
    <xsl:template match="subcategory">
        <xsl:variable name="id"><xsl:value-of select="@id"/></xsl:variable>
        <div class="style" id="{$id}">
        <xsl:if test="not(contains($id, '-'))">
            <h2><xsl:value-of select="@id"/><xsl:text> </xsl:text><xsl:value-of select="name"/></h2>           
        </xsl:if>
        <xsl:if test="contains($id, '-')">
            <h3><xsl:value-of select="name"/></h3>           
        </xsl:if>
        <xsl:for-each select="*[not(self::stats|self::name)]">
            <xsl:variable name="section_name">
                <xsl:value-of select="local-name()"/>
            </xsl:variable>
            <xsl:variable name="smallcase" select="'abcdefghijklmnopqrstuvwxyz'" />
            <xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />
            <p class="{$section_name}">
                <xsl:variable name="section_label" select="concat(translate(substring($section_name,1,1), $smallcase, $uppercase), substring($section_name,2))"/>
                <span class="description_section_label"><xsl:value-of select="$section_label"/>:</span><xsl:text> </xsl:text>
                <xsl:apply-templates select="@* | node()"/>  
            </p>
        </xsl:for-each>
        <xsl:apply-templates select="stats"/>
        </div>
    </xsl:template>
    
    <xsl:template match="stats">
        <div class="stats">
            <ul>
                <xsl:for-each select="*[not(self::exceptions)]">
                    <li class="{local-name()}"><span class="stat-listitem-label"><xsl:value-of select="local-name()"/>:</span><xsl:text> </xsl:text>
                    <span class="value_low"><xsl:value-of select="low"/></span> - <span class="value_high"><xsl:value-of select="high"/></span></li>
                </xsl:for-each>
            </ul>
            <xsl:if test="exceptions">
                <p class="exceptions"><span class="description_section_tag">Exceptions:</span>
                    <xsl:apply-templates select="@* | node()"/>  
                </p>
            </xsl:if>
        </div>
    </xsl:template>
    
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
      
</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:xs="http://www.w3.org/2001/XMLSchema"
        xmlns:array="http://www.w3.org/2005/xpath-functions/array"
        xmlns:map="http://www.w3.org/2005/xpath-functions/map"
        xmlns:math="http://www.w3.org/2005/xpath-functions/math"
        xmlns:fn="http://www.w3.org/2005/xpath-functions"
        exclude-result-prefixes="xs array map math fn"
        xml:id="index"
        xml:lang="en"
        version="3.0"
>
    <xsl:output method="html" indent="yes"/>
    <xsl:mode on-no-match="shallow-copy"/>
    <xsl:param name="currentPage" select="'index.xml'"/>
    <xsl:param name="page" select="'Home'"/>
    <xsl:include href="navbar.xsl"/>
    <xsl:include href="head.xsl"/>

    <xsl:template match="/">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <html>
            <xsl:apply-templates select="document('head.xml')/Head"/>
            <body>
                <xsl:apply-templates select="document('navbar.xml')/Navbar"/>
                <section class="wrapper">
                    <xsl:apply-templates select="document('index.xml')/Index"/>
                </section>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="Index">
        <h1>
            <xsl:value-of select="$page"/>
        </h1>
        <div>
            <h2>
                <xsl:value-of select="Welcome/Title"/>
            </h2>
            <img class="xml-icon" src="images/{Welcome/Image/@src}" alt="{Welcome/Image/@alt}"/>
            <p>
                <xsl:value-of select="Welcome/Message"/>
            </p>
            <h2>
                <a href="{Welcome/Repository/Link/@href}" target="_blank">
                    <xsl:value-of select="Welcome/Repository/Link"/>
                </a>
            </h2>
        </div>


    </xsl:template>

</xsl:stylesheet>
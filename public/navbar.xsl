<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:xs="http://www.w3.org/2001/XMLSchema"
        xmlns:array="http://www.w3.org/2005/xpath-functions/array"
        xmlns:map="http://www.w3.org/2005/xpath-functions/map"
        xmlns:math="http://www.w3.org/2005/xpath-functions/math"
        xmlns:fn="http://www.w3.org/2005/xpath-functions"
        exclude-result-prefixes="xs array map math fn"
        version="3.0"
        xml:id="navbar"
>
    <xsl:output method="html" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="Navbar">
        <nav class="navbar">
            <ul>
                <xsl:apply-templates select="Link"/>
            </ul>
        </nav>
    </xsl:template>

    <xsl:template match="Link">
        <li>
            <xsl:choose>
                <xsl:when test="@href = $currentPage">
                    <a href="{@href}" class="active">
                        <xsl:value-of select="." />
                    </a>
                </xsl:when>
                <xsl:otherwise>
                    <a href="{@href}">
                        <xsl:value-of select="." />
                    </a>
                </xsl:otherwise>
            </xsl:choose>
        </li>
    </xsl:template>
</xsl:stylesheet>
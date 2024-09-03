<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:xs="http://www.w3.org/2001/XMLSchema"
        xmlns:array="http://www.w3.org/2005/xpath-functions/array"
        xmlns:map="http://www.w3.org/2005/xpath-functions/map"
        xmlns:math="http://www.w3.org/2005/xpath-functions/math"
        xmlns:fn="http://www.w3.org/2005/xpath-functions"
        exclude-result-prefixes="#all"
        version="3.0"
>

    <xsl:output method="html" indent="yes" />
    <xsl:variable name="categories" select="document('categories.xml')"/>

    <xsl:template match="/">
        <xsl:apply-templates select="Products"/>
    </xsl:template>

    <xsl:template match="Products">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <html>
            <body>
                <div class="wrapper">

                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="Product">
        <div>
            <h2><xsl:value-of select="Name"/></h2>
            <p>Id: <xsl:value-of select="@Id"/></p>
            <p><xsl:value-of select="Description"/></p>
            <p>Price: <xsl:value-of select="Price"/></p>
            <xsl:if test="SalePrice">
                <p>Sale Price: <xsl:value-of select="SalePrice"/></p>
            </xsl:if>
            <p>On Hand: <xsl:value-of select="OnHand"/></p>
            <p>Categories:</p>
            <ul>
                <xsl:for-each select="Categories/CategoryId">
                    <li>
                        <img src="images/{$categories/Categories/Category[@Id=current()]/Image}"/>
                        <xsl:value-of select="$categories/Categories/Category[@Id=current()]/Name"/>
                        <xsl:if test="position() != last()">, </xsl:if>
                    </li>
                </xsl:for-each>
            </ul>
        </div>
    </xsl:template>

</xsl:stylesheet>
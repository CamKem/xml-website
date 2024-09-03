<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:xs="http://www.w3.org/2001/XMLSchema"
        xmlns:array="http://www.w3.org/2005/xpath-functions/array"
        xmlns:map="http://www.w3.org/2005/xpath-functions/map"
        xmlns:math="http://www.w3.org/2005/xpath-functions/math"
        xmlns:fn="http://www.w3.org/2005/xpath-functions"
        exclude-result-prefixes="xs array map math fn"
        xml:id="categories"
        xml:lang="en"
        version="3.0"
>
    <xsl:output method="html" indent="yes"/>
    <xsl:mode on-no-match="shallow-copy"/>

    <xsl:template match="Head">
        <head>
            <meta charset="UTF-8"/>
            <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
            <title>
                <xsl:value-of select="Title"/>
                <xsl:value-of select="$page"/>
            </title>
            <link rel="stylesheet" href="{Style}"/>
        </head>
    </xsl:template>

</xsl:stylesheet>
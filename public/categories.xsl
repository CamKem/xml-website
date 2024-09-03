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
    <xsl:param name="currentPage" select="'categories.xml'"/>
    <xsl:param name="page" select="'Categories'"/>
    <xsl:include href="navbar.xsl" />
    <xsl:include href="head.xsl" />

    <xsl:template match="/">
        <html>
            <xsl:apply-templates select="document('head.xml')/Head"/>
            <body>
                <xsl:apply-templates select="document('navbar.xml')/Navbar" />
                <section class="wrapper">
                    <h1><xsl:value-of select="$page"/></h1>
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Image</th>
                            </tr>
                        </thead>
                        <tbody>
                            <xsl:for-each select="/Categories/Category">
                                <tr class="category">
                                    <td class="category-id">
                                        <xsl:value-of select="@Id"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="Name"/>
                                    </td>
                                    <td class="category-icon">
                                        <img
                                                alt="{Name}"
                                                class="category-icon__image"
                                                src="images/{Image}"
                                        />
                                        <span class="category-icon__name">
                                            <xsl:value-of select="Image"/>
                                        </span>
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </tbody>
                    </table>
                </section>
            </body>
        </html>

    </xsl:template>

</xsl:stylesheet>
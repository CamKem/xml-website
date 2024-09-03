<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:xs="http://www.w3.org/2001/XMLSchema"
        xmlns:array="http://www.w3.org/2005/xpath-functions/array"
        xmlns:map="http://www.w3.org/2005/xpath-functions/map"
        xmlns:math="http://www.w3.org/2005/xpath-functions/math"
        xmlns:fn="http://www.w3.org/2005/xpath-functions"
        exclude-result-prefixes="xs array map math fn"
        xml:id="products"
        xml:lang="en"
        version="3.0"
>

    <xsl:output method="html" indent="yes"/>
    <xsl:variable name="categories" select="document('categories.xml')"/>
    <xsl:include href="navbar.xsl"/>

    <xsl:template match="/">
        <xsl:apply-templates select="Products"/>
    </xsl:template>

    <xsl:template match="Products">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <html>
            <head>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <title>Products</title>
                <link rel="stylesheet" href="styles.css"/>
            </head>
            <body>
                <xsl:apply-templates select="document('navbar.xml')/Navbar">
                    <xsl:with-param name="currentPage" select="'products.xml'"/>
                </xsl:apply-templates>
                <div class="wrapper">
                    <h1>Products</h1>
                    <table>
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Name</th>
                                <th>Description</th>
                                <th>Price</th>
                                <th>On Hand</th>
                                <th>Categories</th>
                            </tr>
                        </thead>
                        <tbody>
                            <xsl:apply-templates select="Product"/>
                        </tbody>
                    </table>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="Product">
        <tr>
            <td>
                <xsl:value-of select="@Id"/>
            </td>
            <td>
                <xsl:value-of select="Name"/>
            </td>
            <td>
                <xsl:value-of select="Description"/>
            </td>
            <td>
                <p class="price">
                    <xsl:text>$</xsl:text>
                    <xsl:value-of select="Price"/>
                </p>
                <xsl:if test="SalePrice">
                    <p class="sale-price">
                        <xsl:text>$</xsl:text>
                        <xsl:value-of select="SalePrice"/>
                    </p>
                </xsl:if>
            </td>
            <td>
                <xsl:value-of select="OnHand"/>
            </td>
            <td>
                <ul class="categories">
                    <xsl:for-each select="Categories/CategoryId">
                        <a href="categories.xml">
                            <li class="category-icon"
                                style="padding-top: 10px; padding-bottom: 10px;">
                                <img
                                        class="category-icon__image"
                                        alt="{$categories/Categories/Category[@Id=current()]/Name}"
                                        src="images/{$categories/Categories/Category[@Id=current()]/Image}"
                                />
                                <span class="category-icon__name">
                                    <xsl:value-of select="$categories/Categories/Category[@Id=current()]/Name"/>
                                </span>
                            </li>
                        </a>
                    </xsl:for-each>
                </ul>
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet>
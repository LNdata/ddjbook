<?xml version='1.0'?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:fo="http://www.w3.org/1999/XSL/Format">
  <xsl:import href="/usr/share/xml/docbook/stylesheet/docbook-xsl/fo/docbook.xsl"/>
  <xsl:param name="generate.toc" select="'book toc'"/>
  <xsl:param name="paper.type" select="'A4'"/>

  <xsl:template name="book.titlepage.recto">
    <fo:block>
      <fo:external-graphic content-width="scale-to-fit"
                           content-height="100%"
                           width="100%" height="100%"
                           scaling="uniform"
                           src="url(figs/incoming/book_cover.png)" />
    </fo:block>
  </xsl:template>

  <xsl:template name="footer.content">
    <xsl:param name="pageclass" select="''"/>
    <xsl:param name="sequence" select="''"/>
    <xsl:param name="position" select="''"/>
    <xsl:param name="gentext-key" select="''"/>
    <fo:block>
      <!-- pageclass can be front, body, back -->
      <!-- sequence can be odd, even, first, blank -->
      <!-- position can be left, center, right -->
      <xsl:choose>
        <xsl:when test="$pageclass = 'titlepage'">
          <!-- nop; no footer on title pages -->
        </xsl:when>

        <xsl:when test="$double.sided != 0 and $sequence = 'even'
                        and $position='left'">
          <fo:page-number/>
        </xsl:when>

        <xsl:when test="$double.sided != 0 and ($sequence = 'odd' or $sequence = 'first')
                        and $position='right'">
          <fo:page-number/>
        </xsl:when>

        <xsl:when test="$double.sided = 0 and $position='center'">
          <fo:page-number/>
        </xsl:when>

        <xsl:when test="$sequence='blank'">
          <xsl:choose>
            <xsl:when test="$double.sided != 0 and $position = 'left'">
              <fo:page-number/>
            </xsl:when>
            <xsl:when test="$double.sided = 0 and $position = 'center'">
              <fo:page-number/>
            </xsl:when>
            <xsl:otherwise>
              <!-- nop -->
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>


        <xsl:otherwise>
          <!-- nop -->
        </xsl:otherwise>
      </xsl:choose>
    </fo:block>

  </xsl:template>
</xsl:stylesheet>

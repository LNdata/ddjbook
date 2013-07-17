<?xml version='1.0'?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:fo="http://www.w3.org/1999/XSL/Format">
  <xsl:import href="/usr/share/xml/docbook/stylesheet/docbook-xsl/fo/docbook.xsl"/>
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
          <xsl:text>This page intentionally left blank</xsl:text>
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

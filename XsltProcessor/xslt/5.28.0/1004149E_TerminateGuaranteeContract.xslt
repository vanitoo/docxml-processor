<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:tgc="urn:customs.ru:Information:CommercialFinanceDocuments:TerminateGuaranteeContract:5.24.0">
	<!-- Шаблон для типа TerminateGuaranteeContractType -->
	<xsl:template match="tgc:TerminateGuaranteeContract">
	<xsl:param name="w" select="190" />
		<html>
			<head>
				<style>
					body
					{background: #cccccc;}

					div
					{white-space: normal;}

					div.page
					{margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm 10mm 10mm 20mm;
					background: #ffffff;
					border: solid 1pt #000000;}

					.marg-top
					{margin-top:5mm;}

					table
					{width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;}

					table.border tr td
					{border: 1px solid windowtext;}

					.value
					{border-bottom: solid 1px black;
					font-family: Arial;
					font-size: 11pt;
					font-style: italic;}

					.annot
					{font-family: Arial;
					font-size: 11pt;}

					.title
					{font-weight:bold;
					font-family: Arial;
					font-size: 11pt;}

					tr.title td
					{font-weight:bold;
					font-family: Arial;
					font-size: 9pt;}

					.bordered
					{border-collapse: collapse;}

					td.bordered
					{border: solid 1px windowtext;}

					td.graphMain
					{vertical-align:top;}

					td.value.graphMain
					{vertical-align:bottom;}
				</style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b>Соглашение о расторжении договора поручительства</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br />
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="cat_ru:DocumentID" />
							</td>
						</tr>
					</table>
					<xsl:if test="cat_ru:RefDocumentID">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="cat_ru:RefDocumentID" />
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="tgc:ContractNumber">
						<div class="title marg-top">Реквизиты договора поручительства</div>
						<div>
							<xsl:apply-templates select="tgc:ContractNumber">
								<xsl:with-param name="wdth" select="$w" />
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<div class="title marg-top">Сведения о лицах, подписавших соглашение о расторжении договора поручительства</div>
					<table class="bordered">
						<tbody>
							<tr class="title" align="center">
								<td class="graphMain bordered">ФИО лица</td>
								<td class="graphMain bordered">Документ, подтверждающий полномочия лица</td>
							</tr>
							<xsl:for-each select="tgc:AuthorizedPersonDetails">
								<xsl:apply-templates select=".">
									<xsl:with-param name="wdth" select="$w" />
								</xsl:apply-templates>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>

 <!-- Шаблон для типа tgc:AuthorizedPersonDetailsType -->
  <xsl:template match="tgc:AuthorizedPersonDetails">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:apply-templates select="tgc:AuthorizedPerson/cat_ru:PersonSurname" />
          <xsl:text> </xsl:text>
          <xsl:apply-templates select="tgc:AuthorizedPerson/cat_ru:PersonName" />
          <xsl:text> </xsl:text>
          <xsl:apply-templates select="tgc:AuthorizedPerson/cat_ru:PersonMiddleName" />
          <xsl:text>, </xsl:text>
          <xsl:apply-templates select="tgc:AuthorizedPerson/cat_ru:PersonPost" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="tgc:ConfirmingDocument/cat_ru:PrDocumentName" />
          <xsl:text> №</xsl:text>
          <xsl:apply-templates select="tgc:ConfirmingDocument/cat_ru:PrDocumentNumber" />
          <xsl:text> от </xsl:text>
          <xsl:apply-templates select="tgc:ConfirmingDocument/cat_ru:PrDocumentDate" mode="russian_date" />
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:DocumentBaseType -->
  <xsl:template match="tgc:ContractNumber">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:PrDocumentName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование документа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:PrDocumentName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:PrDocumentNumber">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер документа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:PrDocumentNumber" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:PrDocumentDate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Дата документа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <xsl:template name="russian_date">
    <xsl:param name="dateIn" />
    <xsl:choose>
      <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
        <xsl:value-of select="substring($dateIn,9,2)" />
        <xsl:text>.</xsl:text>
        <xsl:value-of select="substring($dateIn,6,2)" />
        <xsl:text>.</xsl:text>
        <xsl:value-of select="substring($dateIn,1,4)" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$dateIn" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="//*[local-name()='TerminateGuaranteeContract']//*" priority="-1">
    <xsl:variable name="xpath">
      <xsl:call-template name="get_xpath">
        <xsl:with-param name="node" select="current()" />
      </xsl:call-template>
    </xsl:variable>
    <element xml_node="{$xpath}">
      <xsl:apply-templates />
    </element>
  </xsl:template>
  <xsl:template name="get_xpath">
    <xsl:param name="node" select="." />
    <xsl:variable name="xpath">
      <xsl:for-each select="$node/ancestor-or-self::*">
        <xsl:variable name="name">
          <xsl:value-of select="name()" />
        </xsl:variable>
        <xsl:variable name="pos">
          <xsl:value-of select="count(node()/parent::*/preceding-sibling::*[name()=$name])" />
        </xsl:variable>
        <xsl:choose>
          <xsl:when test="position()=last()">
            <xsl:value-of select="concat($name,'[',$pos,']')" />
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="concat($name,'[',$pos,']','/')" />
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>
    </xsl:variable>
    <xsl:value-of select="$xpath" />
  </xsl:template>
  <xsl:template match="*" mode="date">
    <xsl:variable name="xpath_date">
      <xsl:call-template name="get_xpath">
        <xsl:with-param name="node" select="." />
      </xsl:call-template>
    </xsl:variable>
    <element xml_node="{$xpath_date}">
      <xsl:call-template name="russian_date">
        <xsl:with-param name="dateIn" select="." />
      </xsl:call-template>
    </element>
  </xsl:template>
  <xsl:template match="*" mode="russian_date">
    <xsl:variable name="xpath_date">
      <xsl:call-template name="get_xpath">
        <xsl:with-param name="node" select="." />
      </xsl:call-template>
    </xsl:variable>
    <element xml_node="{$xpath_date}">
      <xsl:call-template name="russian_date">
        <xsl:with-param name="dateIn" select="." />
      </xsl:call-template>
    </element>
  </xsl:template>
  <xsl:template match="*" mode="translate_number">
    <xsl:variable name="xpath_date">
      <xsl:call-template name="get_xpath">
        <xsl:with-param name="node" select="." />
      </xsl:call-template>
    </xsl:variable>
    <element xml_node="{$xpath_date}">
      <xsl:value-of select="translate(.,'.', ',')" />
    </element>
  </xsl:template>
</xsl:stylesheet>
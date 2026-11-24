<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:CategoryCust="urn:customs.ru:Categories:3.0.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:ripri="urn:customs.ru:Information:RegistrationDocuments:RusIndustrialProdRegInfo:5.28.0">
	<!-- Шаблон для типа RusIndustrialProdRegInfoType -->
	<xsl:template match="ripri:RusIndustrialProdRegInfo">
		<xsl:param name="w" select="190"/>
		<html>
			<head>
				<style>
                  body {
                  background: #cccccc;
                  }

                  div
                  {
                  white-space: normal;
                  }

                  div.page {
                  margin: 10px auto;
                  margin-top: 6pt;
                  margin-bottom: 6pt;
                  padding: 10mm 10mm 10mm 20mm;
                  background: #ffffff;
                  border: solid 1pt #000000;
                  }

                  .marg-top
                  {
                  margin-top:5mm;
                  }

                  table
                  {
                  width: 100%;
                  border: 0;
                  empty-cells: show;
                  border-collapse: collapse;
                  margin-top: 1px;
                  }

                  table.border tr td
                  {
                  border: 1px solid windowtext;
                  }

                  .value
                  {
                  border-bottom: solid 1px black;
                  font-family: Arial;
                  font-size: 11pt;
                  font-style: italic;
                  }

                  .annot
                  {
                  font-family: Arial;
                  font-size: 11pt;
                  }


                  .title
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 11pt;
                  }

                  tr.title td
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 9pt;
                  }



                  .bordered { border-collapse: collapse; }
                  td.bordered
                  {
                  border: solid 1px windowtext;
                  }

                  td.graphMain
                  {
                  vertical-align:top;
                  }
                  td.value.graphMain
                  {
                  vertical-align:bottom;
                  }
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b>Сведения из Реестра российской промышленной продукции</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					
					<xsl:if test="ripri:OrganizationName">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Наименование предприятия</td>
								<td class="graphMain value" style="width:50%">
									<xsl:for-each select="ripri:OrganizationName">
										<xsl:apply-templates select="."/>
										<xsl:if test="position()!=last()">
											<xsl:text>, </xsl:text>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">ОГРН предприятия</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="ripri:OGRN"/>
							</td>
						</tr>
					</table>
					<xsl:if test="ripri:INN">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">ИНН предприятия</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="ripri:INN"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Реестровый номер</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="ripri:RegisterNumber"/>
							</td>
						</tr>
					</table>
					<xsl:if test="ripri:DigitalPassportNumber">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Номер цифрового паспорта</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="ripri:DigitalPassportNumber"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Дата внесения в реестр</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="ripri:RegisterDate" mode="russian_date"/>
							</td>
						</tr>
					</table>
					<xsl:if test="ripri:ValidityDate">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Срок действия</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="ripri:ValidityDate" mode="russian_date"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="ripri:TermRegDate">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Фактическая дата прекращения действия реестровой записи</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="ripri:TermRegDate" mode="russian_date"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Наименование продукции</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="ripri:ProductName"/>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Кодовое обозначение продукции ОКПД 2</td>
							<td class="graphMain value" style="width:50%">
								<xsl:for-each select="ripri:NationalCommodityCode">
									<xsl:apply-templates select="."/>
									<xsl:if test="position()!=last()">
										<xsl:text>, </xsl:text>
									</xsl:if>
								</xsl:for-each>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">ТН ВЭД код продукции</td>
							<td class="graphMain value" style="width:50%">
								<xsl:for-each select="ripri:TNVED">
									<xsl:apply-templates select="."/>
									<xsl:if test="position()!=last()">
										<xsl:text>, </xsl:text>
									</xsl:if>
								</xsl:for-each>
							</td>
						</tr>
					</table>
					<xsl:if test="ripri:ManufacturingStandard">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Стандарт изготовления</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="ripri:ManufacturingStandard"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="ripri:BaseDocument">
						<div class="title marg-top">Основание</div>
						<div>
							<xsl:apply-templates select="ripri:BaseDocument">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="ripri:Conclusion">
						<div class="title marg-top">Заключение</div>
						<div>
							<xsl:apply-templates select="ripri:Conclusion">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа ripri:BaseDocumentType -->
	<xsl:template match="ripri:BaseDocument">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="ripri:DocumentName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ripri:DocumentName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ripri:DocumentNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ripri:DocumentNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ripri:PrDocumentDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ripri:PrDocumentDate" mode="russian_date"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ripri:DocValidityDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Срок действия</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ripri:DocValidityDate" mode="russian_date"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ripri:ConclusionType -->
	<xsl:template match="ripri:Conclusion">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="ripri:Department">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Департамент</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ripri:Department"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ripri:ConclusionNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер заключения</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ripri:ConclusionNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ripri:Document">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Cсылка на документ</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ripri:Document"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="//*[local-name()='RusIndustrialProdRegInfo']//*" priority="-1">
		<xsl:variable name="xpath">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="current()"/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath}">
			<xsl:apply-templates/>
		</element>
	</xsl:template>
	<xsl:template name="get_xpath">
		<xsl:param name="node" select="."/>
		<xsl:variable name="xpath">
			<xsl:for-each select="$node/ancestor-or-self::*">
				<xsl:variable name="name">
					<xsl:value-of select="name()"/>
				</xsl:variable>
				<xsl:variable name="pos">
					<xsl:value-of select="count(node()/parent::*/preceding-sibling::*[name()=$name])"/>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="position()=last()">
						<xsl:value-of select="concat($name,'[',$pos,']')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat($name,'[',$pos,']','/')"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</xsl:variable>
		<xsl:value-of select="$xpath"/>
	</xsl:template>
	<xsl:template match="*" mode="date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="russian_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="translate_number">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="translate(.,'.', ',')"/>
		</element>
	</xsl:template>
</xsl:stylesheet>

<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:RUDECLcat="urn:customs.ru:RUDeclCommonAggregateTypesCust:5.28.0" xmlns:eca="urn:customs.ru:Information:ExchangeDocuments:ExpressCargoAppeal:5.28.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа ExpressCargoAppealType -->
	<xsl:template match="eca:ExpressCargoAppeal">
		<xsl:param name="w" select="277"/>
		<html>
			<head>
				<style>
                  body {
                  background: #cccccc;
                  font-family: Arial;
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
										<b>Обращение таможенного представителя о необходимости внесения изменений (дополнений) в сведения, заявленные в реестр экспресс-грузов</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<!--table>
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="cat_ru:DocumentID"/>
							</td>
						</tr>
					</table>
					<xsl:if test="cat_ru:RefDocumentID">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="cat_ru:RefDocumentID"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="cat_ru:INNSign">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">ИНН владельца МЧД</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="cat_ru:INNSign"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="cat_ru:MCD_ID">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Единый регистрационный номер доверенности в формате МЧД</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="cat_ru:MCD_ID"/>
								</td>
							</tr>
						</table>
					</xsl:if-->
					<xsl:if test="eca:DocType">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Тип документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:choose>
										<xsl:when test="eca:DocType = 1">обращение к КПТДЭГ</xsl:when>
										<xsl:when test="eca:DocType = 2">обращение к КДТЭГ</xsl:when>
									</xsl:choose>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Обоснование необходимости внесения изменений (дополнений)</td>
							<td class="graphMain value" style="width:50%">
								<xsl:apply-templates select="eca:Reasons"/>
							</td>
						</tr>
					</table>
					<xsl:if test="eca:RequestDate">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Дата обращения</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="eca:RequestDate" mode="russian_date"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="eca:RegNumber">
						<div class="title marg-top">Регистрационный номер реестра</div>
						<div>
							<xsl:apply-templates select="eca:RegNumber">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<div class="title marg-top">Описание вносимых изменений (дополнений) на уровне накладной</div>
					<table class="bordered">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered" width="1%">Уникальный идентификатор партии товаров в текущем реестре</td>
								<td class="graphMain bordered" width="1%">Порядковый номер индивидуальной накладной</td>
								<td class="graphMain bordered" width="10%">Сведения об индивидуальной накладной</td>
								<td class="graphMain bordered">Описание вносимых изменений (дополнений)</td>
							</tr>
							<xsl:for-each select="eca:HouseWaybill">
								<xsl:apply-templates select=".">
									<xsl:with-param name="wdth" select="$w"/>
								</xsl:apply-templates>
							</xsl:for-each>
						</tbody>
					</table>
					<xsl:if test="eca:Comments">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Общее описание вносимых изменений (дополнений)</td>
								<td class="graphMain value" style="width:50%">
									<xsl:apply-templates select="eca:Comments"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="eca:BrokerRegistryDocDetails">
						<div class="title marg-top">Сведения о включении лица в реестр таможенных представителей</div>
						<div>
							<xsl:apply-templates select="eca:BrokerRegistryDocDetails">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа RUDECLcat:BrokerRegistryDocDetailsType -->
	<xsl:template match="eca:BrokerRegistryDocDetails">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="RUDECLcat:DocKindCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код вида документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUDECLcat:DocKindCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUDECLcat:CountryA2Code">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Кодовое обозначение страны</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUDECLcat:CountryA2Code"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Регистрационный номер в реестре таможенных представителей</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="RUDECLcat:RegistrationNumberId"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа eca:ChangesDescriptionType -->
	<xsl:template match="eca:ChangesDescription">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<!--div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;"-->
		<xsl:if test="position() != 1"><br/><br/></xsl:if>
		<xsl:text>Номер товара/записи: </xsl:text>
		<xsl:apply-templates select="eca:RecNumber"/><br/>
		<xsl:text>Номер графы: </xsl:text>
		<xsl:apply-templates select="eca:GRNumber"/><br/>
		<xsl:text>Ранее указанные сведения: </xsl:text>
		<xsl:apply-templates select="eca:PreviousData"/><br/>
		<xsl:text>Измененные/дополненные сведения: </xsl:text>
		<xsl:apply-templates select="eca:CorrectData"/><br/>
		<!--/div-->
	</xsl:template>
	<!-- Шаблон для типа eca:HouseWaybillType -->
	<xsl:template match="eca:HouseWaybill">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="eca:WayBillID"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="eca:ObjectOrdinal"/>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="eca:HouseWaybillDetails">
						<xsl:apply-templates select="eca:HouseWaybillDetails">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="eca:ChangesDescription">
						<xsl:apply-templates select="eca:ChangesDescription">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:DocumentBaseType -->
	<xsl:template match="eca:HouseWaybillDetails">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		
		<xsl:apply-templates select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:DocNumberType -->
	<xsl:template match="eca:RegNumber">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Номер</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:CustomsCode"/>
						<xsl:text>/</xsl:text>
						<xsl:apply-templates select="cat_ru:RegistrationDate" mode="num_date"/>
						<xsl:text>/</xsl:text>
						<xsl:apply-templates select="cat_ru:GTDNumber"/>
						<xsl:if test="RUScat_ru:AddNumber">
							<xsl:text>-</xsl:text>
							<xsl:apply-templates select="RUScat_ru:AddNumber"/>
						</xsl:if>
					</td>
				</tr>
			</table>
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
	<xsl:template match="//*[local-name()='ExpressCargoAppeal']//*" priority="-1">
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

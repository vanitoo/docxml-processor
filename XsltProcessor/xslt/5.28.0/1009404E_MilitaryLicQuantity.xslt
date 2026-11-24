<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:mlq="urn:customs.ru:Information:SQDocuments:MilitaryLicQuantity:5.24.0">
	<!-- Шаблон для типа MilitaryLicQuantityType -->
	<xsl:template match="mlq:MilitaryLicQuantity">
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
										<b>
											<xsl:choose>
												<xsl:when test="mlq:DocType='1'">
													<xsl:text>Перечень продукции военного назначения, выпуск которой осуществляется по согласованию с таможенным постом фактического контроля</xsl:text>
												</xsl:when>
												<xsl:when test="mlq:DocType='2'">
													<xsl:text>Информация о резервировании в ТПФК</xsl:text>
												</xsl:when>
												<xsl:when test="mlq:DocType='3'">
													<xsl:text>Перечень продукции военного назначения, в отношении которой произведен выпуск</xsl:text>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="mlq:DocType"/>
												</xsl:otherwise>
											</xsl:choose>
										</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Номер декларации на товары</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="mlq:DT"/>
							</td>
						</tr>
					</table>
					<xsl:if test="mlq:DocNumber/cat_ru:PrDocumentNumber">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Номер лицензии</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="mlq:DocNumber/cat_ru:PrDocumentNumber"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mlq:DocNumber/cat_ru:PrDocumentDate">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Дата лицении</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="mlq:DocNumber/cat_ru:PrDocumentDate" mode="russian_date"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="mlq:ActionEnd">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Срок действия лицензии</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="mlq:ActionEnd" mode="russian_date"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Направление перемещения товара (экспорт/ импорт)</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="mlq:Direction"/>
							</td>
						</tr>
					</table>
					<xsl:if test="mlq:CountryCode">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Страна отправителя (при экспорте)/получателя (при импорте)</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="mlq:CountryCode"/>
									<xsl:text> </xsl:text>
									<xsl:apply-templates select="mlq:CountryName"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:choose>
						<xsl:when test="mlq:DocType = 3">
							<table class="bordered">
								<tbody>
									<tr class="title">
										<td class="graphMain bordered">№ п/п</td>
										<td class="graphMain bordered">№ товара в декларации на товары</td>
										<td class="graphMain bordered">Наименование товара</td>
										<td class="graphMain bordered">Единица измерения</td>
										<td class="graphMain bordered">Количество</td>
									</tr>
									<tr class="title" align="center">
										<td class="graphMain bordered">1</td>
										<td class="graphMain bordered">2</td>
										<td class="graphMain bordered">3</td>
										<td class="graphMain bordered">4</td>
										<td class="graphMain bordered">5</td>
									</tr>
									<xsl:for-each select="mlq:Goods">
										<xsl:apply-templates select="." mode="is3"/>
									</xsl:for-each>
								</tbody>
							</table>
						</xsl:when>
						<xsl:otherwise>
							<table class="bordered">
								<tbody>
									<tr class="title">
										<td class="graphMain bordered">№ п/п</td>
										<td class="graphMain bordered">№ товара в декларации на товары</td>
										<td class="graphMain bordered">Наименование товара</td>
										<td class="graphMain bordered">Единица измерения</td>
										<td class="graphMain bordered">Количество в ДТ в единицах измерения</td>
										<td class="graphMain bordered">Количество, допустимое к выпуску</td>
									</tr>
									<tr class="title" align="center">
										<td class="graphMain bordered">1</td>
										<td class="graphMain bordered">2</td>
										<td class="graphMain bordered">3</td>
										<td class="graphMain bordered">4</td>
										<td class="graphMain bordered">5</td>
										<td class="graphMain bordered">6</td>
									</tr>
									<xsl:for-each select="mlq:Goods">
										<xsl:apply-templates select="." mode="not3"/>
									</xsl:for-each>
								</tbody>
							</table>
						</xsl:otherwise>
					</xsl:choose>
					
					<xsl:if test="mlq:CustomsPost">
						<div class="title marg-top">Таможенный пост, который осуществляет учет количества продукции военного назначения</div>
						<div>
							<xsl:apply-templates select="mlq:CustomsPost">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:SupplementaryQuantityType -->
	<xsl:template match="mlq:BalanceQuantityDEI">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:GoodsQuantity" mode="translate_number"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:MeasureUnitQualifierName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="cat_ru:MeasureUnitQualifierCode"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsType -->
	<xsl:template match="mlq:CustomsPost">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код таможенного органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:Code"/>
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:OfficeName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование таможенного органа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:OfficeName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="mlq:DT">
		<xsl:apply-templates select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:RegistrationDate" mode="num_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:GTDNumber"/>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:SupplementaryQuantityType -->
	<xsl:template match="*" mode="quantity">
		<xsl:if test="position() != 1"><br/></xsl:if>
		<xsl:apply-templates select="cat_ru:GoodsQuantity" mode="translate_number"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:MeasureUnitQualifierName"/>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode">
			<xsl:text> (</xsl:text>
			<xsl:apply-templates select="cat_ru:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:DocBaseV4Type -->
	<xsl:template match="mlq:DocNumber">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="cat_ru:PrDocumentName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PrDocumentName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PrDocumentNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:PrDocumentDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата документа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="RUScat_ru:DocKindCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код вида документа в соответствии с классификатором видов документов и сведений, используемых при таможенном декларировании</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:DocKindCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа mlq:GoodsType -->
	<xsl:template match="mlq:Goods" mode="not3">
		<tr>
			<td class="graphMain bordered">
				<xsl:apply-templates select="mlq:Position"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="mlq:GoodsNumeric"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="mlq:GoodsName"/>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="mlq:DTQuantityDEI/cat_ru:MeasureUnitQualifierName">
					<xsl:if test="position() != 1"><br/></xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="mlq:DTQuantityDEI/cat_ru:GoodsQuantity">
					<xsl:if test="position() != 1"><br/></xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="mlq:BalanceQuantityDEI" mode="quantity"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="mlq:Goods" mode="is3">
		<tr>
			<td class="graphMain bordered">
				<xsl:apply-templates select="mlq:Position"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="mlq:GoodsNumeric"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="mlq:GoodsName"/>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="mlq:DTQuantityDEI/cat_ru:MeasureUnitQualifierName">
					<xsl:if test="position() != 1"><br/></xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
			<td class="graphMain bordered">
				<xsl:for-each select="mlq:DTQuantityDEI/cat_ru:GoodsQuantity">
					<xsl:if test="position() != 1"><br/></xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</td>
		</tr>
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
	<xsl:template name="num_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="//*[local-name()='MilitaryLicQuantity']//*" priority="-1">
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
	<xsl:template match="*" mode="num_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="num_date">
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

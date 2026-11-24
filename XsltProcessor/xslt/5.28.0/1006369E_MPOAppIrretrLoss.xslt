<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:mpco="urn:customs.ru:Information:CustomsDocuments:MPOCommon:5.24.0" xmlns:mal="urn:customs.ru:Information:RegistrationDocuments:MPOAppIrretrLoss:5.24.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа MPOAppIrretrLossType -->
	<xsl:template match="mal:MPOAppIrretrLoss">
		<xsl:param name="w" select="297"/>
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
										<b>Обращение о безвозвратной утрате МПО</b>
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
					<xsl:if test="mal:AuthorizedOperator">
						<div class="title marg-top">Уполномоченный оператор</div>
						<div>
							<xsl:apply-templates select="mal:AuthorizedOperator">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="mal:MPOReestr">
						<div class="title marg-top">Регистрационный номер реестра МПО</div>
						<div>
							<xsl:apply-templates select="mal:MPOReestr">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="mal:AppDate">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Дата обращения</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="mal:AppDate" mode="russian_date"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный номер записи МПО в реестре</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="mal:MPO_ID"/>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Номер МПО</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="mal:MPORegNum"/>
							</td>
						</tr>
					</table>
					<div class="title marg-top">Товары МПО</div>
					<table class="bordered">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered">Номер по порядку</td>
								<td class="graphMain bordered">Наименование (русский)</td>
								<td class="graphMain bordered">Наименование (иностранный)</td>
								<td class="graphMain bordered">Наименование объекта интеллектуальной собственности</td>
								<td class="graphMain bordered">Марка</td>
								<td class="graphMain bordered">Модель</td>
								<td class="graphMain bordered">Вес, нетто (кг)</td>
								<td class="graphMain bordered">Вес, брутто (кг)</td>
								<td class="graphMain bordered">Код по ТН ВЭД ЕАЭС</td>
								<td class="graphMain bordered">Стоимость, руб.</td>
								<td class="graphMain bordered">Стоимость, евро</td>
								<td class="graphMain bordered">Код страны происхождения</td>
								<td class="graphMain bordered">Количество</td>
								<td class="graphMain bordered">Ссылка в интернет магазине</td>
							</tr>
							<xsl:for-each select="mal:MPOGoods">
								<xsl:apply-templates select=".">
									<xsl:with-param name="wdth" select="$w"/>
								</xsl:apply-templates>
							</xsl:for-each>
						</tbody>
					</table>
					<xsl:if test="mal:Comments">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Обстоятельства, при которых МПО и пересылаемые в нем товары были безвозвратно утрачены </td>
								<td class="graphMain value" style="width:50%">
									<xsl:for-each select="mal:Comments">
										<xsl:value-of select="."/>
										<xsl:if test="position()!=last()">
											<xsl:text>, </xsl:text>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
						</table>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа mpco:AuthorizedOperatorType -->
	<xsl:template match="mal:AuthorizedOperator">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="mpco:OKPO">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ОКПО</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="mpco:OKPO"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа mpco:GoodsType -->
	<xsl:template match="mal:MPOGoods">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="mpco:ListNumeric"/>
				</td>
				<td class="graphMain bordered">
					<xsl:for-each select="mpco:GoodDescription">
						<xsl:if test="position()!=1">
							<br/>
						</xsl:if>
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</td>
				<td class="graphMain bordered">
					<xsl:for-each select="mpco:GoodDescriptionForeign">
						<xsl:if test="position()!=1">
							<br/>
						</xsl:if>
						<xsl:apply-templates select="."/>
					</xsl:for-each>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="mpco:TradeMark"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="mpco:GoodsMark"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="mpco:GoodsModel"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="mpco:NetWeight" mode="translate_number"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="mpco:GrossWeight" mode="translate_number"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="mpco:TNVEDCode"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="mpco:CostRUS" mode="translate_number"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="mpco:CostEURO" mode="translate_number"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="mpco:OriginCountryCode"/>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="mpco:GoodsQuantity">
						<xsl:apply-templates select="mpco:GoodsQuantity">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="mpco:URLGood"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа mpco:MPO_RegistrationType -->
	<xsl:template match="mal:MPOReestr">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Номер</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="mpco:CustomsCode"/>
						<xsl:text>/</xsl:text>
						<xsl:apply-templates select="mpco:RegistrationDate" mode="num_date"/>
						<xsl:text>/</xsl:text>
						<xsl:apply-templates select="mpco:MPO_Number"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:SupplementaryQuantityType -->
	<xsl:template match="mpco:GoodsQuantity">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<xsl:apply-templates select="cat_ru:GoodsQuantity" mode="translate_number"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:MeasureUnitQualifierName"/>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode">
			<xsl:text> (</xsl:text>
			<xsl:apply-templates select="cat_ru:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
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
	<xsl:template match="//*[local-name()='MPOAppIrretrLoss']//*" priority="-1">
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
